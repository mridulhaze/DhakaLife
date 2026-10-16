import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project_nutcm_1/models/dhaka_radio_station.dart';

void main() {
  group('DhakaRadioStation Model Tests', () {
    test('Default stations list contains valid and verified streaming metadata', () {
      final stations = DhakaRadioStation.defaultStations;
      expect(stations.isNotEmpty, isTrue);
      expect(stations.length, greaterThanOrEqualTo(10));

      for (final station in stations) {
        expect(station.id.isNotEmpty, isTrue);
        expect(station.nameBn.isNotEmpty, isTrue);
        expect(station.country.isNotEmpty, isTrue);
        expect(station.category.isNotEmpty, isTrue);
        if (station.hasDirectStream) {
          expect(station.streamUrl.startsWith('http'), isTrue);
        } else {
          expect(station.isWebOnly, isTrue);
          expect(station.websiteUrl.startsWith('http'), isTrue);
        }
        expect(station.frequency.isNotEmpty, isTrue);
      }
    });

    test('Serializes to and from JSON accurately', () {
      const station = DhakaRadioStation(
        id: 'test_fm',
        name: 'Test Radio',
        nameBn: 'টেস্ট এফএম',
        nameEn: 'Test FM',
        country: 'Bangladesh',
        language: 'Bengali',
        tagline: 'পরীক্ষামূলক সম্প্রচার',
        frequency: '৮৮.৮ FM',
        websiteUrl: 'https://example.com',
        streamUrl: 'https://example.com/live.mp3',
        streamType: 'mp3',
        verificationStatus: 'verified_live',
        enabled: true,
        primaryColorValue: 0xFF123456,
        category: 'টেস্ট',
      );

      final json = station.toJson();
      expect(json['id'], 'test_fm');
      expect(json['nameBn'], 'টেস্ট এফএম');
      expect(json['country'], 'Bangladesh');
      expect(json['verificationStatus'], 'verified_live');
      expect(json['frequency'], '৮৮.৮ FM');

      final reconstructed = DhakaRadioStation.fromJson(json);
      expect(reconstructed.id, station.id);
      expect(reconstructed.nameBn, station.nameBn);
      expect(reconstructed.country, station.country);
      expect(reconstructed.streamUrl, station.streamUrl);
      expect(reconstructed.primaryColorValue, station.primaryColorValue);
      expect(reconstructed.isVerified, isTrue);
      expect(reconstructed.hasDirectStream, isTrue);
    });

    test('Default stations include Betar Bangla, Jago FM, Radio Foorti and Akashvani channels', () {
      final stations = DhakaRadioStation.defaultStations;
      final ids = stations.map((s) => s.id).toList();
      expect(ids.contains('betar_bangla'), isTrue);
      expect(ids.contains('jago_fm'), isTrue);
      expect(ids.contains('radio_foorti'), isTrue);
      expect(ids.contains('air_bangla'), isTrue);
      expect(ids.contains('air_geetanjali'), isTrue);
      expect(ids.contains('fm_gold_kolkata'), isTrue);
      expect(ids.contains('air_maitree'), isTrue);
    });

    test('Country segmentation includes Bangladesh, India, and Global', () {
      final stations = DhakaRadioStation.defaultStations;
      final countries = stations.map((s) => s.country).toSet();
      expect(countries.contains('Bangladesh'), isTrue);
      expect(countries.contains('India'), isTrue);
      expect(countries.contains('Global'), isTrue);
    });

    test('Web only fallback stations do not claim direct streaming', () {
      final stations = DhakaRadioStation.defaultStations;
      final webStations = stations.where((s) => s.isWebOnly).toList();
      expect(webStations.isNotEmpty, isTrue);
      for (final ws in webStations) {
        expect(ws.streamUrl.isEmpty, isTrue);
        expect(ws.websiteUrl.isNotEmpty, isTrue);
        expect(ws.verificationStatus, 'fallback_web');
      }
    });
  });
}
