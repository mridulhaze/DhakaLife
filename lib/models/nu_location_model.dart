import 'package:cloud_firestore/cloud_firestore.dart';

class NuLocationItem {
  final String id;
  final String places;
  final String district;
  final int gazipurSadarKm;
  final int cat1Grade1Bill;
  final int cat1Grade2To3Bill;
  final int cat1Grade4To5Bill;
  final int cat2Grade6To7Bill;
  final int cat2Grade8To10Bill;
  final String? imageUrl;

  const NuLocationItem({
    required this.id,
    required this.places,
    required this.district,
    required this.gazipurSadarKm,
    required this.cat1Grade1Bill,
    required this.cat1Grade2To3Bill,
    required this.cat1Grade4To5Bill,
    required this.cat2Grade6To7Bill,
    required this.cat2Grade8To10Bill,
    this.imageUrl,
  });

  static int _parseInt(dynamic val, [int fallback = 0]) {
    if (val == null) return fallback;
    if (val is int) return val;
    if (val is num) return val.toInt();
    if (val is String) {
      final sanitized = val.replaceAll(RegExp(r'[^\d]'), '');
      return int.tryParse(sanitized) ?? fallback;
    }
    return fallback;
  }

  factory NuLocationItem.fromMap(Map<String, dynamic> map, [String? docId]) {
    return NuLocationItem(
      id: docId ?? map['id']?.toString() ?? map['places']?.toString() ?? '',
      places: map['places']?.toString() ?? map['name']?.toString() ?? '',
      district: map['District']?.toString() ?? map['district']?.toString() ?? '',
      gazipurSadarKm: _parseInt(map['Gazipur_Sadar'] ?? map['gazipurSadarKm']),
      cat1Grade1Bill: _parseInt(
        map['Cat_1_grade_1_bill'] ??
            map['cat1Grade1Bill'] ??
            map['Catagory_1_grade_1_bill'],
      ),
      cat1Grade2To3Bill: _parseInt(
        map['Cat_1_grade_2_3_bill'] ??
            map['cat1Grade2To3Bill'] ??
            map['Catagory_1_grade_(2-3)_bill'],
      ),
      cat1Grade4To5Bill: _parseInt(
        map['Cat_1_grade_4_5_bill'] ??
            map['cat1Grade4To5Bill'] ??
            map['Catagory_1_grade_(4-5)_bill'],
      ),
      cat2Grade6To7Bill: _parseInt(
        map['Cat_2_grade_6_7_bill'] ??
            map['cat2Grade6To7Bill'] ??
            map['Catagory_2_grade_(6-7)_bill'],
      ),
      cat2Grade8To10Bill: _parseInt(
        map['Cat_2_grade_8_10_bill'] ??
            map['cat2Grade8To10Bill'] ??
            map['Catagory_2_grade_(8-10)_bill'],
      ),
      imageUrl: map['image']?.toString() ?? map['imageUrl']?.toString(),
    );
  }

  factory NuLocationItem.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return NuLocationItem.fromMap(data, doc.id);
  }

  Map<String, dynamic> toMap() {
    return {
      'places': places,
      'District': district,
      'Gazipur_Sadar': gazipurSadarKm.toString(),
      'Cat_1_grade_1_bill': cat1Grade1Bill.toString(),
      'Cat_1_grade_2_3_bill': cat1Grade2To3Bill.toString(),
      'Cat_1_grade_4_5_bill': cat1Grade4To5Bill.toString(),
      'Cat_2_grade_6_7_bill': cat2Grade6To7Bill.toString(),
      'Cat_2_grade_8_10_bill': cat2Grade8To10Bill.toString(),
      if (imageUrl != null) 'image': imageUrl,
    };
  }

  factory NuLocationItem.fromJson(Map<String, dynamic> json) =>
      NuLocationItem.fromMap(json, json['id']?.toString());

  Map<String, dynamic> toJson() {
    final map = toMap();
    map['id'] = id;
    return map;
  }
}
