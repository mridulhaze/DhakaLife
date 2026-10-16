import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:flutter_project_nutcm_1/models/dhaka_radio_station.dart';
import 'package:flutter_project_nutcm_1/services/dhaka_radio_service.dart';
import 'package:flutter_project_nutcm_1/views/dhaka_radio_diagnostic_screen.dart';

class DhakaRadioScreen extends StatefulWidget {
  const DhakaRadioScreen({Key? key}) : super(key: key);

  @override
  State<DhakaRadioScreen> createState() => _DhakaRadioScreenState();
}

class _DhakaRadioScreenState extends State<DhakaRadioScreen> {
  final DhakaRadioService radioService = Get.put(DhakaRadioService(), permanent: true);

  String _searchQuery = '';
  String _selectedCountry = 'সকল দেশ';
  String _selectedCategory = 'সকল';

  final List<String> _countries = [
    'সকল দেশ',
    'বাংলাদেশ 🇧🇩',
    'ভারত (কলকাতা) 🇮🇳',
    'গ্লোবাল 🌍',
  ];

  final List<String> _categories = [
    'সকল',
    'প্রিয় স্টেশন ❤️',
    'সাম্প্রতিক 🕒',
    'জনপ্রিয় এফএম',
    'সংবাদ ও সঙ্গীত',
    'আধুনিক ও ফোক',
    'ক্লাসিক্যাল ও মেলোডি',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              color: Color(0xFF0F172A), size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: const Color(0xFFE3F2FD),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                PhosphorIconsRegular.broadcast,
                color: Color(0xFF1E88E5),
                size: 20,
              ),
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'লাইভ বাংলা রেডিও',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
                Text(
                  'বাংলাদেশ, কলকাতা ও বিশ্বব্যাপী বাংলা সম্প্রচার',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.analytics_outlined, color: Color(0xFF1E88E5)),
            tooltip: 'রেডিও ডায়াগনস্টিক',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DhakaRadioDiagnosticScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Background Playback Notice Banner
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFA5D6A7), width: 1),
              ),
              child: const Row(
                children: [
                  Icon(
                    PhosphorIconsRegular.speakerHigh,
                    color: Color(0xFF2E7D32),
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'স্ক্রিন বন্ধ থাকলেও অথবা ব্যাকগ্রাউন্ডে নিরবচ্ছিন্নভাবে চলবে। ফোন আসলে অটো পজ হবে।',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1B5E20),
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Active Playing Hero Card
            Obx(() {
              final current = radioService.currentStation.value;
              final isPlaying = radioService.isPlaying.value;
              final isBuffering = radioService.isBuffering.value;
              final hasError = radioService.hasError.value;
              final errorMsg = radioService.errorMessage.value;

              final activeStation = current ??
                  (radioService.stations.isNotEmpty
                      ? radioService.stations.first
                      : DhakaRadioStation.defaultStations.first);
              final themeColor = Color(activeStation.primaryColorValue);

              return Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      themeColor,
                      themeColor.withOpacity(0.85),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: themeColor.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: isPlaying
                                      ? Colors.greenAccent
                                      : Colors.orangeAccent,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                isPlaying
                                    ? 'লাইভ সম্প্রচার'
                                    : (isBuffering ? 'বাফারিং...' : 'রেডিও রেডি'),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            activeStation.frequency,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),

                    // Station Name & Tagline
                    Text(
                      activeStation.nameBn,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.3,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      activeStation.tagline,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Error Alert (if any)
                    if (hasError) ...[
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.error_outline,
                                color: Colors.amberAccent, size: 18),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                errorMsg.isNotEmpty
                                    ? errorMsg
                                    : 'সংযোগ ব্যর্থ হয়েছে।',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                            TextButton(
                              onPressed: () =>
                                  radioService.playStation(activeStation),
                              child: const Text('পুনরায় চেষ্টা',
                                  style: TextStyle(
                                      color: Colors.amberAccent, fontSize: 12)),
                            ),
                          ],
                        ),
                      ),
                    ],

                    // Playback Controls
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Stop button
                        IconButton(
                          onPressed: current != null
                              ? () => radioService.stop()
                              : null,
                          icon: const Icon(PhosphorIconsFill.stop,
                              color: Colors.white, size: 28),
                          tooltip: 'বন্ধ করুন',
                        ),
                        const SizedBox(width: 20),

                        // Large Play/Pause/Buffer button
                        GestureDetector(
                          onTap: () {
                            if (current == null) {
                              radioService.playStation(activeStation);
                            } else {
                              radioService.togglePlayPause();
                            }
                          },
                          child: Container(
                            width: 68,
                            height: 68,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.18),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Center(
                              child: isBuffering
                                  ? SizedBox(
                                      width: 28,
                                      height: 28,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 3,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                themeColor),
                                      ),
                                    )
                                  : Icon(
                                      isPlaying
                                          ? PhosphorIconsFill.pause
                                          : PhosphorIconsFill.play,
                                      color: themeColor,
                                      size: 32,
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),

                        // Favorite toggle in hero
                        IconButton(
                          onPressed: () =>
                              radioService.toggleFavorite(activeStation.id),
                          icon: Icon(
                            radioService.isFavorite(activeStation.id)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.white,
                            size: 26,
                          ),
                          tooltip: 'প্রিয় তালিকায় যোগ করুন',
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Volume Slider
                    Row(
                      children: [
                        const Icon(PhosphorIconsRegular.speakerLow,
                            color: Colors.white70, size: 18),
                        Expanded(
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.white30,
                              thumbColor: Colors.white,
                              trackHeight: 3,
                              thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 6),
                            ),
                            child: Slider(
                              value: radioService.volume.value,
                              onChanged: (val) => radioService.setVolume(val),
                            ),
                          ),
                        ),
                        const Icon(PhosphorIconsRegular.speakerHigh,
                            color: Colors.white70, size: 18),
                      ],
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 20),

            // Station Search Field
            Container(
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
              child: TextField(
                onChanged: (val) => setState(() => _searchQuery = val.trim()),
                decoration: InputDecoration(
                  hintText: 'রেডিও স্টেশন বা ফ্রিকোয়েন্সি খুঁজুন...',
                  hintStyle:
                      const TextStyle(fontSize: 13, color: Color(0xFF94A3B8)),
                  prefixIcon: const Icon(Icons.search,
                      color: Color(0xFF64748B), size: 22),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear, size: 18),
                          onPressed: () => setState(() => _searchQuery = ''),
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Country Filter Selector
            SizedBox(
              height: 36,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _countries.length,
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final c = _countries[index];
                  final isSelected = _selectedCountry == c;
                  return InkWell(
                    onTap: () => setState(() => _selectedCountry = c),
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF1E88E5)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFF1E88E5)
                              : const Color(0xFFE2E8F0),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          c,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF334155),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),

            // Category & Favorites/Recents Filter Pills
            SizedBox(
              height: 34,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _categories.length,
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final cat = _categories[index];
                  final isSelected = _selectedCategory == cat;
                  return InkWell(
                    onTap: () => setState(() => _selectedCategory = cat),
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF0F172A)
                            : const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          cat,
                          style: TextStyle(
                            fontSize: 11.5,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.w500,
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF475569),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // Station List Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'রেডিও স্টেশন তালিকা',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
                Obx(() => Text(
                      '${_filterStations().length} টি উপলব্ধ',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF64748B),
                        fontWeight: FontWeight.w600,
                      ),
                    )),
              ],
            ),
            const SizedBox(height: 12),

            // Dynamic Station List
            Obx(() {
              final filtered = _filterStations();

              if (filtered.isEmpty) {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Column(
                    children: [
                      const Icon(Icons.radio_outlined,
                          size: 40, color: Color(0xFF94A3B8)),
                      const SizedBox(height: 10),
                      const Text(
                        'কোনো স্টেশন পাওয়া যায়নি',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF334155),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _searchQuery.isNotEmpty
                            ? 'অনুগ্রহ করে অন্য কি-ওয়ার্ড দিয়ে খুঁজুন।'
                            : 'ফিল্টার পরিবর্তন করে দেখুন।',
                        style: const TextStyle(
                            fontSize: 12, color: Color(0xFF64748B)),
                      ),
                    ],
                  ),
                );
              }

              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filtered.length,
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final station = filtered[index];
                  final current = radioService.currentStation.value;
                  final isCurrent = current?.id == station.id;
                  final isPlaying = isCurrent && radioService.isPlaying.value;
                  final isBuffering = isCurrent && radioService.isBuffering.value;
                  final stationColor = Color(station.primaryColorValue);
                  final isFav = radioService.isFavorite(station.id);

                  return Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    elevation: isCurrent ? 2 : 0.5,
                    child: InkWell(
                      onTap: () {
                        if (station.isWebOnly || !station.hasDirectStream) {
                          radioService.openStationWebsite(station);
                        } else if (isCurrent) {
                          radioService.togglePlayPause();
                        } else {
                          radioService.playStation(station);
                        }
                      },
                      borderRadius: BorderRadius.circular(14),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: isCurrent
                                ? stationColor
                                : const Color(0xFFE2E8F0),
                            width: isCurrent ? 1.5 : 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            // Station Logo/Color Avatar
                            Container(
                              width: 46,
                              height: 46,
                              decoration: BoxDecoration(
                                color: stationColor.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Icon(
                                  station.isWebOnly
                                      ? Icons.public_rounded
                                      : PhosphorIconsRegular.radio,
                                  color: stationColor,
                                  size: 24,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),

                            // Details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          station.nameBn,
                                          style: TextStyle(
                                            fontSize: 14.5,
                                            fontWeight: FontWeight.bold,
                                            color: isCurrent
                                                ? stationColor
                                                : const Color(0xFF0F172A),
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF1F5F9),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: Text(
                                          station.frequency,
                                          style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF475569),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    station.tagline,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 11.5,
                                      color: Color(0xFF64748B),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Text(
                                        station.country == 'Bangladesh'
                                            ? 'বাংলাদেশ 🇧🇩'
                                            : (station.country == 'India'
                                                ? 'ভারত 🇮🇳'
                                                : 'গ্লোবাল 🌍'),
                                        style: const TextStyle(
                                            fontSize: 10.5,
                                            color: Color(0xFF94A3B8)),
                                      ),
                                      const SizedBox(width: 6),
                                      const Text('•',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Color(0xFFCBD5E1))),
                                      const SizedBox(width: 6),
                                      Text(
                                        station.category,
                                        style: const TextStyle(
                                            fontSize: 10.5,
                                            color: Color(0xFF64748B)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            // Actions: Favorite and Play/Web
                            IconButton(
                              icon: Icon(
                                isFav ? Icons.favorite : Icons.favorite_border,
                                color: isFav
                                    ? const Color(0xFFE11D48)
                                    : const Color(0xFF94A3B8),
                                size: 20,
                              ),
                              onPressed: () =>
                                  radioService.toggleFavorite(station.id),
                            ),

                            if (station.isWebOnly || !station.hasDirectStream) ...[
                              InkWell(
                                onTap: () =>
                                    radioService.openStationWebsite(station),
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFEF3C7),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                        color: const Color(0xFFFDE68A)),
                                  ),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.open_in_new_rounded,
                                          size: 14, color: Color(0xFFB45309)),
                                      SizedBox(width: 3),
                                      Text(
                                        'ওয়েব',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFB45309),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ] else ...[
                              Container(
                                width: 38,
                                height: 38,
                                decoration: BoxDecoration(
                                  color: isCurrent
                                      ? stationColor
                                      : const Color(0xFFF8FAFC),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isCurrent
                                        ? stationColor
                                        : const Color(0xFFCBD5E1),
                                  ),
                                ),
                                child: Center(
                                  child: isBuffering
                                      ? SizedBox(
                                          width: 18,
                                          height: 18,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              isCurrent
                                                  ? Colors.white
                                                  : stationColor,
                                            ),
                                          ),
                                        )
                                      : Icon(
                                          isPlaying
                                              ? PhosphorIconsFill.pause
                                              : PhosphorIconsFill.play,
                                          color: isCurrent
                                              ? Colors.white
                                              : const Color(0xFF475569),
                                          size: 18,
                                        ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  List<DhakaRadioStation> _filterStations() {
    final list = radioService.stations;
    return list.where((st) {
      // 1. Country Filter
      if (_selectedCountry == 'বাংলাদেশ 🇧🇩' && st.country != 'Bangladesh') {
        return false;
      }
      if (_selectedCountry == 'ভারত (কলকাতা) 🇮🇳' && st.country != 'India') {
        return false;
      }
      if (_selectedCountry == 'গ্লোবাল 🌍' && st.country != 'Global') {
        return false;
      }

      // 2. Category / Favorites / Recents Filter
      if (_selectedCategory == 'প্রিয় স্টেশন ❤️') {
        if (!radioService.isFavorite(st.id)) return false;
      } else if (_selectedCategory == 'সাম্প্রতিক 🕒') {
        if (!radioService.recentStationIds.contains(st.id)) return false;
      } else if (_selectedCategory != 'সকল' && st.category != _selectedCategory) {
        return false;
      }

      // 3. Search query
      if (_searchQuery.isNotEmpty) {
        final q = _searchQuery.toLowerCase();
        final match = st.name.toLowerCase().contains(q) ||
            st.nameBn.toLowerCase().contains(q) ||
            st.nameEn.toLowerCase().contains(q) ||
            st.frequency.toLowerCase().contains(q) ||
            st.tagline.toLowerCase().contains(q) ||
            st.category.toLowerCase().contains(q);
        if (!match) return false;
      }

      return true;
    }).toList();
  }
}
