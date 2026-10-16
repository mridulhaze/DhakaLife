import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DhakaLocationService extends GetxService {
  static DhakaLocationService get to =>
      Get.isRegistered<DhakaLocationService>()
          ? Get.find<DhakaLocationService>()
          : Get.put(DhakaLocationService());

  static const String _prefKeyLocationName = 'dhakalife_user_location_name';
  static const String _prefKeyLat = 'dhakalife_user_lat';
  static const String _prefKeyLng = 'dhakalife_user_lng';

  final RxString currentLocationName = 'মিরপুর-১০, ঢাকা'.obs;
  final Rx<LatLng> currentCoordinates = LatLng(23.8069, 90.3687).obs;
  final RxBool hasLocationPermission = false.obs;
  final RxBool isLocating = false.obs;

  // Major Dhaka Landmark Hubs with Bengali names for reverse matching
  static const List<Map<String, dynamic>> dhakaZones = [
    {'name': 'মিরপুর-১০, ঢাকা', 'lat': 23.8069, 'lng': 90.3687},
    {'name': 'মিরপুর-১, ঢাকা', 'lat': 23.7956, 'lng': 90.3537},
    {'name': 'ফার্মগেট, ঢাকা', 'lat': 23.7561, 'lng': 90.3872},
    {'name': 'ধানমন্ডি, ঢাকা', 'lat': 23.7461, 'lng': 90.3742},
    {'name': 'গুলশান-২, ঢাকা', 'lat': 23.7925, 'lng': 90.4167},
    {'name': 'বনানী, ঢাকা', 'lat': 23.7937, 'lng': 90.4066},
    {'name': 'উত্তরা (সেক্টর ৭), ঢাকা', 'lat': 23.8759, 'lng': 90.3795},
    {'name': 'মতিঝিল, ঢাকা', 'lat': 23.7330, 'lng': 90.4172},
    {'name': 'মহাখালী, ঢাকা', 'lat': 23.7778, 'lng': 90.4053},
    {'name': 'শাহবাগ, ঢাকা', 'lat': 23.7389, 'lng': 90.3957},
    {'name': 'কারওয়ান বাজার, ঢাকা', 'lat': 23.7516, 'lng': 90.3934},
    {'name': 'যাত্রাবাড়ী, ঢাকা', 'lat': 23.7104, 'lng': 90.4349},
    {'name': 'মোহাম্মদপুর, ঢাকা', 'lat': 23.7658, 'lng': 90.3584},
    {'name': 'গাজীপুর সদর', 'lat': 23.9999, 'lng': 90.4203},
  ];

  @override
  void onInit() {
    super.onInit();
    _loadSavedLocation();
    // Auto-detect location on startup/login
    detectAndApplyLocation();
  }

  Future<void> _loadSavedLocation() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedName = prefs.getString(_prefKeyLocationName);
      final lat = prefs.getDouble(_prefKeyLat);
      final lng = prefs.getDouble(_prefKeyLng);

      if (savedName != null && savedName.isNotEmpty) {
        currentLocationName.value = savedName;
      }
      if (lat != null && lng != null) {
        currentCoordinates.value = LatLng(lat, lng);
      }
    } catch (e) {
      debugPrint('Error loading saved location: $e');
    }
  }

  Future<bool> requestPermission() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return false;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          hasLocationPermission.value = false;
          return false;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        hasLocationPermission.value = false;
        return false;
      }

      hasLocationPermission.value = true;
      return true;
    } catch (e) {
      debugPrint('Location permission error: $e');
      return false;
    }
  }

  Future<void> detectAndApplyLocation({bool force = false}) async {
    if (isLocating.value) return;
    isLocating.value = true;

    try {
      final hasPerm = await requestPermission();
      if (!hasPerm) {
        isLocating.value = false;
        return;
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium,
        timeLimit: const Duration(seconds: 6),
      ).catchError((_) async {
        return await Geolocator.getLastKnownPosition() ??
            Position(
              longitude: 90.3687,
              latitude: 23.8069,
              timestamp: DateTime.now(),
              accuracy: 100,
              altitude: 0,
              heading: 0,
              speed: 0,
              speedAccuracy: 0,
              altitudeAccuracy: 0,
              headingAccuracy: 0,
            );
      });

      final detectedCoords = LatLng(position.latitude, position.longitude);
      currentCoordinates.value = detectedCoords;

      // Find nearest recognized Dhaka zone
      String nearestName = _findNearestZoneName(position.latitude, position.longitude);
      currentLocationName.value = nearestName;

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_prefKeyLocationName, nearestName);
      await prefs.setDouble(_prefKeyLat, position.latitude);
      await prefs.setDouble(_prefKeyLng, position.longitude);
    } catch (e) {
      debugPrint('Error detecting location: $e');
    } finally {
      isLocating.value = false;
    }
  }

  String _findNearestZoneName(double lat, double lng) {
    String closest = 'মিরপুর-১০, ঢাকা';
    double minDistance = double.infinity;

    for (final zone in dhakaZones) {
      final zLat = zone['lat'] as double;
      final zLng = zone['lng'] as double;
      final dist = _calculateDistanceKm(lat, lng, zLat, zLng);

      if (dist < minDistance) {
        minDistance = dist;
        closest = zone['name'] as String;
      }
    }

    // If within 25 km of Dhaka center, use closest neighborhood
    if (minDistance <= 25.0) {
      return closest;
    }

    return 'ঢাকা সদর';
  }

  double _calculateDistanceKm(double lat1, double lon1, double lat2, double lon2) {
    const p = 0.017453292519943295;
    final a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  void setManualLocation(String name, double lat, double lng) async {
    currentLocationName.value = name;
    currentCoordinates.value = LatLng(lat, lng);
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_prefKeyLocationName, name);
      await prefs.setDouble(_prefKeyLat, lat);
      await prefs.setDouble(_prefKeyLng, lng);
    } catch (_) {}
  }
}
