import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/nu_location_model.dart';

class NuLocationService extends GetxService {
  static NuLocationService get to =>
      Get.isRegistered<NuLocationService>()
          ? Get.find<NuLocationService>()
          : Get.put(NuLocationService());

  static const String _cacheKey = 'cached_nu_locations_v1';

  final RxList<NuLocationItem> locations = <NuLocationItem>[].obs;
  final RxBool isLoading = false.obs;
  final RxBool isOffline = false.obs;
  final RxString error = ''.obs;

  static final List<Map<String, dynamic>> baselineLocations = [
    {
      "places": "Amtali",
      "Gazipur_Sadar": "277",
      "District": "Barguna",
      "Cat_1_grade_1_bill": "14762",
      "Cat_1_grade_2_3_bill": "14412",
      "Cat_1_grade_4_5_bill": "14062",
      "Cat_2_grade_6_7_bill": "11132",
      "Cat_2_grade_8_10_bill": "11082"
    },
    {
      "places": "Bamna",
      "Gazipur_Sadar": "281",
      "District": "Barguna",
      "Cat_1_grade_1_bill": "14906",
      "Cat_1_grade_2_3_bill": "14556",
      "Cat_1_grade_4_5_bill": "14206",
      "Cat_2_grade_6_7_bill": "11228",
      "Cat_2_grade_8_10_bill": "11178"
    },
    {
      "places": "Barguna Sadar",
      "Gazipur_Sadar": "282",
      "District": "Barguna",
      "Cat_1_grade_1_bill": "14942",
      "Cat_1_grade_2_3_bill": "14592",
      "Cat_1_grade_4_5_bill": "14242",
      "Cat_2_grade_6_7_bill": "11252",
      "Cat_2_grade_8_10_bill": "11202"
    },
    {
      "places": "Betagi",
      "Gazipur_Sadar": "254",
      "District": "Barguna",
      "Cat_1_grade_1_bill": "13934",
      "Cat_1_grade_2_3_bill": "13584",
      "Cat_1_grade_4_5_bill": "13234",
      "Cat_2_grade_6_7_bill": "10580",
      "Cat_2_grade_8_10_bill": "10530"
    },
    {
      "places": "Patharghata",
      "Gazipur_Sadar": "307",
      "District": "Barguna",
      "Cat_1_grade_1_bill": "15842",
      "Cat_1_grade_2_3_bill": "15492",
      "Cat_1_grade_4_5_bill": "15142",
      "Cat_2_grade_6_7_bill": "11852",
      "Cat_2_grade_8_10_bill": "11802"
    },
    {
      "places": "Taltali",
      "Gazipur_Sadar": "299",
      "District": "Barguna",
      "Cat_1_grade_1_bill": "15554",
      "Cat_1_grade_2_3_bill": "15204",
      "Cat_1_grade_4_5_bill": "14854",
      "Cat_2_grade_6_7_bill": "11660",
      "Cat_2_grade_8_10_bill": "11610"
    },
    {
      "places": "Barishal Sadar",
      "Gazipur_Sadar": "225",
      "District": "Barishal",
      "Cat_1_grade_1_bill": "12890",
      "Cat_1_grade_2_3_bill": "12540",
      "Cat_1_grade_4_5_bill": "12190",
      "Cat_2_grade_6_7_bill": "9880",
      "Cat_2_grade_8_10_bill": "9830"
    },
    {
      "places": "Bhola Sadar",
      "Gazipur_Sadar": "260",
      "District": "Bhola",
      "Cat_1_grade_1_bill": "14150",
      "Cat_1_grade_2_3_bill": "13800",
      "Cat_1_grade_4_5_bill": "13450",
      "Cat_2_grade_6_7_bill": "10720",
      "Cat_2_grade_8_10_bill": "10670"
    },
    {
      "places": "Patuakhali Sadar",
      "Gazipur_Sadar": "265",
      "District": "Patuakhali",
      "Cat_1_grade_1_bill": "14330",
      "Cat_1_grade_2_3_bill": "13980",
      "Cat_1_grade_4_5_bill": "13630",
      "Cat_2_grade_6_7_bill": "10840",
      "Cat_2_grade_8_10_bill": "10790"
    },
    {
      "places": "Pirojpur Sadar",
      "Gazipur_Sadar": "240",
      "District": "Pirojpur",
      "Cat_1_grade_1_bill": "13430",
      "Cat_1_grade_2_3_bill": "13080",
      "Cat_1_grade_4_5_bill": "12730",
      "Cat_2_grade_6_7_bill": "10240",
      "Cat_2_grade_8_10_bill": "10190"
    },
    {
      "places": "Jhalokati Sadar",
      "Gazipur_Sadar": "235",
      "District": "Jhalokati",
      "Cat_1_grade_1_bill": "13250",
      "Cat_1_grade_2_3_bill": "12900",
      "Cat_1_grade_4_5_bill": "12550",
      "Cat_2_grade_6_7_bill": "10120",
      "Cat_2_grade_8_10_bill": "10070"
    },
    {
      "places": "Mymensingh Sadar",
      "Gazipur_Sadar": "85",
      "District": "Mymensingh",
      "Cat_1_grade_1_bill": "7850",
      "Cat_1_grade_2_3_bill": "7500",
      "Cat_1_grade_4_5_bill": "7150",
      "Cat_2_grade_6_7_bill": "6200",
      "Cat_2_grade_8_10_bill": "6150"
    },
  ];

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  Future<void> initData() async {
    await loadFromCache();
    await fetchLocationsFromFirestore();
  }

  Future<void> loadFromCache() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cachedJson = prefs.getString(_cacheKey);
      if (cachedJson != null && cachedJson.isNotEmpty) {
        final List decoded = jsonDecode(cachedJson);
        final loaded = decoded
            .map((item) => NuLocationItem.fromJson(Map<String, dynamic>.from(item)))
            .toList();
        if (loaded.isNotEmpty) {
          locations.assignAll(loaded);
          return;
        }
      }
    } catch (e) {
      debugPrint('Error loading cached locations: $e');
    }

    // Fallback to baseline data if cache is empty
    final baseline = baselineLocations
        .map((m) => NuLocationItem.fromMap(m))
        .toList();
    locations.assignAll(baseline);
  }

  Future<void> saveToCache(List<NuLocationItem> list) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final encoded = jsonEncode(list.map((e) => e.toJson()).toList());
      await prefs.setString(_cacheKey, encoded);
    } catch (e) {
      debugPrint('Error saving locations to cache: $e');
    }
  }

  Future<void> fetchLocationsFromFirestore() async {
    try {
      isLoading.value = true;
      error.value = '';

      final querySnapshot = await FirebaseFirestore.instance
          .collection('locations')
          .get()
          .timeout(const Duration(seconds: 6));

      if (querySnapshot.docs.isNotEmpty) {
        final fetched = querySnapshot.docs
            .map((doc) => NuLocationItem.fromFirestore(doc))
            .where((loc) => loc.places.isNotEmpty)
            .toList();

        if (fetched.isNotEmpty) {
          locations.assignAll(fetched);
          await saveToCache(fetched);
          isOffline.value = false;
        }
      } else {
        // Collection is empty, auto-seed with baseline if desirable
        debugPrint('Firestore locations collection empty. Seeding baseline...');
        await seedBaselineToFirestore();
      }
    } catch (e) {
      debugPrint('Firestore fetch error: $e');
      isOffline.value = true;
      error.value = e.toString();
      // Ensure we still have baseline data in memory
      if (locations.isEmpty) {
        await loadFromCache();
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> seedBaselineToFirestore() async {
    try {
      final firestore = FirebaseFirestore.instance;
      final batch = firestore.batch();
      for (final raw in baselineLocations) {
        final docRef = firestore.collection('locations').doc();
        batch.set(docRef, raw);
      }
      await batch.commit();
      debugPrint('Seeded ${baselineLocations.length} locations to Firestore.');
    } catch (e) {
      debugPrint('Failed to seed baseline to Firestore: $e');
    }
  }

  List<NuLocationItem> searchLocations(String query) {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return locations;
    return locations.where((item) {
      return item.places.toLowerCase().contains(q) ||
          item.district.toLowerCase().contains(q) ||
          item.gazipurSadarKm.toString().contains(q) ||
          item.cat1Grade1Bill.toString().contains(q);
    }).toList();
  }

  // Backward-compatible aliases for legacy views
  Future<void> fetchLocations() => fetchLocationsFromFirestore();
  List<NuLocationItem> search(String query) => searchLocations(query);
}
