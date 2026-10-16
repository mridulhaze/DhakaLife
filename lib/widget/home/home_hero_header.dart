import 'package:flutter/material.dart';
import '../../pages/profile_page.dart';
import 'floating_search_bar.dart';
import 'location_pill.dart';
import 'weather_chip.dart';

class HomeHeroHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Map<String, dynamic>? weatherSummary;
  final TextEditingController searchController;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onSearchClear;
  final VoidCallback onLocationTap;
  final VoidCallback onWeatherTap;
  final VoidCallback onMenuTap;
  final VoidCallback onLanguageToggle;
  final bool isBangla;
  final double topPadding;

  HomeHeroHeaderDelegate({
    required this.weatherSummary,
    required this.searchController,
    required this.onSearchChanged,
    required this.onSearchClear,
    required this.onLocationTap,
    required this.onWeatherTap,
    required this.onMenuTap,
    required this.onLanguageToggle,
    required this.isBangla,
    required this.topPadding,
  });

  @override
  double get minExtent => 56.0 + topPadding;

  @override
  double get maxExtent => 220.0 + topPadding;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);
    final isCollapsed = progress > 0.85;

    final hour = DateTime.now().hour;
    String skylineImage;
    if (hour >= 5 && hour < 12) {
      skylineImage = 'assets/images/dashboard_top/morning.jpeg';
    } else if (hour >= 12 && hour < 17) {
      skylineImage = 'assets/images/dashboard_top/noon.jpeg';
    } else {
      skylineImage = 'assets/images/dashboard_top/night.jpeg';
    }

    return Container(
      color: const Color(0xFFF8FAFC),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // 1. Full-Bleed Dhaka Skyline Hero Image (Fades out on scroll)
          if (progress < 1.0)
            Opacity(
              opacity: (1.0 - progress * 1.2).clamp(0.0, 1.0),
              child: Image.asset(
                skylineImage,
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
                errorBuilder: (context, error, stackTrace) => Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFBAE6FD), Color(0xFFE0F2FE)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
            ),

          // 2. Light Gradient Overlay (Preserves sharp contrast & fades into scaffold background)
          if (progress < 1.0)
            Opacity(
              opacity: (1.0 - progress).clamp(0.0, 1.0),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.38),
                      Colors.white.withOpacity(0.15),
                      const Color(0xFFF8FAFC).withOpacity(0.85),
                      const Color(0xFFF8FAFC),
                    ],
                    stops: const [0.0, 0.45, 0.85, 1.0],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),

          // 3. Collapsed Pinned App Bar Background
          if (progress > 0.4)
            Opacity(
              opacity: ((progress - 0.4) / 0.6).clamp(0.0, 1.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: const Border(
                    bottom: BorderSide(color: Color(0xFFE2E8F0), width: 0.5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),

          // 4. Header Content Elements
          Padding(
            padding: EdgeInsets.only(top: topPadding),
            child: Stack(
              children: [
                // Top Header Row (Logo, Location Pill, Points, Avatar)
                Positioned(
                  top: 0,
                  left: 12,
                  right: 12,
                  height: 48,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left: Menu / DhakaLife Logo + Location Pill
                      Row(
                        children: [
                          // Small Menu Trigger
                          InkWell(
                            onTap: onMenuTap,
                            borderRadius: BorderRadius.circular(16),
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.8),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.menu_rounded,
                                color: Color(0xFF0F172A),
                                size: 20,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),

                          // Brand Logo (28dp)
                          Container(
                            width: 28,
                            height: 28,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFFE53935), Color(0xFF1E88E5)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.flash_on_rounded,
                                color: Colors.white,
                                size: 17,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),

                          // Location Pill
                          LocationPill(
                            onTap: onLocationTap,
                            isCompact: isCollapsed,
                          ),
                        ],
                      ),

                      // Right: Language Toggle, Points, Profile Avatar
                      Row(
                        children: [
                          // Compact Language Toggle
                          InkWell(
                            onTap: onLanguageToggle,
                            borderRadius: BorderRadius.circular(14),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 7, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.85),
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                    color: Colors.white.withOpacity(0.9)),
                              ),
                              child: Text(
                                isBangla ? 'EN' : 'বাং',
                                style: const TextStyle(
                                  fontSize: 10.5,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1E88E5),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 6),

                          // Compact Points Chip (Coin + "১২৫০" with Tooltip)
                          Tooltip(
                            message: '১২৫০ অর্জিত পয়েন্ট',
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 7, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFF7ED),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: const Color(0xFFFFEDD5)),
                              ),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.stars_rounded,
                                    color: Color(0xFFF97316),
                                    size: 14,
                                  ),
                                  SizedBox(width: 3),
                                  Text(
                                    '১২৫০',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFC2410C),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),

                          // Profile Avatar (32dp)
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfilePage()),
                              );
                            },
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: const Color(0xFFEFF6FF),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xFF3B82F6),
                                  width: 1.5,
                                ),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.person_rounded,
                                  color: Color(0xFF1E88E5),
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Lower-Left Weather Chip (Inside hero, fades out as user scrolls)
                if (progress < 0.6)
                  Positioned(
                    bottom: 60,
                    left: 14,
                    child: Opacity(
                      opacity: (1.0 - progress * 1.6).clamp(0.0, 1.0),
                      child: WeatherChip(
                        weatherSummary: weatherSummary,
                        onTap: onWeatherTap,
                      ),
                    ),
                  ),

                // Floating Search Bar (Positioned at bottom of header)
                if (progress < 0.8)
                  Positioned(
                    bottom: 8,
                    left: 14,
                    right: 14,
                    child: Opacity(
                      opacity: (1.0 - progress * 1.25).clamp(0.0, 1.0),
                      child: FloatingSearchBar(
                        controller: searchController,
                        onChanged: onSearchChanged,
                        onClear: onSearchClear,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant HomeHeroHeaderDelegate oldDelegate) {
    return oldDelegate.weatherSummary != weatherSummary ||
        oldDelegate.isBangla != isBangla ||
        oldDelegate.topPadding != topPadding ||
        oldDelegate.searchController.text != searchController.text;
  }
}
