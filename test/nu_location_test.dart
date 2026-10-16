import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project_nutcm_1/models/nu_location_model.dart';
import 'package:flutter_project_nutcm_1/services/nu_location_service.dart';

void main() {
  group('NuLocationItem Model Tests', () {
    test('Parses from raw bill_locations map correctly', () {
      final raw = {
        "places": "Amtali",
        "Gazipur_Sadar": "277",
        "District": "Barguna",
        "Cat_1_grade_1_bill": "14762",
        "Cat_1_grade_2_3_bill": "14412",
        "Cat_1_grade_4_5_bill": "14062",
        "Cat_2_grade_6_7_bill": "11132",
        "Cat_2_grade_8_10_bill": "11082"
      };

      final item = NuLocationItem.fromMap(raw, 'amtali_1');

      expect(item.id, 'amtali_1');
      expect(item.places, 'Amtali');
      expect(item.district, 'Barguna');
      expect(item.gazipurSadarKm, 277);
      expect(item.cat1Grade1Bill, 14762);
      expect(item.cat1Grade2To3Bill, 14412);
      expect(item.cat1Grade4To5Bill, 14062);
      expect(item.cat2Grade6To7Bill, 11132);
      expect(item.cat2Grade8To10Bill, 11082);
    });

    test('Serializes to Map and JSON accurately', () {
      const item = NuLocationItem(
        id: 'bamna_1',
        places: 'Bamna',
        district: 'Barguna',
        gazipurSadarKm: 281,
        cat1Grade1Bill: 14906,
        cat1Grade2To3Bill: 14556,
        cat1Grade4To5Bill: 14206,
        cat2Grade6To7Bill: 11228,
        cat2Grade8To10Bill: 11178,
      );

      final map = item.toMap();
      expect(map['places'], 'Bamna');
      expect(map['District'], 'Barguna');
      expect(map['Gazipur_Sadar'], '281');
      expect(map['Cat_1_grade_1_bill'], '14906');

      final json = item.toJson();
      final reconstituted = NuLocationItem.fromJson(json);
      expect(reconstituted.places, item.places);
      expect(reconstituted.gazipurSadarKm, item.gazipurSadarKm);
      expect(reconstituted.cat1Grade1Bill, item.cat1Grade1Bill);
    });

    test('Resilient parser handles missing or malformed fields without crashing', () {
      final incomplete = {
        "places": "Unknown Place",
        "District": "Dhaka",
      };

      final item = NuLocationItem.fromMap(incomplete);
      expect(item.places, 'Unknown Place');
      expect(item.district, 'Dhaka');
      expect(item.gazipurSadarKm, 0);
      expect(item.cat1Grade1Bill, 0);
    });
  });

  group('NuLocationService Logic Tests', () {
    test('Baseline dataset contains verified locations across districts', () {
      final baseline = NuLocationService.baselineLocations;
      expect(baseline.isNotEmpty, true);
      expect(baseline.any((loc) => loc['places'] == 'Amtali'), true);
      expect(baseline.any((loc) => loc['places'] == 'Barishal Sadar'), true);
      expect(baseline.any((loc) => loc['District'] == 'Barguna'), true);
    });

    test('Search filters case-insensitively by place and district', () {
      final items = NuLocationService.baselineLocations
          .map((m) => NuLocationItem.fromMap(m))
          .toList();

      final searchByPlace = items.where((i) => i.places.toLowerCase().contains('bamna')).toList();
      expect(searchByPlace.length, 1);
      expect(searchByPlace.first.places, 'Bamna');

      final searchByDistrict = items.where((i) => i.district.toLowerCase().contains('barguna')).toList();
      expect(searchByDistrict.length >= 6, true);
    });
  });
}
