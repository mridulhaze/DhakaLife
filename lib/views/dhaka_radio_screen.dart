import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:flutter_project_nutcm_1/models/dhaka_radio_station.dart';
import 'package:flutter_project_nutcm_1/services/dhaka_radio_service.dart';

class DhakaRadioScreen extends StatelessWidget {
  const DhakaRadioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final radioService = Get.put(DhakaRadioService(), permanent: true);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
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
                  'ব্যাকগ্রাউন্ড ও স্ক্রিন-অফ প্লেব্যাক সুবিধা',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ],
        ),
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
                      'স্ক্রিন বন্ধ রাখলেও অথবা অন্য অ্যাপ চালালেও নিরবচ্ছিন্নভাবে রেডিও চলবে।',
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

              final activeStation = current ?? DhakaRadioStation.defaultStations.first;
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
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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
                                  color: isPlaying ? Colors.greenAccent : Colors.orangeAccent,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                isPlaying ? 'লাইভ সম্প্রচার' : (isBuffering ? 'বাফারিং...' : 'রেডিও রেডি'),
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
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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
                            const Icon(Icons.error_outline, color: Colors.amberAccent, size: 18),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                errorMsg.isNotEmpty ? errorMsg : 'সংযোগ ব্যর্থ হয়েছে।',
                                style: const TextStyle(color: Colors.white, fontSize: 12),
                              ),
                            ),
                            TextButton(
                              onPressed: () => radioService.playStation(activeStation),
                              child: const Text('পুনরায় চেষ্টা', style: TextStyle(color: Colors.amberAccent, fontSize: 12)),
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
                          onPressed: current != null ? () => radioService.stop() : null,
                          icon: const Icon(PhosphorIconsFill.stop, color: Colors.white, size: 28),
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
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 10,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Center(
                              child: isBuffering
                                  ? SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 3,
                                        valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                                      ),
                                    )
                                  : Icon(
                                      isPlaying ? PhosphorIconsFill.pause : PhosphorIconsFill.play,
                                      color: themeColor,
                                      size: 34,
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),

                        // Volume icon indicator
                        IconButton(
                          onPressed: () {
                            final newVol = radioService.volume.value > 0.0 ? 0.0 : 1.0;
                            radioService.setVolume(newVol);
                          },
                          icon: Icon(
                            radioService.volume.value > 0.0
                                ? PhosphorIconsFill.speakerHigh
                                : PhosphorIconsFill.speakerSlash,
                            color: Colors.white,
                            size: 28,
                          ),
                          tooltip: 'মিউট / আনমিউট',
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Volume Slider
                    Row(
                      children: [
                        const Icon(PhosphorIconsRegular.speakerLow, color: Colors.white70, size: 16),
                        Expanded(
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.white30,
                              thumbColor: Colors.white,
                              trackHeight: 3.0,
                              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                            ),
                            child: Slider(
                              value: radioService.volume.value,
                              onChanged: (val) => radioService.setVolume(val),
                            ),
                          ),
                        ),
                        const Icon(PhosphorIconsRegular.speakerHigh, color: Colors.white70, size: 16),
                      ],
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 24),

            // Station Selection List
            const Text(
              'উপলব্ধ রেডিও স্টেশনসমূহ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 12),

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: DhakaRadioStation.defaultStations.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final station = DhakaRadioStation.defaultStations[index];
                return Obx(() {
                  final current = radioService.currentStation.value;
                  final isCurrent = current?.id == station.id;
                  final isPlaying = isCurrent && radioService.isPlaying.value;
                  final isBuffering = isCurrent && radioService.isBuffering.value;
                  final stationColor = Color(station.primaryColorValue);

                  return Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    elevation: isCurrent ? 2 : 0.5,
                    child: InkWell(
                      onTap: () {
                        if (isCurrent) {
                          radioService.togglePlayPause();
                        } else {
                          radioService.playStation(station);
                        }
                      },
                      borderRadius: BorderRadius.circular(14),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: isCurrent ? stationColor : const Color(0xFFE2E8F0),
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
                                  PhosphorIconsRegular.radio,
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
                                      Text(
                                        station.nameBn,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: isCurrent ? stationColor : const Color(0xFF0F172A),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF1F5F9),
                                          borderRadius: BorderRadius.circular(6),
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
                                      fontSize: 12,
                                      color: Color(0xFF64748B),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Action button
                            Container(
                              width: 38,
                              height: 38,
                              decoration: BoxDecoration(
                                color: isCurrent ? stationColor : const Color(0xFFF8FAFC),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: isCurrent ? stationColor : const Color(0xFFCBD5E1),
                                ),
                              ),
                              child: Center(
                                child: isBuffering
                                    ? SizedBox(
                                        width: 18,
                                        height: 18,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor: AlwaysStoppedAnimation<Color>(
                                            isCurrent ? Colors.white : stationColor,
                                          ),
                                        ),
                                      )
                                    : Icon(
                                        isPlaying ? PhosphorIconsFill.pause : PhosphorIconsFill.play,
                                        color: isCurrent ? Colors.white : const Color(0xFF475569),
                                        size: 18,
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
