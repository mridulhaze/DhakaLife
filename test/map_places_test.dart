import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project_nutcm_1/models/dhaka_place_model.dart';

void main() {
  group('DhakaPlace Model Tests', () {
    test('Verified places list contains accurate Dhaka coordinates and essential services', () {
      final places = DhakaPlace.verifiedDhakaPlaces;
      expect(places.isNotEmpty, isTrue);
      expect(places.length, greaterThanOrEqualTo(10));

      for (final place in places) {
        expect(place.id.isNotEmpty, isTrue);
        expect(place.nameBn.isNotEmpty, isTrue);
        expect(place.category.isNotEmpty, isTrue);
        // Valid Greater Dhaka geographic bounding box
        expect(place.latitude, inInclusiveRange(23.60, 24.00));
        expect(place.longitude, inInclusiveRange(90.25, 90.55));
        expect(place.addressBn.isNotEmpty, isTrue);
      }
    });

    test('Serializes to and from JSON accurately', () {
      const place = DhakaPlace(
        id: 'test_hospital',
        nameBn: 'টেস্ট ক্লিনিক',
        nameEn: 'Test Clinic',
        category: 'hospital',
        categoryBn: 'হাসপাতাল',
        latitude: 23.8103,
        longitude: 90.4125,
        addressBn: 'মিরপুর, ঢাকা',
        phone: '01700000000',
        isOpen24Hours: true,
      );

      final json = place.toJson();
      expect(json['id'], 'test_hospital');
      expect(json['nameBn'], 'টেস্ট ক্লিনিক');
      expect(json['category'], 'hospital');
      expect(json['latitude'], 23.8103);
      expect(json['longitude'], 90.4125);

      final reconstructed = DhakaPlace.fromJson(json);
      expect(reconstructed.id, place.id);
      expect(reconstructed.nameBn, place.nameBn);
      expect(reconstructed.categoryBn, place.categoryBn);
      expect(reconstructed.latitude, place.latitude);
      expect(reconstructed.longitude, place.longitude);
      expect(reconstructed.isOpen24Hours, isTrue);
    });

    test('Contains major Dhaka emergency landmarks across categories', () {
      final categories = DhakaPlace.verifiedDhakaPlaces.map((p) => p.category).toSet();
      expect(categories.contains('hospital'), isTrue);
      expect(categories.contains('police'), isTrue);
      expect(categories.contains('metro'), isTrue);
      expect(categories.contains('fire'), isTrue);
    });
  });
}
