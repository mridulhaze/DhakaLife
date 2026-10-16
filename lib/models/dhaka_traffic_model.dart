import 'package:flutter/material.dart';

enum DhakaTrafficSeverity {
  clear, // হালকা / স্বাভাবিক
  moderate, // মাঝারি যানজট
  slow, // ধীরগতি
  severe, // তীব্র যানজট
  closed, // রাস্তা বন্ধ
}

enum DhakaTrafficCategory {
  congestion, // যানজট
  accident, // দুর্ঘটনা
  breakdown, // গাড়ি বিকল
  waterlogging, // জলাবদ্ধতা
  construction, // রাস্তা সংস্কার
  vipMovement, // ভিআইপি চলাচল
  rally, // সমাবেশ/মিছিল
}

class DhakaTrafficReport {
  final String id;
  final String title;
  final String roadName;
  final String areaName;
  final String description;
  final DhakaTrafficCategory category;
  final DhakaTrafficSeverity severity;
  final double latitude;
  final double longitude;
  final DateTime timestamp;
  int confirmations;
  bool isVerified;
  final String reportedBy;
  final bool isCommunityReport;

  DhakaTrafficReport({
    required this.id,
    required this.title,
    required this.roadName,
    required this.areaName,
    required this.description,
    required this.category,
    required this.severity,
    required this.latitude,
    required this.longitude,
    required this.timestamp,
    this.confirmations = 1,
    this.isVerified = false,
    this.reportedBy = 'কমিউনিটি ইউজার',
    this.isCommunityReport = true,
  });

  Color get severityColor {
    switch (severity) {
      case DhakaTrafficSeverity.clear:
        return const Color(0xFF10B981); // Emerald Green
      case DhakaTrafficSeverity.moderate:
        return const Color(0xFFEAB308); // Amber Yellow
      case DhakaTrafficSeverity.slow:
        return const Color(0xFFF97316); // Bright Orange
      case DhakaTrafficSeverity.severe:
        return const Color(0xFFEF4444); // Crimson Red
      case DhakaTrafficSeverity.closed:
        return const Color(0xFF64748B); // Slate Gray
    }
  }

  String get severityLabel {
    switch (severity) {
      case DhakaTrafficSeverity.clear:
        return 'হালকা / স্বাভাবিক';
      case DhakaTrafficSeverity.moderate:
        return 'মাঝারি জ্যাম';
      case DhakaTrafficSeverity.slow:
        return 'ধীরগতি';
      case DhakaTrafficSeverity.severe:
        return 'তীব্র যানজট';
      case DhakaTrafficSeverity.closed:
        return 'রাস্তা বন্ধ';
    }
  }

  String get categoryLabel {
    switch (category) {
      case DhakaTrafficCategory.congestion:
        return 'যানজট';
      case DhakaTrafficCategory.accident:
        return 'দুর্ঘটনা';
      case DhakaTrafficCategory.breakdown:
        return 'গাড়ি বিকল';
      case DhakaTrafficCategory.waterlogging:
        return 'জলাবদ্ধতা';
      case DhakaTrafficCategory.construction:
        return 'রাস্তা সংস্কার';
      case DhakaTrafficCategory.vipMovement:
        return 'ভিআইপি প্রটোকল';
      case DhakaTrafficCategory.rally:
        return 'সমাবেশ/মিছিল';
    }
  }

  IconData get categoryIcon {
    switch (category) {
      case DhakaTrafficCategory.congestion:
        return Icons.traffic_rounded;
      case DhakaTrafficCategory.accident:
        return Icons.car_crash_rounded;
      case DhakaTrafficCategory.breakdown:
        return Icons.build_circle_rounded;
      case DhakaTrafficCategory.waterlogging:
        return Icons.water_drop_rounded;
      case DhakaTrafficCategory.construction:
        return Icons.warning_amber_rounded;
      case DhakaTrafficCategory.vipMovement:
        return Icons.shield_rounded;
      case DhakaTrafficCategory.rally:
        return Icons.groups_rounded;
    }
  }

  String get timeAgoBengali {
    final diff = DateTime.now().difference(timestamp);
    if (diff.inMinutes < 2) return 'এইমাত্র';
    if (diff.inMinutes < 60) return '${_toBengaliNum(diff.inMinutes)} মিনিট আগে';
    if (diff.inHours < 24) return '${_toBengaliNum(diff.inHours)} ঘণ্টা আগে';
    return '${_toBengaliNum(diff.inDays)} দিন আগে';
  }

  static String _toBengaliNum(int number) {
    const bengaliDigits = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
    return number
        .toString()
        .split('')
        .map((ch) {
          final digit = int.tryParse(ch);
          return digit != null ? bengaliDigits[digit] : ch;
        })
        .join('');
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'roadName': roadName,
        'areaName': areaName,
        'description': description,
        'category': category.name,
        'severity': severity.name,
        'latitude': latitude,
        'longitude': longitude,
        'timestamp': timestamp.toIso8601String(),
        'confirmations': confirmations,
        'isVerified': isVerified,
        'reportedBy': reportedBy,
        'isCommunityReport': isCommunityReport,
      };

  factory DhakaTrafficReport.fromJson(Map<String, dynamic> json) {
    return DhakaTrafficReport(
      id: json['id'] as String,
      title: json['title'] as String,
      roadName: json['roadName'] as String,
      areaName: json['areaName'] as String,
      description: json['description'] as String,
      category: DhakaTrafficCategory.values.firstWhere(
        (e) => e.name == json['category'],
        orElse: () => DhakaTrafficCategory.congestion,
      ),
      severity: DhakaTrafficSeverity.values.firstWhere(
        (e) => e.name == json['severity'],
        orElse: () => DhakaTrafficSeverity.moderate,
      ),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      timestamp: DateTime.tryParse(json['timestamp'] as String) ?? DateTime.now(),
      confirmations: (json['confirmations'] as num?)?.toInt() ?? 1,
      isVerified: json['isVerified'] as bool? ?? false,
      reportedBy: json['reportedBy'] as String? ?? 'কমিউনিটি ইউজার',
      isCommunityReport: json['isCommunityReport'] as bool? ?? true,
    );
  }
}
