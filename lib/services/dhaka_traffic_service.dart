import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/dhaka_traffic_model.dart';
import 'dhaka_location_service.dart';

class DhakaTrafficService extends GetxService {
  static DhakaTrafficService get to =>
      Get.isRegistered<DhakaTrafficService>()
          ? Get.find<DhakaTrafficService>()
          : Get.put(DhakaTrafficService());

  static const String _prefKeyCommunityReports = 'dhakalife_community_traffic_reports';

  final RxList<DhakaTrafficReport> reports = <DhakaTrafficReport>[].obs;
  final RxBool isLoading = false.obs;
  final RxString selectedFilterCategory = 'all'.obs;
  final RxString selectedSeverity = 'all'.obs;
  final RxString searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadReports();
  }

  // Pre-configured baseline checkpoints around Dhaka
  List<DhakaTrafficReport> _getBaselineReports() {
    final now = DateTime.now();
    return [
      DhakaTrafficReport(
        id: 'base_1',
        title: 'বিজয় সরণি সিগন্যালে গাড়ির দীর্ঘ সারি',
        roadName: 'রোকেয়া সরণি ও বিজয় সরণি সংযোগ',
        areaName: 'বিজয় সরণি',
        description: 'তেজগাঁওমুখী লেনে গাড়ি প্রায় স্থবির। সিগন্যাল পার হতে ১৫-২০ মিনিট লাগছে।',
        category: DhakaTrafficCategory.congestion,
        severity: DhakaTrafficSeverity.severe,
        latitude: 23.7663,
        longitude: 90.3878,
        timestamp: now.subtract(const Duration(minutes: 8)),
        confirmations: 24,
        isVerified: true,
        reportedBy: 'ট্রাফিক কন্ট্রোল ঢাকা',
        isCommunityReport: false,
      ),
      DhakaTrafficReport(
        id: 'base_2',
        title: 'মহাখালী বাস টার্মিনাল মুখে ধীরগতি',
        roadName: 'বীর উত্তম রফিক সড়ক',
        areaName: 'মহাখালী',
        description: 'দূরপাল্লার বাসের কারণে ফ্লাইওভারের নিচ দিয়ে গাড়ি ধীরগতিতে চলছে। ফ্লাইওভারের ওপর চলাচল স্বাভাবিক।',
        category: DhakaTrafficCategory.congestion,
        severity: DhakaTrafficSeverity.slow,
        latitude: 23.7778,
        longitude: 90.4053,
        timestamp: now.subtract(const Duration(minutes: 18)),
        confirmations: 16,
        isVerified: true,
        reportedBy: 'ডিএমপি ট্রাফিক',
        isCommunityReport: false,
      ),
      DhakaTrafficReport(
        id: 'base_3',
        title: 'মিরপুর-১০ গোলচত্বরে স্বাভাবিক চলাচল',
        roadName: 'মিরপুর মূল সড়ক',
        areaName: 'মিরপুর-১০',
        description: 'মেট্রোরেল স্টেশনের নিচের উভয় লেনে যান চলাচল বর্তমানে স্বাভাবিক ও গতিশীল রয়েছে।',
        category: DhakaTrafficCategory.congestion,
        severity: DhakaTrafficSeverity.clear,
        latitude: 23.8069,
        longitude: 90.3687,
        timestamp: now.subtract(const Duration(minutes: 25)),
        confirmations: 12,
        isVerified: true,
        reportedBy: 'কমিউনিটি ট্রাভেলার',
        isCommunityReport: false,
      ),
      DhakaTrafficReport(
        id: 'base_4',
        title: 'ফার্মগেট ওভারব্রিজের নিচে পিক-আওয়ার চাপ',
        roadName: 'কাজী নজরুল ইসলাম এভিনিউ',
        areaName: 'ফার্মগেট',
        description: 'শাহবাগমুখী লেনে গাড়ির ব্যাপক চাপ। বিকল্প হিসেবে এলিভেটেড এক্সপ্রেসওয়ে ব্যবহার করতে পারেন।',
        category: DhakaTrafficCategory.congestion,
        severity: DhakaTrafficSeverity.severe,
        latitude: 23.7561,
        longitude: 90.3872,
        timestamp: now.subtract(const Duration(minutes: 12)),
        confirmations: 31,
        isVerified: true,
        reportedBy: 'ট্রাফিক পর্যবেক্ষণ টিম',
        isCommunityReport: false,
      ),
      DhakaTrafficReport(
        id: 'base_5',
        title: 'বিমানবন্দর সড়কে খিলক্ষেত অংশে মাঝারি চাপ',
        roadName: 'ঢাকা-ময়মনসিংহ মহাসড়ক',
        areaName: 'খিলক্ষেত-বিমানবন্দর',
        description: 'উত্তরামূখী লেনে মাঝারি জ্যাম। বিমানবন্দর মোড় পর্যন্ত পৌঁছাতে স্বাভাবিকের চেয়ে ১০ মিনিট বেশি লাগবে।',
        category: DhakaTrafficCategory.congestion,
        severity: DhakaTrafficSeverity.moderate,
        latitude: 23.8302,
        longitude: 90.4184,
        timestamp: now.subtract(const Duration(minutes: 30)),
        confirmations: 19,
        isVerified: true,
        reportedBy: 'হাইওয়ে ট্রাফিক আপডেট',
        isCommunityReport: false,
      ),
      DhakaTrafficReport(
        id: 'base_6',
        title: 'কুড়িল বিশ্বরোড ও এক্সপ্রেসওয়ে র‍্যাম্প ক্লিয়ার',
        roadName: 'প্রগতি সরণি / কুড়িল ফ্লাইওভার',
        areaName: 'কুড়িল',
        description: 'পূর্বাচল এক্সপ্রেসওয়ে ও বনানী লিংক রোড সম্পূর্ণ জ্যামমুক্ত এবং গতিশীল।',
        category: DhakaTrafficCategory.congestion,
        severity: DhakaTrafficSeverity.clear,
        latitude: 23.8188,
        longitude: 90.4208,
        timestamp: now.subtract(const Duration(minutes: 35)),
        confirmations: 9,
        isVerified: true,
        reportedBy: 'কমিউনিটি ইউজার',
        isCommunityReport: false,
      ),
      DhakaTrafficReport(
        id: 'base_7',
        title: 'ধানমন্ডি ২৭ মোড়ে পাইপলাইন সংস্কারের কাজ',
        roadName: 'মিরপুর রোড (ধানমন্ডি ২৭)',
        areaName: 'ধানমন্ডি',
        description: 'রাস্তার একপাশে ড্রেনেজ সংস্কার চলায় একটি লেন বন্ধ। ধীরেসুস্থে গাড়ি চালানো অনুরোধ।',
        category: DhakaTrafficCategory.construction,
        severity: DhakaTrafficSeverity.slow,
        latitude: 23.7533,
        longitude: 90.3756,
        timestamp: now.subtract(const Duration(minutes: 45)),
        confirmations: 14,
        isVerified: true,
        reportedBy: 'ডিএনসিসি ট্রাফিক সেল',
        isCommunityReport: false,
      ),
      DhakaTrafficReport(
        id: 'base_8',
        title: 'কারওয়ান বাজার মোড়ে পিক-আপ ভ্যান বিকল',
        roadName: 'কাজী নজরুল ইসলাম এভিনিউ',
        areaName: 'কারওয়ান বাজার',
        description: 'সার্ক ফোয়ারার কাছে বাংলামটরমুখী লেনে একটি গাড়ি বিকল হওয়ায় জ্যাম তৈরি হয়েছে। রেকার আসছে।',
        category: DhakaTrafficCategory.breakdown,
        severity: DhakaTrafficSeverity.moderate,
        latitude: 23.7516,
        longitude: 90.3934,
        timestamp: now.subtract(const Duration(minutes: 15)),
        confirmations: 22,
        isVerified: true,
        reportedBy: 'কমিউনিটি রিপোর্টার',
        isCommunityReport: false,
      ),
      DhakaTrafficReport(
        id: 'base_9',
        title: 'বনানী ১১ ব্রিজ রোড সম্পূর্ণ সচল',
        roadName: 'কামাল আতাতুর্ক এভিনিউ',
        areaName: 'বনানী-গুলশান সংযোগ',
        description: 'বনানী ও গুলশান লেক ব্রিজের ট্রাফিক প্রবাহ সম্পূর্ণ স্বাভাবিক ও সুশৃঙ্খল।',
        category: DhakaTrafficCategory.congestion,
        severity: DhakaTrafficSeverity.clear,
        latitude: 23.7937,
        longitude: 90.4066,
        timestamp: now.subtract(const Duration(minutes: 50)),
        confirmations: 8,
        isVerified: true,
        reportedBy: 'কমিউনিটি ড্রাইভার',
        isCommunityReport: false,
      ),
      DhakaTrafficReport(
        id: 'base_10',
        title: 'শাহবাগ মোড় দিয়ে যান চলাচল ধীর',
        roadName: 'শাহবাগ গোলচত্বর',
        areaName: 'শাহবাগ',
        description: 'বিএসএমএমইউ ও ঢাকা বিশ্ববিদ্যালয়মুখী যান চলাচলের কারণে সিগন্যালে সময় লাগছে।',
        category: DhakaTrafficCategory.congestion,
        severity: DhakaTrafficSeverity.slow,
        latitude: 23.7389,
        longitude: 90.3957,
        timestamp: now.subtract(const Duration(minutes: 20)),
        confirmations: 18,
        isVerified: true,
        reportedBy: 'ডিএমপি মিডিয়া',
        isCommunityReport: false,
      ),
    ];
  }

  Future<void> loadReports() async {
    isLoading.value = true;
    try {
      final base = _getBaselineReports();
      final prefs = await SharedPreferences.getInstance();
      final savedJsonList = prefs.getStringList(_prefKeyCommunityReports) ?? [];

      final community = savedJsonList
          .map((item) {
            try {
              return DhakaTrafficReport.fromJson(jsonDecode(item));
            } catch (_) {
              return null;
            }
          })
          .whereType<DhakaTrafficReport>()
          .toList();

      // Combined: Community reports on top, then baseline
      reports.assignAll([...community, ...base]);
    } catch (e) {
      debugPrint('Error loading traffic reports: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> submitReport({
    required String title,
    required String roadName,
    required String areaName,
    required String description,
    required DhakaTrafficCategory category,
    required DhakaTrafficSeverity severity,
    required double lat,
    required double lng,
    String reportedBy = 'আপনি (ব্যবহারকারী)',
  }) async {
    final newReport = DhakaTrafficReport(
      id: 'usr_${DateTime.now().millisecondsSinceEpoch}',
      title: title,
      roadName: roadName,
      areaName: areaName,
      description: description,
      category: category,
      severity: severity,
      latitude: lat,
      longitude: lng,
      timestamp: DateTime.now(),
      confirmations: 1,
      isVerified: false,
      reportedBy: reportedBy,
      isCommunityReport: true,
    );

    reports.insert(0, newReport);

    try {
      final prefs = await SharedPreferences.getInstance();
      final savedList = prefs.getStringList(_prefKeyCommunityReports) ?? [];
      savedList.insert(0, jsonEncode(newReport.toJson()));
      // Keep up to 50 user reports
      if (savedList.length > 50) savedList.removeLast();
      await prefs.setStringList(_prefKeyCommunityReports, savedList);
    } catch (e) {
      debugPrint('Error saving user traffic report: $e');
    }
  }

  Future<void> upvoteReport(String id) async {
    final index = reports.indexWhere((r) => r.id == id);
    if (index != -1) {
      final current = reports[index];
      current.confirmations += 1;
      reports[index] = current;
      reports.refresh();

      if (current.isCommunityReport) {
        _saveCommunityReports();
      }
    }
  }

  Future<void> markCleared(String id) async {
    final index = reports.indexWhere((r) => r.id == id);
    if (index != -1) {
      final current = reports[index];
      final updated = DhakaTrafficReport(
        id: current.id,
        title: '${current.title} (ক্লিয়ার হয়েছে)',
        roadName: current.roadName,
        areaName: current.areaName,
        description: 'ব্যবহারকারী কর্তৃক রাস্তা ক্লিয়ার বলে নিশ্চিত করা হয়েছে।',
        category: current.category,
        severity: DhakaTrafficSeverity.clear,
        latitude: current.latitude,
        longitude: current.longitude,
        timestamp: DateTime.now(),
        confirmations: current.confirmations + 1,
        isVerified: true,
        reportedBy: current.reportedBy,
        isCommunityReport: current.isCommunityReport,
      );
      reports[index] = updated;
      reports.refresh();

      if (updated.isCommunityReport) {
        _saveCommunityReports();
      }
    }
  }

  Future<void> _saveCommunityReports() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userList = reports
          .where((r) => r.isCommunityReport)
          .map((r) => jsonEncode(r.toJson()))
          .toList();
      await prefs.setStringList(_prefKeyCommunityReports, userList);
    } catch (e) {
      debugPrint('Error syncing traffic reports: $e');
    }
  }

  List<DhakaTrafficReport> get filteredReports {
    var list = reports.toList();

    if (selectedFilterCategory.value != 'all') {
      list = list.where((r) => r.category.name == selectedFilterCategory.value).toList();
    }

    if (selectedSeverity.value != 'all') {
      list = list.where((r) => r.severity.name == selectedSeverity.value).toList();
    }

    if (searchQuery.value.trim().isNotEmpty) {
      final q = searchQuery.value.trim().toLowerCase();
      list = list.where((r) {
        return r.title.toLowerCase().contains(q) ||
            r.roadName.toLowerCase().contains(q) ||
            r.areaName.toLowerCase().contains(q) ||
            r.description.toLowerCase().contains(q);
      }).toList();
    }

    return list;
  }

  // Calculate distance from user's current GPS location
  double calculateDistanceTo(double targetLat, double targetLng) {
    final userCoords = DhakaLocationService.to.currentCoordinates.value;
    const p = 0.017453292519943295;
    final a = 0.5 -
        cos((targetLat - userCoords.latitude) * p) / 2 +
        cos(userCoords.latitude * p) *
            cos(targetLat * p) *
            (1 - cos((targetLng - userCoords.longitude) * p)) /
            2;
    return 12742 * asin(sqrt(a));
  }
}
