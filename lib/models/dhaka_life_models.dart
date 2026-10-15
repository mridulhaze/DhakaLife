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

class DhakaWeatherData {
  final double temperature;
  final double apparentTemperature;
  final int relativeHumidity;
  final double windSpeed;
  final double precipitation;
  final int weatherCode;
  final String conditionBn;
  final String conditionEn;
  final IconData icon;
  final bool isLive;
  final String updatedTime;

  DhakaWeatherData({
    required this.temperature,
    required this.apparentTemperature,
    required this.relativeHumidity,
    required this.windSpeed,
    required this.precipitation,
    required this.weatherCode,
    required this.conditionBn,
    required this.conditionEn,
    required this.icon,
    required this.isLive,
    required this.updatedTime,
  });

  static Map<String, dynamic> parseWmoCode(int code) {
    if (code == 0) {
      return {'bn': 'পরিষ্কার আকাশ', 'en': 'Clear Sky', 'icon': Icons.wb_sunny};
    } else if (code == 1 || code == 2) {
      return {'bn': 'আংশিক মেঘলা', 'en': 'Partly Cloudy', 'icon': Icons.wb_cloudy};
    } else if (code == 3) {
      return {'bn': 'মেঘাচ্ছন্ন আকাশ', 'en': 'Overcast', 'icon': Icons.cloud};
    } else if (code == 45 || code == 48) {
      return {'bn': 'কুয়াশাচ্ছন্ন', 'en': 'Foggy', 'icon': Icons.cloud_queue};
    } else if (code >= 51 && code <= 55) {
      return {'bn': 'গুঁড়ি গুঁড়ি বৃষ্টি', 'en': 'Drizzle', 'icon': Icons.grain};
    } else if (code >= 61 && code <= 65) {
      return {'bn': 'বৃষ্টিপাত', 'en': 'Rain', 'icon': Icons.water_drop};
    } else if (code >= 66 && code <= 67) {
      return {'bn': 'শীতল বৃষ্টি', 'en': 'Freezing Rain', 'icon': Icons.ac_unit};
    } else if (code >= 80 && code <= 82) {
      return {'bn': 'ভারী বর্ষণ', 'en': 'Rain Showers', 'icon': Icons.thunderstorm};
    } else if (code >= 95 && code <= 99) {
      return {'bn': 'বজ্রসহ বৃষ্টিপাত', 'en': 'Thunderstorm', 'icon': Icons.thunderstorm};
    }
    return {'bn': 'স্বাভাবিক আকাশ', 'en': 'Clear', 'icon': Icons.wb_sunny};
  }

  factory DhakaWeatherData.fromOpenMeteoJson(Map<String, dynamic> json) {
    final current = json['current'] as Map<String, dynamic>? ?? {};
    final double temp = (current['temperature_2m'] as num?)?.toDouble() ?? 29.0;
    final double feels = (current['apparent_temperature'] as num?)?.toDouble() ?? temp;
    final int humidity = (current['relative_humidity_2m'] as num?)?.toInt() ?? 65;
    final double wind = (current['wind_speed_10m'] as num?)?.toDouble() ?? 8.0;
    final double precip = (current['precipitation'] as num?)?.toDouble() ?? 0.0;
    final int code = (current['weather_code'] as num?)?.toInt() ?? 0;

    final conditionInfo = parseWmoCode(code);

    return DhakaWeatherData(
      temperature: temp,
      apparentTemperature: feels,
      relativeHumidity: humidity,
      windSpeed: wind,
      precipitation: precip,
      weatherCode: code,
      conditionBn: conditionInfo['bn'] as String,
      conditionEn: conditionInfo['en'] as String,
      icon: conditionInfo['icon'] as IconData,
      isLive: true,
      updatedTime: 'লাইভ হালনাগাদকৃত (${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')})',
    );
  }

  factory DhakaWeatherData.fallback({String? note}) {
    return DhakaWeatherData(
      temperature: 29.0,
      apparentTemperature: 33.0,
      relativeHumidity: 68,
      windSpeed: 8.5,
      precipitation: 0.0,
      weatherCode: 1,
      conditionBn: 'আংশিক মেঘলা ও রোদ',
      conditionEn: 'Partly Cloudy',
      icon: Icons.wb_cloudy,
      isLive: false,
      updatedTime: note ?? 'অফলাইন ক্যাশ ডেটা (Dhaka standard)',
    );
  }

  Map<String, dynamic> toLegacyMap() {
    return {
      'temperature': '${temperature.round()}°C',
      'feelsLike': '${apparentTemperature.round()}°C',
      'conditionBn': conditionBn,
      'conditionEn': conditionEn,
      'humidity': '$relativeHumidity%',
      'windSpeed': '${windSpeed.toStringAsFixed(1)} কিমি/ঘণ্টা',
      'precipitation': '${precipitation.toStringAsFixed(1)} মিমি',
      'icon': icon,
      'isLive': isLive,
      'updatedTime': updatedTime,
    };
  }
}

