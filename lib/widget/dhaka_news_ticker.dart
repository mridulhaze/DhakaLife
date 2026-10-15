import 'dart:async';
import 'package:flutter/material.dart';
import '../models/dhaka_news_model.dart';
import '../services/dhaka_news_service.dart';

class DhakaNewsTicker extends StatefulWidget {
  const DhakaNewsTicker({Key? key}) : super(key: key);

  @override
  State<DhakaNewsTicker> createState() => _DhakaNewsTickerState();
}

class _DhakaNewsTickerState extends State<DhakaNewsTicker> {
  List<DhakaNewsHeadline> _headlines = [];
  bool _isLoading = true;
  int _currentIndex = 0;
  Timer? _autoScrollTimer;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _loadNews();
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _loadNews({bool forceRefresh = false}) async {
    final list = await DhakaNewsService.fetchLatestHeadlines(forceRefresh: forceRefresh);
    if (mounted) {
      setState(() {
        _headlines = list;
        _isLoading = false;
        _currentIndex = 0;
      });
      _startAutoScroll();
    }
  }

  void _startAutoScroll() {
    _autoScrollTimer?.cancel();
    if (_headlines.length <= 1) return;

    _autoScrollTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (!mounted || _headlines.isEmpty) return;
      final nextIndex = (_currentIndex + 1) % _headlines.length;
      _pageController.animateToPage(
        nextIndex,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Row(
          children: const [
            SizedBox(
              width: 14,
              height: 14,
              child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFFE53935)),
            ),
            SizedBox(width: 8),
            Text(
              'সংবাদ লোড হচ্ছে...',
              style: TextStyle(fontSize: 12, color: Color(0xFF64748B)),
            ),
          ],
        ),
      );
    }

    if (_headlines.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: IntrinsicHeight(
          child: Row(
            children: [
              // Badge Pill: "সংবাদ"
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: const BoxDecoration(
                  color: Color(0xFFEF4444),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.bolt, color: Colors.white, size: 16),
                    SizedBox(width: 2),
                    Text(
                      'সংবাদ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // Horizontal Scrolling News Content
              Expanded(
                child: SizedBox(
                  height: 38,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (idx) {
                      setState(() => _currentIndex = idx);
                    },
                    itemCount: _headlines.length,
                    itemBuilder: (context, index) {
                      final item = _headlines[index];
                      return InkWell(
                        onTap: () {
                          if (item.url.isNotEmpty) {
                            DhakaNewsService.launchArticle(item.url);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              // Source Pill
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF1F5F9),
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(color: const Color(0xFFCBD5E1)),
                                ),
                                child: Text(
                                  item.source,
                                  style: const TextStyle(
                                    fontSize: 9.5,
                                    color: Color(0xFF475569),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),

                              // Headline Text
                              Expanded(
                                child: Text(
                                  item.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF1E293B),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),

                              const Icon(Icons.open_in_new, size: 13, color: Color(0xFF94A3B8)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
