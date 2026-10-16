import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:flutter_project_nutcm_1/pages/profile_page.dart';
import 'package:flutter_project_nutcm_1/services/dhaka_data_service.dart';
import 'package:flutter_project_nutcm_1/views/dhaka_ai_assistant_screen.dart';
import 'package:flutter_project_nutcm_1/views/dhaka_bazar_screen.dart';
import 'package:flutter_project_nutcm_1/views/dhaka_bus_metro_screen.dart';
import 'package:flutter_project_nutcm_1/views/dhaka_civic_report_screen.dart';
import 'package:flutter_project_nutcm_1/views/dhaka_emergency_screen.dart';
import 'package:flutter_project_nutcm_1/views/dhaka_govt_services_screen.dart';
import 'package:flutter_project_nutcm_1/views/dhaka_nearby_services_screen.dart';
import 'package:flutter_project_nutcm_1/views/dhaka_weather_screen.dart';
import 'package:flutter_project_nutcm_1/views/drawer_screen.dart';
import 'package:flutter_project_nutcm_1/views/nu_services_screen.dart';
import 'package:flutter_project_nutcm_1/widget/bottomnavigationbar.dart';
import 'package:flutter_project_nutcm_1/widget/service_icon.dart';
import 'package:flutter_project_nutcm_1/widget/dhaka_news_ticker.dart';
import 'package:flutter_project_nutcm_1/views/dhaka_radio_screen.dart';
import 'package:flutter_project_nutcm_1/widget/dhaka_radio_mini_player.dart';
import 'package:flutter_project_nutcm_1/views/dhaka_map_screen.dart';

class DhakaHomeScreen extends StatefulWidget {
  const DhakaHomeScreen({Key? key}) : super(key: key);

  @override
  State<DhakaHomeScreen> createState() => _DhakaHomeScreenState();
}

class _DhakaHomeScreenState extends State<DhakaHomeScreen>
    with SingleTickerProviderStateMixin {
  int _bottomNavIndex = 0;
  String _selectedArea = 'মিরপুর-১০, ঢাকা';
  bool _isBangla = true;
  String _searchQuery = '';
  Map<String, dynamic>? _weatherSummary;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late AnimationController _sunAnimationController;
  late Animation<double> _sunPulseAnimation;

  @override
  void initState() {
    super.initState();
    _loadWeather();

    // Subtle sun rise / noon / night breathing animation
    _sunAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _sunPulseAnimation = Tween<double>(begin: 0.94, end: 1.06).animate(
      CurvedAnimation(
        parent: _sunAnimationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _sunAnimationController.dispose();
    super.dispose();
  }

  Future<void> _loadWeather() async {
    final weather = await DhakaDataService.fetchDhakaWeather();
    if (mounted) {
      setState(() {
        _weatherSummary = weather;
      });
    }
  }

  void _selectAreaModal() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'আপনার এলাকা নির্বাচন করুন',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B)),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: DhakaDataService.dhakaAreas.length,
                  itemBuilder: (context, index) {
                    final area = DhakaDataService.dhakaAreas[index];
                    final isCurrent = _selectedArea == area;
                    return ListTile(
                      leading: Icon(
                        Icons.location_on,
                        color: isCurrent
                            ? const Color(0xFF1E88E5)
                            : const Color(0xFF94A3B8),
                      ),
                      title: Text(
                        area,
                        style: TextStyle(
                          fontWeight:
                              isCurrent ? FontWeight.bold : FontWeight.normal,
                          color: isCurrent
                              ? const Color(0xFF1E88E5)
                              : const Color(0xFF334155),
                        ),
                      ),
                      trailing: isCurrent
                          ? const Icon(Icons.check_circle,
                              color: Color(0xFF1E88E5))
                          : null,
                      onTap: () {
                        setState(() {
                          _selectedArea = area;
                        });
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFFF8FAFC),
      drawer: AppDrawer(),
      body: SafeArea(
        child: IndexedStack(
          index: _bottomNavIndex,
          children: [
            _buildHomeTab(),
            _buildServicesTab(),
            const NuServicesScreen(),
            const DhakaEmergencyScreen(),
            ProfilePage(),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const DhakaRadioMiniPlayer(),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 16,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: BottomNavigationBar(
              currentIndex: _bottomNavIndex,
              onTap: (index) {
                setState(() {
                  _bottomNavIndex = index;
                });
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: const Color(0xFF1E88E5),
              unselectedItemColor: const Color(0xFF94A3B8),
              selectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 11.5),
              unselectedLabelStyle: const TextStyle(fontSize: 11),
              elevation: 0,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled),
                  label: 'হোম',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.grid_view_rounded),
                  label: 'সেবা',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.school_rounded),
                  label: 'এনইউ হাব',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.emergency_rounded),
                  label: 'জরুরি ৯৯৯',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_rounded),
                  label: 'প্রোফাইল',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHomeTab() {
    return RefreshIndicator(
      onRefresh: _loadWeather,
      color: const Color(0xFFF57C00),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pathao-style Top App Bar
            _buildTopBar(),

            // Location Selector & Language Pill
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: _selectAreaModal,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.location_on,
                              color: Color(0xFFE53935), size: 16),
                          const SizedBox(width: 6),
                          Text(
                            _selectedArea,
                            style: const TextStyle(
                              fontSize: 12.5,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1E293B),
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.keyboard_arrow_down,
                              color: Color(0xFF64748B), size: 18),
                        ],
                      ),
                    ),
                  ),
                  // Language toggle button
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isBangla = !_isBangla;
                      });
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.language,
                              size: 14, color: Color(0xFF475569)),
                          const SizedBox(width: 4),
                          Text(
                            _isBangla ? 'বাং | EN' : 'EN | বাং',
                            style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF334155)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Global Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  onChanged: (val) {
                    setState(() => _searchQuery = val);
                  },
                  decoration: const InputDecoration(
                    hintText:
                        'কী খুঁজছেন? (মেট্রো, হাসপাতাল, বাজার দর, বাস)...',
                    hintStyle: TextStyle(fontSize: 13, color: Color(0xFF94A3B8)),
                    prefixIcon: Icon(Icons.search,
                        color: Color(0xFF64748B), size: 22),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // DYNAMIC TIME-AWARE BANNER (Lite Orange Sunrise / Noon / Sunset / Night Animation)
            _buildTimeAwareBanner(),

            const SizedBox(height: 10),

            // CLEAN QUICK ACCESS SERVICES (Emergency 999, Metro, Bazar, NU Hub)
            _buildQuickServiceBar(),

            const SizedBox(height: 14),

            // EYE-CATCHING BANGLA NEWS CAROUSEL (with 16:9 rectangular photos & clickable links)
            const DhakaNewsTicker(),

            const SizedBox(height: 16),

            // Primary Services Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _isBangla ? 'প্রয়োজনীয় সকল সেবা' : 'Daily Services',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() => _bottomNavIndex = 1);
                    },
                    child: Text(
                      _isBangla ? 'সব দেখুন >' : 'View All >',
                      style: const TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E88E5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            _buildServicesGrid(),

            const SizedBox(height: 20),

            // Quick Actions Section
            _buildQuickActions(),

            const SizedBox(height: 20),

            // Live Dhaka Community Alerts
            _buildCommunityAlerts(),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.menu_rounded,
                    color: Color(0xFF0F172A), size: 26),
                onPressed: () => _scaffoldKey.currentState?.openDrawer(),
              ),
              const SizedBox(width: 4),
              // Brand Logo and Name
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFE53935), Color(0xFF1E88E5)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(Icons.flash_on_rounded,
                          color: Colors.white, size: 20),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'DhakaLife',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.5,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      Text(
                        'ঢাকা সুপার অ্যাপ',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          // Points Pill & Profile Avatar
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF7ED),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFFFEDD5)),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.stars_rounded,
                        color: Color(0xFFF97316), size: 16),
                    SizedBox(width: 4),
                    Text(
                      '১২৫০ পয়েন্ট',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFC2410C),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF6FF),
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: const Color(0xFF3B82F6), width: 1.5),
                  ),
                  child: const Center(
                    child:
                        Icon(Icons.person, color: Color(0xFF1E88E5), size: 22),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // DYNAMIC TIME-AWARE AMBIENT WEATHER BANNER (Simple, Clean & Uncluttered)
  Widget _buildTimeAwareBanner() {
    final now = DateTime.now();
    final hour = now.hour;

    final temp = _weatherSummary?['temperature'] ?? '31°C';
    final cond = _weatherSummary?['conditionBn'] ?? 'পরিষ্কার আকাশ';

    String bgImage;
    String greetingBn;
    IconData timeIcon;
    Color iconColor;
    List<Color> overlayGradient;

    if (hour >= 5 && hour < 12) {
      // 🌅 MORNING (5am - 12pm)
      bgImage = 'assets/images/dashboard_top/morning.jpeg';
      greetingBn = 'সুপ্রভাত ঢাকা';
      timeIcon = PhosphorIcons.sunHorizon(PhosphorIconsStyle.fill);
      iconColor = const Color(0xFFFFB74D);
      overlayGradient = [
        Colors.black.withOpacity(0.50),
        Colors.black.withOpacity(0.35),
        Colors.black.withOpacity(0.60),
      ];
    } else if (hour >= 12 && hour < 17) {
      // ☀️ NOON (12pm - 5pm)
      bgImage = 'assets/images/dashboard_top/noon.jpeg';
      greetingBn = 'শুভ দুপুর ঢাকা';
      timeIcon = PhosphorIcons.sun(PhosphorIconsStyle.fill);
      iconColor = const Color(0xFFFFD54F);
      overlayGradient = [
        Colors.black.withOpacity(0.50),
        Colors.black.withOpacity(0.30),
        Colors.black.withOpacity(0.60),
      ];
    } else {
      // 🌙 NIGHT (5pm - 5am)
      bgImage = 'assets/images/dashboard_top/night.jpeg';
      greetingBn = (hour >= 17 && hour < 20) ? 'শুভ সন্ধ্যা ঢাকা' : 'শুভ রাত্রি ঢাকা';
      timeIcon = (hour >= 17 && hour < 20)
          ? PhosphorIcons.sunHorizon(PhosphorIconsStyle.fill)
          : PhosphorIcons.moonStars(PhosphorIconsStyle.fill);
      iconColor = const Color(0xFFFFD54F);
      overlayGradient = [
        Colors.black.withOpacity(0.60),
        Colors.black.withOpacity(0.40),
        Colors.black.withOpacity(0.70),
      ];
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            // Background Landscape Image
            Positioned.fill(
              child: Image.asset(
                bgImage,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFE65100), Color(0xFFF57C00)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
            ),
            // Translucent Dark Gradient Overlay for optimal legibility
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: overlayGradient,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            // Banner Hero Weather Content
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DhakaWeatherScreen(),
                    ),
                  );
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left: Greeting & Current Live Weather
                      Row(
                        children: [
                          ScaleTransition(
                            scale: _sunPulseAnimation,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.25),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: Colors.white.withOpacity(0.3)),
                              ),
                              child: Icon(timeIcon, color: iconColor, size: 24),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                greetingBn,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(color: Colors.black54, blurRadius: 4),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 3),
                              Row(
                                children: [
                                  Text(
                                    'ঢাকা: $temp',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(color: Colors.black54, blurRadius: 4),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 7, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.22),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      cond,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),

                      // Right: Clickable Weather Forecast Pill
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.22),
                          borderRadius: BorderRadius.circular(16),
                          border:
                              Border.all(color: Colors.white.withOpacity(0.35)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              'পূর্বাভাস',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 3),
                            Icon(Icons.arrow_forward_ios_rounded,
                                color: Colors.white, size: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // DEDICATED CLEAN QUICK SERVICE BAR (Zero Noise, Airy, Professional)
  Widget _buildQuickServiceBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildQuickServiceItem(
            icon: PhosphorIcons.phoneCall(PhosphorIconsStyle.fill),
            label: 'জরুরি ৯৯৯',
            iconColor: const Color(0xFFDC2626),
            bgColor: const Color(0xFFFEE2E2),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DhakaEmergencyScreen())),
          ),
          _buildQuickServiceItem(
            icon: PhosphorIcons.train(PhosphorIconsStyle.fill),
            label: 'মেট্রোরেল',
            iconColor: const Color(0xFF059669),
            bgColor: const Color(0xFFD1FAE5),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DhakaBusMetroScreen())),
          ),
          _buildQuickServiceItem(
            icon: PhosphorIcons.shoppingBag(PhosphorIconsStyle.fill),
            label: 'বাজার দর',
            iconColor: const Color(0xFFD97706),
            bgColor: const Color(0xFFFEF3C7),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DhakaBazarScreen())),
          ),
          _buildQuickServiceItem(
            icon: PhosphorIcons.graduationCap(PhosphorIconsStyle.fill),
            label: 'এনইউ হাব',
            iconColor: const Color(0xFF7C3AED),
            bgColor: const Color(0xFFEDE9FE),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NuServicesScreen())),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickServiceItem({
    required IconData icon,
    required String label,
    required Color iconColor,
    required Color bgColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Icon(icon, color: iconColor, size: 26),
              ),
            ),
            const SizedBox(height: 7),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // UPGRADED PRIMARY SERVICES GRID WITH PHOSPHOR ICONS & SERVICE ICON SYSTEM
  Widget _buildServicesGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.15,
        children: [
          // 1. National University (NU Hub)
          _buildServiceCard(
            title: 'জাতীয় বিশ্ববিদ্যালয়',
            subtitle: 'নোটিশ স্লাইডার ও সাব-কার্ড',
            badge: 'AIS & PORTAL',
            badgeColor: const Color(0xFF1565C0),
            serviceIcon: ServiceIcon.nuHub(),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NuServicesScreen()));
            },
          ),

          // 2. Bus & Metro Guide
          _buildServiceCard(
            title: 'বাস ও মেট্রোরেল',
            subtitle: 'রুট, ভাড়া ও স্টেশন গাইড',
            badge: 'জনপ্রিয়',
            badgeColor: const Color(0xFF00897B),
            serviceIcon: ServiceIcon.transport(),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DhakaBusMetroScreen()));
            },
          ),

          // 3. Emergency 999
          _buildServiceCard(
            title: 'জরুরি সেবা ৯৯৯',
            subtitle: 'পুলিশ, অ্যাম্বুলেন্স, ফায়ার',
            badge: '২৪/৭ হটলাইন',
            badgeColor: const Color(0xFFE53935),
            serviceIcon: ServiceIcon.emergency(),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DhakaEmergencyScreen()));
            },
          ),

          // 4. Daily Bazar Price
          _buildServiceCard(
            title: 'দৈনিক বাজার দর',
            subtitle: 'চাল, ডাল, ডিম ও সবজি',
            badge: 'আজকের দর',
            badgeColor: const Color(0xFFF57C00),
            serviceIcon: ServiceIcon.bazar(),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DhakaBazarScreen()));
            },
          ),

          // 5. Weather & Flood
          _buildServiceCard(
            title: 'আবহাওয়া ও সতর্কতা',
            subtitle: 'বৃষ্টি ও জলাবদ্ধতা তথ্য',
            badge: 'লাইভ API',
            badgeColor: const Color(0xFF0288D1),
            serviceIcon: ServiceIcon.weather(),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DhakaWeatherScreen()));
            },
          ),

          // 6. Expense Manager (Hive Offline Tracker)
          _buildServiceCard(
            title: 'দৈনিক খরচের হিসাব',
            subtitle: 'বাজেট ও ব্যয় ট্র্যাকিং',
            badge: 'অফলাইন',
            badgeColor: const Color(0xFF2E7D32),
            serviceIcon: ServiceIcon.expense(),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MaterialApp(
                    debugShowCheckedModeBanner: false,
                    home: Bottom(),
                  ),
                ),
              );
            },
          ),

          // 7. Nearby Essential Services
          _buildServiceCard(
            title: 'নিকটবর্তী সেবা',
            subtitle: 'কারিগর, মেকানিক, ক্লিনিক',
            badge: 'ঢাকা',
            badgeColor: const Color(0xFF3949AB),
            serviceIcon: ServiceIcon.household(),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const DhakaNearbyServicesScreen()));
            },
          ),

          // 8. Civic Issues Reporting
          _buildServiceCard(
            title: 'নাগরিক সমস্যা',
            subtitle: 'ভাঙা রাস্তা, আবর্জনা রিপোর্ট',
            badge: 'অভিযোগ',
            badgeColor: const Color(0xFFC2185B),
            serviceIcon: ServiceIcon.civic(),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DhakaCivicReportScreen()));
            },
          ),

          // 9. Government Services Directory
          _buildServiceCard(
            title: 'সরকারি সেবা',
            subtitle: 'পাসপোর্ট, এনআইডি ও ওয়াসা',
            badge: 'তথ্য',
            badgeColor: const Color(0xFF5D4037),
            serviceIcon: ServiceIcon.govt(),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const DhakaGovtServicesScreen()));
            },
          ),

          // 10. Bangla AI Assistant
          _buildServiceCard(
            title: 'বাংলা এআই সহকারী',
            subtitle: 'স্মার্ট ঢাকা সমাধান',
            badge: 'এআই স্মার্ট',
            badgeColor: const Color(0xFF8E24AA),
            serviceIcon: ServiceIcon.ai(),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DhakaAiAssistantScreen()));
            },
          ),

          // 11. Live Bangla Radio
          _buildServiceCard(
            title: 'লাইভ বাংলা রেডিও',
            subtitle: 'গান, সংবাদ ও এফএম শো',
            badge: 'লাইভ',
            badgeColor: const Color(0xFF2E7D32),
            serviceIcon: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(
                PhosphorIconsFill.broadcast,
                color: Color(0xFF2E7D32),
                size: 26,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DhakaRadioScreen()));
            },
          ),

          // 12. Dhaka Live Map & Nearby Places
          _buildServiceCard(
            title: 'ঢাকা লাইভ ম্যাপ',
            subtitle: 'নিকটবর্তী জরুরি স্থান',
            badge: 'ওএসএম ম্যাপ',
            badgeColor: const Color(0xFF0288D1),
            serviceIcon: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFE0F2FE),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(
                PhosphorIconsFill.mapTrifold,
                color: Color(0xFF0288D1),
                size: 26,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DhakaMapScreen()));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard({
    required String title,
    required String subtitle,
    required String badge,
    required Color badgeColor,
    required Widget serviceIcon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFF1F5F9), width: 1.2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                serviceIcon,
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                  decoration: BoxDecoration(
                    color: badgeColor.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    badge,
                    style: TextStyle(
                      fontSize: 9.5,
                      fontWeight: FontWeight.bold,
                      color: badgeColor,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E293B),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 10.5,
                    color: Color(0xFF64748B),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: const [
              Expanded(child: Divider(color: Color(0xFFE2E8F0))),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'QUICK ACTIONS',
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      color: Color(0xFF94A3B8)),
                ),
              ),
              Expanded(child: Divider(color: Color(0xFFE2E8F0))),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              _buildQuickActionChip(
                icon: PhosphorIcons.broadcast(PhosphorIconsStyle.fill),
                label: 'লাইভ রেডিও',
                color: const Color(0xFF2E7D32),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DhakaRadioScreen())),
              ),
              const SizedBox(width: 10),
              _buildQuickActionChip(
                icon: PhosphorIcons.mapPin(PhosphorIconsStyle.fill),
                label: 'ঢাকা ম্যাপ',
                color: const Color(0xFF0288D1),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DhakaMapScreen())),
              ),
              const SizedBox(width: 10),
              _buildQuickActionChip(
                icon: PhosphorIcons.phone(PhosphorIconsStyle.fill),
                label: 'পুলিশ কল ৯৯৯',
                color: const Color(0xFFE53935),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DhakaEmergencyScreen())),
              ),
              const SizedBox(width: 10),
              _buildQuickActionChip(
                icon: PhosphorIcons.train(PhosphorIconsStyle.fill),
                label: 'মেট্রো স্টেশন তালিকা',
                color: const Color(0xFF00897B),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DhakaBusMetroScreen())),
              ),
              const SizedBox(width: 10),
              _buildQuickActionChip(
                icon: PhosphorIcons.currencyCircleDollar(PhosphorIconsStyle.fill),
                label: 'আজকের বাজার দর',
                color: const Color(0xFFF57C00),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DhakaBazarScreen())),
              ),
              const SizedBox(width: 10),
              _buildQuickActionChip(
                icon: PhosphorIcons.cloudSun(PhosphorIconsStyle.fill),
                label: 'লাইভ আবহাওয়া',
                color: const Color(0xFF0288D1),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DhakaWeatherScreen())),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActionChip({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE2E8F0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 18),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.5,
                  color: Color(0xFF1E293B)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCommunityAlerts() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'ঢাকাবাসীর সতর্কতা ও বুলেটিন',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              Text(
                'আজকের আপডেট',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF64748B)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFF1F5F9)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFECFDF5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                      PhosphorIcons.checkCircle(PhosphorIconsStyle.fill),
                      color: const Color(0xFF059669),
                      size: 22),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'মিরপুর-১০ গোলচত্বরে ট্রাফিক স্বাভাবিক',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Color(0xFF1E293B)),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'মেট্রোরেল চলাচল স্বাভাবিক এবং সকল স্টেশন সচল আছে।',
                        style: TextStyle(
                            fontSize: 11.5, color: Color(0xFF64748B)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesTab() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'সকল ক্যাটাগরি ও সুবিধাসমূহ',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A)),
          ),
          const SizedBox(height: 14),
          _buildServicesGrid(),
        ],
      ),
    );
  }
}
