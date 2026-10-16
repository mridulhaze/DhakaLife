import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class QuickActionsRow extends StatelessWidget {
  final VoidCallback onEmergencyTap;
  final VoidCallback onMetroTap;
  final VoidCallback onBazarTap;
  final VoidCallback onNuHubTap;

  const QuickActionsRow({
    Key? key,
    required this.onEmergencyTap,
    required this.onMetroTap,
    required this.onBazarTap,
    required this.onNuHubTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          QuickActionItem(
            icon: PhosphorIcons.phoneCall(PhosphorIconsStyle.fill),
            label: 'জরুরি ৯৯৯',
            iconColor: const Color(0xFFDC2626),
            bgColor: const Color(0xFFFEE2E2),
            hasEmergencyRing: true,
            onTap: onEmergencyTap,
          ),
          QuickActionItem(
            icon: PhosphorIcons.train(PhosphorIconsStyle.fill),
            label: 'মেট্রোরেল',
            iconColor: const Color(0xFF059669),
            bgColor: const Color(0xFFD1FAE5),
            onTap: onMetroTap,
          ),
          QuickActionItem(
            icon: PhosphorIcons.shoppingBag(PhosphorIconsStyle.fill),
            label: 'বাজার দর',
            iconColor: const Color(0xFFD97706),
            bgColor: const Color(0xFFFEF3C7),
            onTap: onBazarTap,
          ),
          QuickActionItem(
            icon: PhosphorIcons.graduationCap(PhosphorIconsStyle.fill),
            label: 'এনইউ হাব',
            iconColor: const Color(0xFF7C3AED),
            bgColor: const Color(0xFFEDE9FE),
            onTap: onNuHubTap,
          ),
        ],
      ),
    );
  }
}

class QuickActionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;
  final Color bgColor;
  final bool hasEmergencyRing;
  final VoidCallback onTap;

  const QuickActionItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.iconColor,
    required this.bgColor,
    this.hasEmergencyRing = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: bgColor,
                shape: BoxShape.circle,
                border: hasEmergencyRing
                    ? Border.all(
                        color: const Color(0xFFEF4444).withOpacity(0.4),
                        width: 2,
                      )
                    : null,
                boxShadow: [
                  BoxShadow(
                    color: bgColor.withOpacity(0.5),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
