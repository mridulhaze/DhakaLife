import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project_nutcm_1/models/dhaka_life_models.dart';
import 'package:flutter_project_nutcm_1/services/dhaka_data_service.dart';

void main() {
  group('DhakaWeatherData Model Tests', () {
    test('Parses valid Open-Meteo JSON payload correctly', () {
      final sampleJson = {
        'latitude': 23.8103,
        'longitude': 90.4125,
        'timezone': 'Asia/Dhaka',
        'current': {
          'time': '2026-10-15T22:00',
          'interval': 900,
          'temperature_2m': 28.6,
          'relative_humidity_2m': 72,
          'apparent_temperature': 33.2,
          'precipitation': 0.0,
          'weather_code': 1,
          'wind_speed_10m': 6.2,
        }
      };

      final weather = DhakaWeatherData.fromOpenMeteoJson(sampleJson);

      expect(weather.temperature, 28.6);
      expect(weather.apparentTemperature, 33.2);
      expect(weather.relativeHumidity, 72);
      expect(weather.windSpeed, 6.2);
      expect(weather.precipitation, 0.0);
      expect(weather.weatherCode, 1);
      expect(weather.conditionBn, 'আংশিক মেঘলা');
      expect(weather.isLive, true);
    });

    test('WMO weather code parser maps conditions to Bangla correctly', () {
      final clear = DhakaWeatherData.parseWmoCode(0);
      expect(clear['bn'], 'পরিষ্কার আকাশ');

      final cloudy = DhakaWeatherData.parseWmoCode(3);
      expect(cloudy['bn'], 'মেঘাচ্ছন্ন আকাশ');

      final drizzle = DhakaWeatherData.parseWmoCode(53);
      expect(drizzle['bn'], 'গুঁড়ি গুঁড়ি বৃষ্টি');

      final rain = DhakaWeatherData.parseWmoCode(63);
      expect(rain['bn'], 'বৃষ্টিপাত');

      final thunderstorm = DhakaWeatherData.parseWmoCode(95);
      expect(thunderstorm['bn'], 'বজ্রসহ বৃষ্টিপাত');
    });

    test('Fallback constructor provides resilient default data', () {
      final fallback = DhakaWeatherData.fallback();

      expect(fallback.temperature, 29.0);
      expect(fallback.isLive, false);
      expect(fallback.conditionBn, isNotEmpty);
      expect(fallback.icon, isNotNull);
    });

    test('toLegacyMap exports expected keys for legacy views', () {
      final fallback = DhakaWeatherData.fallback();
      final map = fallback.toLegacyMap();

      expect(map.containsKey('temperature'), true);
      expect(map.containsKey('feelsLike'), true);
      expect(map.containsKey('conditionBn'), true);
      expect(map.containsKey('humidity'), true);
      expect(map.containsKey('windSpeed'), true);
      expect(map.containsKey('icon'), true);
      expect(map.containsKey('isLive'), true);
      expect(map['isLive'], false);
    });
  });

  group('DhakaDataService Weather Fetcher', () {
    test('fetchDhakaWeatherData returns non-null model without throwing', () async {
      final weather = await DhakaDataService.fetchDhakaWeatherData();
      expect(weather, isNotNull);
      expect(weather.temperature, isNonNegative);
      expect(weather.conditionBn, isNotEmpty);
    });
  });
}
