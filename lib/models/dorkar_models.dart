import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Represents a geographic Dhaka thana/area with coordinates and Haversine distance
class DorkarArea {
  final String id;
  final String nameBn;
  final String nameEn;
  final double latitude;
  final double longitude;

  const DorkarArea({
    required this.id,
    required this.nameBn,
    required this.nameEn,
    required this.latitude,
    required this.longitude,
  });

  /// Calculates Haversine distance in kilometers
  static double calculateDistanceKm(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const p = 0.017453292519943295; // Math.PI / 180
    final a = 0.5 -
        math.cos((lat2 - lat1) * p) / 2 +
        math.cos(lat1 * p) *
            math.cos(lat2 * p) *
            (1 - math.cos((lon2 - lon1) * p)) /
            2;
    return 12742 * math.asin(math.sqrt(a)); // 2 * R; R = 6371 km
  }

  /// Formats distance in Bengali (e.g., '৪৫০ মিটার' or '১.২ কিমি')
  static String formatDistanceBn(double distanceKm) {
    if (distanceKm < 1.0) {
      final meters = (distanceKm * 1000).round();
      return '${_toBanglaNumber(meters)} মিটার';
    } else {
      final km = (distanceKm * 10).round() / 10;
      return '${_toBanglaNumber(km)} কিমি';
    }
  }

  static String _toBanglaNumber(dynamic num) {
    const enToBn = {
      '0': '০',
      '1': '১',
      '2': '২',
      '3': '৩',
      '4': '৪',
      '5': '৫',
      '6': '৬',
      '7': '৭',
      '8': '৮',
      '9': '৯',
      '.': '.',
    };
    final str = num.toString();
    return str.split('').map((char) => enToBn[char] ?? char).join();
  }
}

/// Service Category
class DorkarCategory {
  final String id;
  final String titleBn;
  final String titleEn;
  final IconData icon;
  final Color themeColor;

  const DorkarCategory({
    required this.id,
    required this.titleBn,
    required this.titleEn,
    required this.icon,
    required this.themeColor,
  });
}

/// Review item
class DorkarReview {
  final String id;
  final String authorName;
  final double rating;
  final String comment;
  final String date;

  const DorkarReview({
    required this.id,
    required this.authorName,
    required this.rating,
    required this.comment,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'authorName': authorName,
        'rating': rating,
        'comment': comment,
        'date': date,
      };

  factory DorkarReview.fromJson(Map<String, dynamic> json) => DorkarReview(
        id: json['id'] as String,
        authorName: json['authorName'] as String,
        rating: (json['rating'] as num).toDouble(),
        comment: json['comment'] as String,
        date: json['date'] as String,
      );
}

/// Service Provider (Mistri / Technician / Shop / Facility)
class DorkarProvider {
  final String id;
  final String nameBn;
  final String nameEn;
  final String categoryId;
  final String categoryTitleBn;
  final String phone;
  final String? whatsapp;
  final String? shopName;
  final int experienceYears;
  final String toolsOrEquipment;
  final String areaId;
  final String areaNameBn;
  final double latitude;
  final double longitude;
  final double rating;
  final int reviewCount;
  final bool isVerified;
  final bool isCommunityAdded;
  final bool isEmergencyEligible;
  final String priceEstimate;
  final List<String> servicesOffered;
  final List<DorkarReview> reviews;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;

  const DorkarProvider({
    required this.id,
    required this.nameBn,
    required this.nameEn,
    required this.categoryId,
    required this.categoryTitleBn,
    required this.phone,
    this.whatsapp,
    this.shopName,
    this.experienceYears = 5,
    this.toolsOrEquipment = 'প্রয়োজনীয় স্ট্যান্ডার্ড টুলস ও কিট',
    required this.areaId,
    required this.areaNameBn,
    required this.latitude,
    required this.longitude,
    this.rating = 4.8,
    this.reviewCount = 12,
    this.isVerified = true,
    this.isCommunityAdded = false,
    this.isEmergencyEligible = false,
    this.priceEstimate = 'পরিদর্শন ফি: ৳২০০ - ৳৫০০',
    this.servicesOffered = const [],
    this.reviews = const [],
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
  });

  DorkarProvider copyWith({
    List<DorkarReview>? reviews,
    double? rating,
    int? reviewCount,
  }) {
    return DorkarProvider(
      id: id,
      nameBn: nameBn,
      nameEn: nameEn,
      categoryId: categoryId,
      categoryTitleBn: categoryTitleBn,
      phone: phone,
      whatsapp: whatsapp,
      shopName: shopName,
      experienceYears: experienceYears,
      toolsOrEquipment: toolsOrEquipment,
      areaId: areaId,
      areaNameBn: areaNameBn,
      latitude: latitude,
      longitude: longitude,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      isVerified: isVerified,
      isCommunityAdded: isCommunityAdded,
      isEmergencyEligible: isEmergencyEligible,
      priceEstimate: priceEstimate,
      servicesOffered: servicesOffered,
      reviews: reviews ?? this.reviews,
      icon: icon,
      iconColor: iconColor,
      iconBgColor: iconBgColor,
    );
  }
}

/// Marketplace Service Catalog item with transparent price ranges
class DorkarMarketplaceService {
  final String id;
  final String parentCategoryId;
  final String titleBn;
  final String titleEn;
  final String descriptionBn;
  final IconData icon;
  final String priceUnit;
  final int minPriceBdt;
  final int maxPriceBdt;
  final bool isEmergencyEligible;

  const DorkarMarketplaceService({
    required this.id,
    required this.parentCategoryId,
    required this.titleBn,
    required this.titleEn,
    required this.descriptionBn,
    required this.icon,
    required this.priceUnit,
    required this.minPriceBdt,
    required this.maxPriceBdt,
    this.isEmergencyEligible = false,
  });
}

/// Booking model
enum DorkarBookingMode { emergencyNow, schedule, inspectThenQuote }

class DorkarBookingRequest {
  final String id;
  final String serviceTitleBn;
  final String? providerName;
  final DorkarBookingMode mode;
  final String userPhone;
  final String userAddress;
  final String issueDescription;
  final String? scheduledDate;
  final String estimatedPrice;
  final String status;
  final DateTime createdAt;

  const DorkarBookingRequest({
    required this.id,
    required this.serviceTitleBn,
    this.providerName,
    required this.mode,
    required this.userPhone,
    required this.userAddress,
    required this.issueDescription,
    this.scheduledDate,
    required this.estimatedPrice,
    this.status = 'অনুরোধ গৃহীত (Pending)',
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'serviceTitleBn': serviceTitleBn,
        'providerName': providerName,
        'mode': mode.index,
        'userPhone': userPhone,
        'userAddress': userAddress,
        'issueDescription': issueDescription,
        'scheduledDate': scheduledDate,
        'estimatedPrice': estimatedPrice,
        'status': status,
        'createdAt': createdAt.toIso8601String(),
      };

  factory DorkarBookingRequest.fromJson(Map<String, dynamic> json) =>
      DorkarBookingRequest(
        id: json['id'] as String,
        serviceTitleBn: json['serviceTitleBn'] as String,
        providerName: json['providerName'] as String?,
        mode: DorkarBookingMode.values[json['mode'] as int],
        userPhone: json['userPhone'] as String,
        userAddress: json['userAddress'] as String,
        issueDescription: json['issueDescription'] as String,
        scheduledDate: json['scheduledDate'] as String?,
        estimatedPrice: json['estimatedPrice'] as String,
        status: json['status'] as String,
        createdAt: DateTime.parse(json['createdAt'] as String),
      );
}
