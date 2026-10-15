import 'dart:convert';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import '../models/dhaka_news_model.dart';

class DhakaNewsService {
  static List<DhakaNewsHeadline>? _cachedHeadlines;
  static DateTime? _lastFetchTime;
  static const Duration _cacheDuration = Duration(minutes: 10);

  static const String bbcBanglaRss = 'https://feeds.bbci.co.uk/bengali/rss.xml';
  static const String dailyStarBanglaRss = 'https://bangla.thedailystar.net/rss.xml';

  /// Fetch top headlines from authorized Bangla RSS feeds with caching and deduplication
  static Future<List<DhakaNewsHeadline>> fetchLatestHeadlines({bool forceRefresh = false}) async {
    final now = DateTime.now();
    if (!forceRefresh &&
        _cachedHeadlines != null &&
        _cachedHeadlines!.isNotEmpty &&
        _lastFetchTime != null &&
        now.difference(_lastFetchTime!) < _cacheDuration) {
      return _cachedHeadlines!;
    }

    List<DhakaNewsHeadline> fetched = [];

    // Attempt 1: BBC Bangla RSS
    try {
      final bbcItems = await _fetchRss(bbcBanglaRss, 'বিবিসি বাংলা');
      if (bbcItems.isNotEmpty) {
        fetched.addAll(bbcItems);
      }
    } catch (_) {}

    // Attempt 2: The Daily Star Bangla RSS if needed or to enrich
    if (fetched.length < 5) {
      try {
        final starItems = await _fetchRss(dailyStarBanglaRss, 'ডেইলি স্টার');
        if (starItems.isNotEmpty) {
          fetched.addAll(starItems);
        }
      } catch (_) {}
    }

    // Deduplicate and filter
    final seenTitles = <String>{};
    final uniqueHeadlines = <DhakaNewsHeadline>[];

    for (var item in fetched) {
      final cleanTitle = item.title.trim();
      if (cleanTitle.isNotEmpty && !seenTitles.contains(cleanTitle)) {
        seenTitles.add(cleanTitle);
        uniqueHeadlines.add(item);
      }
    }

    if (uniqueHeadlines.isNotEmpty) {
      _cachedHeadlines = uniqueHeadlines;
      _lastFetchTime = now;
      return uniqueHeadlines;
    }

    if (_cachedHeadlines != null && _cachedHeadlines!.isNotEmpty) {
      return _cachedHeadlines!;
    }

    return getFallbackHeadlines();
  }

  static Future<List<DhakaNewsHeadline>> _fetchRss(String url, String sourceName) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(seconds: 5);
    final request = await client.getUrl(Uri.parse(url));
    request.headers.set('User-Agent', 'DhakaLife-App/1.0 (Android; Mobile)');
    final response = await request.close().timeout(const Duration(seconds: 5));

    if (response.statusCode != 200) {
      return [];
    }

    final body = await response.transform(utf8.decoder).join();
    return parseRssXml(body, sourceName);
  }

  /// Parses RSS XML and extracts titles and links safely
  static List<DhakaNewsHeadline> parseRssXml(String xml, String sourceName) {
    final List<DhakaNewsHeadline> items = [];
    final itemPattern = RegExp(r'<item>([\s\S]*?)<\/item>', caseSensitive: false);
    final titlePattern = RegExp(r'<title>(?:<!\[CDATA\[)?([\s\S]*?)(?:\]\]>)?<\/title>', caseSensitive: false);
    final linkPattern = RegExp(r'<link>(?:<!\[CDATA\[)?([\s\S]*?)(?:\]\]>)?<\/link>', caseSensitive: false);
    final datePattern = RegExp(r'<pubDate>(?:<!\[CDATA\[)?([\s\S]*?)(?:\]\]>)?<\/pubDate>', caseSensitive: false);

    for (final match in itemPattern.allMatches(xml)) {
      final itemBlock = match.group(1) ?? '';
      final titleMatch = titlePattern.firstMatch(itemBlock);
      final linkMatch = linkPattern.firstMatch(itemBlock);
      final dateMatch = datePattern.firstMatch(itemBlock);

      if (titleMatch != null && linkMatch != null) {
        String title = titleMatch.group(1)?.trim() ?? '';
        String link = linkMatch.group(1)?.trim() ?? '';
        String? date = dateMatch?.group(1)?.trim();

        // Clean any residual HTML entities
        title = title
            .replaceAll('&amp;', '&')
            .replaceAll('&quot;', '"')
            .replaceAll('&#039;', "'")
            .replaceAll('&lt;', '<')
            .replaceAll('&gt;', '>');

        if (title.isNotEmpty && link.isNotEmpty) {
          items.add(DhakaNewsHeadline(
            title: title,
            url: link,
            source: sourceName,
            pubDate: date,
          ));
        }
      }
    }

    return items;
  }

  /// Curated fallback headlines when offline or when syndication is unavailable
  static List<DhakaNewsHeadline> getFallbackHeadlines() {
    return [
      DhakaNewsHeadline(
        title: 'মেট্রোরেলে ভিড় কমাতে পিক আওয়ারে ট্রেনের ব্যবধান কমানোর পরিকল্পনা',
        url: 'https://bangla.bdnews24.com/',
        source: 'বিডিনিউজ২৪',
      ),
      DhakaNewsHeadline(
        title: 'রাজধানীর বাজারে নিত্যপণ্যের সরবরাহ স্বাভাবিক রাখতে ডিএনসিসি-ডিএসসিসির বিশেষ তদারকি',
        url: 'https://bangla.thedailystar.net/',
        source: 'ডেইলি স্টার',
      ),
      DhakaNewsHeadline(
        title: 'জাতীয় বিশ্ববিদ্যালয়ের সকল সাম্প্রতিক বিজ্ঞপ্তি সরাসরি অ্যাপে দেখার সুবিধা চালু',
        url: 'https://www.nu.ac.bd/recent-news-notice.php',
        source: 'এনইউ নোটিশ',
      ),
      DhakaNewsHeadline(
        title: 'ঢাকার ডেঙ্গু প্রতিরোধে সিটি করপোরেশনের বিশেষ মশক নিধন অভিযান চলমান',
        url: 'https://epaper.prothomalo.com/Home/',
        source: 'প্রথম আলো',
      ),
    ];
  }

  /// Launch original news article in external browser
  static Future<bool> launchArticle(String url) async {
    try {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        return await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (_) {}
    return false;
  }
}
