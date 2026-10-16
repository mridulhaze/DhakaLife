import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project_nutcm_1/models/dhaka_news_model.dart';
import 'package:flutter_project_nutcm_1/services/dhaka_news_service.dart';

void main() {
  group('DhakaNewsHeadline Model Tests', () {
    test('Serializes to and from JSON correctly', () {
      final item = DhakaNewsHeadline(
        title: 'মেট্রোরেল সময়সূচি আপডেট',
        url: 'https://bangla.bdnews24.com/metro',
        source: 'বিডিনিউজ২৪',
        pubDate: '2026-10-15',
        imageUrl: 'https://images.sample.com/thumb.jpg',
      );

      final json = item.toJson();
      expect(json['title'], 'মেট্রোরেল সময়সূচি আপডেট');
      expect(json['source'], 'বিডিনিউজ২৪');
      expect(json['imageUrl'], 'https://images.sample.com/thumb.jpg');

      final reconstructed = DhakaNewsHeadline.fromJson(json);
      expect(reconstructed.title, item.title);
      expect(reconstructed.url, item.url);
      expect(reconstructed.source, item.source);
      expect(reconstructed.imageUrl, item.imageUrl);
    });
  });

  group('DhakaNewsService RSS XML Parsing & Logic', () {
    test('Parses RSS XML with CDATA, images and standard tags', () {
      const sampleXml = '''
<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:media="http://search.yahoo.com/mrss/">
  <channel>
    <title>Sample News</title>
    <item>
      <title><![CDATA[ঢাকায় ট্রাফিকের নতুন উদ্যোগ &amp; মেট্রো সেবা]]></title>
      <link>https://sample.news/article/1</link>
      <pubDate>Thu, 15 Oct 2026 12:00:00 GMT</pubDate>
      <media:thumbnail url="https://sample.news/images/metro.jpg" width="240" height="134" />
    </item>
    <item>
      <title>জাতীয় বিশ্ববিদ্যালয়ের নোটিশ প্রকাশ</title>
      <link>https://sample.news/article/2</link>
      <pubDate>Thu, 15 Oct 2026 11:30:00 GMT</pubDate>
    </item>
  </channel>
</rss>
''';

      final items = DhakaNewsService.parseRssXml(sampleXml, 'টেস্ট সোর্স');
      expect(items.length, 2);
      expect(items[0].title, 'ঢাকায় ট্রাফিকের নতুন উদ্যোগ & মেট্রো সেবা');
      expect(items[0].url, 'https://sample.news/article/1');
      expect(items[0].source, 'টেস্ট সোর্স');
      expect(items[0].imageUrl, 'https://sample.news/images/metro.jpg');
      expect(items[1].title, 'জাতীয় বিশ্ববিদ্যালয়ের নোটিশ প্রকাশ');
    });

    test('Returns non-empty fallback headlines when offline', () {
      final fallbacks = DhakaNewsService.getFallbackHeadlines();
      expect(fallbacks.isNotEmpty, true);
      for (final f in fallbacks) {
        expect(f.title.isNotEmpty, true);
        expect(f.url.startsWith('http'), true);
        expect(f.source.isNotEmpty, true);
      }
    });

    test('fetchLatestHeadlines executes and provides headlines without throwing', () async {
      final headlines = await DhakaNewsService.fetchLatestHeadlines();
      expect(headlines, isNotEmpty);
      expect(headlines.first.title, isNotEmpty);
      expect(headlines.first.source, isNotEmpty);
    });
  });
}
