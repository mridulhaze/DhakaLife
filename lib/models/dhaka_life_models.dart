import 'package:flutter/material.dart';

class DhakaServiceItem {
  final String id;
  final String titleBn;
  final String titleEn;
  final String descBn;
  final String descEn;
  final String? badgeBn;
  final String? badgeEn;
  final Color? badgeColor;
  final IconData icon;
  final Color iconColor;
  final Color cardBg;
  final VoidCallback onTap;

  DhakaServiceItem({
    required this.id,
    required this.titleBn,
    required this.titleEn,
    required this.descBn,
    required this.descEn,
    this.badgeBn,
    this.badgeEn,
    this.badgeColor,
    required this.icon,
    required this.iconColor,
    required this.cardBg,
    required this.onTap,
  });
}

class DhakaEmergencyContact {
  final String titleBn;
  final String titleEn;
  final String number;
  final String category;
  final String descriptionBn;
  final String descriptionEn;
  final IconData icon;
  final Color color;

  DhakaEmergencyContact({
    required this.titleBn,
    required this.titleEn,
    required this.number,
    required this.category,
    required this.descriptionBn,
    required this.descriptionEn,
    required this.icon,
    required this.color,
  });
}

class DhakaBusRoute {
  final String busNameBn;
  final String busNameEn;
  final String routeBn;
  final String routeEn;
  final String startPoint;
  final String endPoint;
  final List<String> keyStopsBn;
  final String fareRange;

  DhakaBusRoute({
    required this.busNameBn,
    required this.busNameEn,
    required this.routeBn,
    required this.routeEn,
    required this.startPoint,
    required this.endPoint,
    required this.keyStopsBn,
    required this.fareRange,
  });
}

class DhakaMetroStation {
  final int stationNo;
  final String nameBn;
  final String nameEn;
  final String locationArea;
  final int fareFromUttaraNorth;
  final String travelTime;

  DhakaMetroStation({
    required this.stationNo,
    required this.nameBn,
    required this.nameEn,
    required this.locationArea,
    required this.fareFromUttaraNorth,
    required this.travelTime,
  });
}

class DhakaBazarItem {
  final String nameBn;
  final String nameEn;
  final double currentPrice;
  final double previousPrice;
  final String unitBn;
  final String category;
  final String marketName;

  DhakaBazarItem({
    required this.nameBn,
    required this.nameEn,
    required this.currentPrice,
    required this.previousPrice,
    required this.unitBn,
    required this.category,
    required this.marketName,
  });

  bool get isPriceUp => currentPrice > previousPrice;
  bool get isPriceDown => currentPrice < previousPrice;
}

class DhakaCivicReport {
  final String id;
  final String titleBn;
  final String categoryBn;
  final String locationBn;
  final String date;
  final String statusBn;
  final Color statusColor;
  final String descriptionBn;

  DhakaCivicReport({
    required this.id,
    required this.titleBn,
    required this.categoryBn,
    required this.locationBn,
    required this.date,
    required this.statusBn,
    required this.statusColor,
    required this.descriptionBn,
  });
}

class DhakaNearbyPlace {
  final String nameBn;
  final String categoryBn;
  final String areaBn;
  final String distance;
  final String phone;
  final double rating;
  final IconData icon;

  DhakaNearbyPlace({
    required this.nameBn,
    required this.categoryBn,
    required this.areaBn,
    required this.distance,
    required this.phone,
    required this.rating,
    required this.icon,
  });
}

class NuNoticeItem {
  final String title;
  final String date;
  final String url;
  final String category;

  NuNoticeItem({
    required this.title,
    required this.date,
    required this.url,
    required this.category,
  });
}

