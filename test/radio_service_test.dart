import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project_nutcm_1/models/dhaka_radio_station.dart';

void main() {
  group('DhakaRadioStation Model Tests', () {
    test('Default stations list contains valid and verified streaming metadata', () {
      final stations = DhakaRadioStation.defaultStations;
      expect(stations.isNotEmpty, isTrue);
      expect(stations.length, greaterThanOrEqualTo(5));

      for (final station in stations) {
        expect(station.id.isNotEmpty, isTrue);
        expect(station.nameBn.isNotEmpty, isTrue);
        expect(station.streamUrl.startsWith('http'), isTrue);
        expect(station.frequency.isNotEmpty, isTrue);
      }
    });

    test('Serializes to and from JSON accurately', () {
      const station = DhakaRadioStation(
        id: 'test_fm',
        nameBn: 'টেস্ট এফএম',
        nameEn: 'Test FM',
        tagline: 'পরীক্ষামূলক সম্প্রচার',
        frequency: '৮৮.৮ FM',
        streamUrl: 'https://example.com/live.mp3',
        primaryColorValue: 0xFF123456,
        category: 'টেস্ট',
      );

      final json = station.toJson();
      expect(json['id'], 'test_fm');
      expect(json['nameBn'], 'টেস্ট এফএম');
      expect(json['frequency'], '৮৮.৮ FM');

      final reconstructed = DhakaRadioStation.fromJson(json);
      expect(reconstructed.id, station.id);
      expect(reconstructed.nameBn, station.nameBn);
      expect(reconstructed.streamUrl, station.streamUrl);
      expect(reconstructed.primaryColorValue, station.primaryColorValue);
    });

    test('Default stations include Betar Bangla and Jago FM', () {
      final ids = DhakaRadioStation.defaultStations.map((s) => s.id).toList();
      expect(ids.contains('betar_bangla'), isTrue);
      expect(ids.contains('jago_fm'), isTrue);
    });
  });
}
