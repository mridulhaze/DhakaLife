import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class WeatherChip extends StatefulWidget {
  final Map<String, dynamic>? weatherSummary;
  final VoidCallback onTap;

  const WeatherChip({
    Key? key,
    required this.weatherSummary,
    required this.onTap,
  }) : super(key: key);

  @override
  State<WeatherChip> createState() => _WeatherChipState();
}

class _WeatherChipState extends State<WeatherChip>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 0.90, end: 1.15).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final hour = now.hour;

    final temp = widget.weatherSummary?['temperature'] ?? '২৮° সে.';
    final cond = widget.weatherSummary?['conditionBn'] ?? 'পরিষ্কার';

    String greeting;
    IconData weatherIcon;
    Color iconColor;

    if (hour >= 5 && hour < 12) {
      greeting = 'সুপ্রভাত ঢাকা';
      weatherIcon = PhosphorIcons.sunHorizon(PhosphorIconsStyle.fill);
      iconColor = const Color(0xFFF59E0B);
    } else if (hour >= 12 && hour < 17) {
      greeting = 'শুভ দুপুর ঢাকা';
      weatherIcon = PhosphorIcons.sun(PhosphorIconsStyle.fill);
      iconColor = const Color(0xFFF59E0B);
    } else if (hour >= 17 && hour < 20) {
      greeting = 'শুভ সন্ধ্যা ঢাকা';
      weatherIcon = PhosphorIcons.sunHorizon(PhosphorIconsStyle.fill);
      iconColor = const Color(0xFFFB923C);
    } else {
      greeting = 'শুভ রাত্রি ঢাকা';
      weatherIcon = PhosphorIcons.moonStars(PhosphorIconsStyle.fill);
      iconColor = const Color(0xFFFCD34D);
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.68),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.white.withOpacity(0.8),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ScaleTransition(
                    scale: _pulseAnimation,
                    child: Icon(weatherIcon, color: iconColor, size: 16),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '$greeting • $temp • $cond',
                    style: const TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.chevron_right_rounded,
                    color: Color(0xFF64748B),
                    size: 14,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
