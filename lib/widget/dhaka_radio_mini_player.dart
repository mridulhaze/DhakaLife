import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:flutter_project_nutcm_1/services/dhaka_radio_service.dart';
import 'package:flutter_project_nutcm_1/views/dhaka_radio_screen.dart';

class DhakaRadioMiniPlayer extends StatelessWidget {
  const DhakaRadioMiniPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<DhakaRadioService>()) {
      Get.put(DhakaRadioService(), permanent: true);
    }
    final radioService = DhakaRadioService.to;

    return Obx(() {
      final current = radioService.currentStation.value;
      if (current == null) {
        return const SizedBox.shrink();
      }

      final isPlaying = radioService.isPlaying.value;
      final isBuffering = radioService.isBuffering.value;
      final stationColor = Color(current.primaryColorValue);

      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: stationColor.withOpacity(0.35), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: stationColor.withOpacity(0.18),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => Get.to(() => const DhakaRadioScreen()),
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  // Icon
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: stationColor.withOpacity(0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        PhosphorIconsFill.broadcast,
                        color: stationColor,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                  // Station info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Text(
                              current.nameBn,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0F172A),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1.5),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE2E8F0),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                current.frequency,
                                style: const TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF334155),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          isPlaying ? 'লাইভ সম্প্রচার চলছে • ট্যাপ করে দেখুন' : 'প্লে করুন',
                          style: TextStyle(
                            fontSize: 11,
                            color: isPlaying ? const Color(0xFF2E7D32) : const Color(0xFF64748B),
                            fontWeight: isPlaying ? FontWeight.w500 : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Play/Pause button
                  IconButton(
                    iconSize: 26,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                    icon: isBuffering
                        ? SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(stationColor),
                            ),
                          )
                        : Icon(
                            isPlaying ? PhosphorIconsFill.pauseCircle : PhosphorIconsFill.playCircle,
                            color: stationColor,
                          ),
                    onPressed: () => radioService.togglePlayPause(),
                  ),

                  // Close button
                  IconButton(
                    iconSize: 20,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(minWidth: 30, minHeight: 30),
                    icon: const Icon(PhosphorIconsRegular.x, color: Color(0xFF94A3B8)),
                    onPressed: () => radioService.stop(),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
