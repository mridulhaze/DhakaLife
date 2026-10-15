import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum ServiceIconType {
  phosphor,
  material,
  assetSvg,
}

class ServiceIcon extends StatelessWidget {
  final IconData? iconData;
  final String? assetPath;
  final ServiceIconType type;
  final Color iconColor;
  final Color backgroundColor;
  final double size;
  final double containerSize;
  final double borderRadius;
  final String semanticLabel;

  const ServiceIcon({
    Key? key,
    this.iconData,
    this.assetPath,
    this.type = ServiceIconType.phosphor,
    required this.iconColor,
    required this.backgroundColor,
    this.size = 32.0,
    this.containerSize = 56.0,
    this.borderRadius = 16.0,
    required this.semanticLabel,
  }) : super(key: key);

  // Pre-configured semantic icon factories for DhakaLife services
  factory ServiceIcon.nuHub({double containerSize = 56.0, double size = 32.0}) {
    return ServiceIcon(
      iconData: PhosphorIcons.graduationCap(PhosphorIconsStyle.fill),
      iconColor: const Color(0xFF1565C0),
      backgroundColor: const Color(0xFFE3F2FD),
      semanticLabel: 'জাতীয় বিশ্ববিদ্যালয়',
      containerSize: containerSize,
      size: size,
    );
  }

  factory ServiceIcon.transport({double containerSize = 56.0, double size = 32.0}) {
    return ServiceIcon(
      iconData: PhosphorIcons.train(PhosphorIconsStyle.fill),
      iconColor: const Color(0xFF00897B),
      backgroundColor: const Color(0xFFE0F2F1),
      semanticLabel: 'পাবলিক ট্রান্সপোর্ট ও মেট্রো',
      containerSize: containerSize,
      size: size,
    );
  }

  factory ServiceIcon.emergency({double containerSize = 56.0, double size = 32.0}) {
    return ServiceIcon(
      iconData: PhosphorIcons.firstAid(PhosphorIconsStyle.fill),
      iconColor: const Color(0xFFE53935),
      backgroundColor: const Color(0xFFFFEBEE),
      semanticLabel: 'জরুরি সেবা ৯৯৯',
      containerSize: containerSize,
      size: size,
    );
  }

  factory ServiceIcon.bazar({double containerSize = 56.0, double size = 32.0}) {
    return ServiceIcon(
      iconData: PhosphorIcons.shoppingBag(PhosphorIconsStyle.fill),
      iconColor: const Color(0xFFF57C00),
      backgroundColor: const Color(0xFFFFF3E0),
      semanticLabel: 'দৈনিক বাজার দর',
      containerSize: containerSize,
      size: size,
    );
  }

  factory ServiceIcon.weather({double containerSize = 56.0, double size = 32.0}) {
    return ServiceIcon(
      iconData: PhosphorIcons.cloudSun(PhosphorIconsStyle.fill),
      iconColor: const Color(0xFF0288D1),
      backgroundColor: const Color(0xFFE1F5FE),
      semanticLabel: 'আবহাওয়া ও বন্যা',
      containerSize: containerSize,
      size: size,
    );
  }

  factory ServiceIcon.expense({double containerSize = 56.0, double size = 32.0}) {
    return ServiceIcon(
      iconData: PhosphorIcons.wallet(PhosphorIconsStyle.fill),
      iconColor: const Color(0xFF2E7D32),
      backgroundColor: const Color(0xFFE8F5E9),
      semanticLabel: 'দৈনিক খরচের হিসাব',
      containerSize: containerSize,
      size: size,
    );
  }

  factory ServiceIcon.household({double containerSize = 56.0, double size = 32.0}) {
    return ServiceIcon(
      iconData: PhosphorIcons.wrench(PhosphorIconsStyle.fill),
      iconColor: const Color(0xFF3949AB),
      backgroundColor: const Color(0xFFEDE7F6),
      semanticLabel: 'নিকটবর্তী প্রয়োজনীয় সেবা',
      containerSize: containerSize,
      size: size,
    );
  }

  factory ServiceIcon.civic({double containerSize = 56.0, double size = 32.0}) {
    return ServiceIcon(
      iconData: PhosphorIcons.warningCircle(PhosphorIconsStyle.fill),
      iconColor: const Color(0xFFC2185B),
      backgroundColor: const Color(0xFFFCE4EC),
      semanticLabel: 'নাগরিক সমস্যা',
      containerSize: containerSize,
      size: size,
    );
  }

  factory ServiceIcon.govt({double containerSize = 56.0, double size = 32.0}) {
    return ServiceIcon(
      iconData: PhosphorIcons.buildings(PhosphorIconsStyle.fill),
      iconColor: const Color(0xFF5D4037),
      backgroundColor: const Color(0xFFEFEBE9),
      semanticLabel: 'সরকারি সেবা',
      containerSize: containerSize,
      size: size,
    );
  }

  factory ServiceIcon.ai({double containerSize = 56.0, double size = 32.0}) {
    return ServiceIcon(
      iconData: PhosphorIcons.sparkle(PhosphorIconsStyle.fill),
      iconColor: const Color(0xFF8E24AA),
      backgroundColor: const Color(0xFFF3E5F5),
      semanticLabel: 'বাংলা এআই সহকারী',
      containerSize: containerSize,
      size: size,
    );
  }

  factory ServiceIcon.blood({double containerSize = 56.0, double size = 32.0}) {
    return ServiceIcon(
      iconData: PhosphorIcons.drop(PhosphorIconsStyle.fill),
      iconColor: const Color(0xFFD32F2F),
      backgroundColor: const Color(0xFFFFEBEE),
      semanticLabel: 'রক্তদাতা সন্ধান',
      containerSize: containerSize,
      size: size,
    );
  }

  factory ServiceIcon.hospital({double containerSize = 56.0, double size = 32.0}) {
    return ServiceIcon(
      iconData: PhosphorIcons.hospital(PhosphorIconsStyle.fill),
      iconColor: const Color(0xFF00897B),
      backgroundColor: const Color(0xFFE0F2F1),
      semanticLabel: 'হাসপাতাল',
      containerSize: containerSize,
      size: size,
    );
  }

  factory ServiceIcon.pharmacy({double containerSize = 56.0, double size = 32.0}) {
    return ServiceIcon(
      iconData: PhosphorIcons.pill(PhosphorIconsStyle.fill),
      iconColor: const Color(0xFF0288D1),
      backgroundColor: const Color(0xFFE1F5FE),
      semanticLabel: 'ফার্মেসি',
      containerSize: containerSize,
      size: size,
    );
  }

  factory ServiceIcon.traffic({double containerSize = 56.0, double size = 32.0}) {
    return ServiceIcon(
      iconData: PhosphorIcons.car(PhosphorIconsStyle.fill),
      iconColor: const Color(0xFFE65100),
      backgroundColor: const Color(0xFFFFF3E0),
      semanticLabel: 'ট্রাফিক ও রুট',
      containerSize: containerSize,
      size: size,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      child: Container(
        width: containerSize,
        height: containerSize,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: iconColor.withOpacity(0.12),
            width: 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: iconColor.withOpacity(0.08),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Icon(
            iconData ?? PhosphorIcons.squaresFour(PhosphorIconsStyle.fill),
            color: iconColor,
            size: size,
          ),
        ),
      ),
    );
  }
}
