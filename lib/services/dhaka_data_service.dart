import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import '../models/dhaka_life_models.dart';

class DhakaDataService {
  static final DhakaDataService _instance = DhakaDataService._internal();
  factory DhakaDataService() => _instance;
  DhakaDataService._internal();

  // Areas of Dhaka
  static const List<String> dhakaAreas = [
    'মিরপুর (Mirpur)',
    'মোহাম্মদপুর (Mohammadpur)',
    'ধানমন্ডি (Dhanmondi)',
    'গুলশান (Gulshan)',
    'বনানী (Banani)',
    'উত্তরা (Uttara)',
    'মতিঝিল (Motijheel)',
    'ফার্মগেট (Farmgate)',
    'পুরান ঢাকা (Old Dhaka)',
    'বাড্ডা (Badda)',
    'খিলগাঁও (Khilgaon)',
    'তেজগাঁও (Tejgaon)',
  ];

  // Emergency Contacts
  static List<DhakaEmergencyContact> getEmergencyContacts() {
    return [
      DhakaEmergencyContact(
        titleBn: 'জাতীয় জরুরি সেবা (পুলিশ, অ্যাম্বুলেন্স, ফায়ার)',
        titleEn: 'National Emergency Service',
        number: '999',
        category: 'সার্বক্ষণিক জরুরি',
        descriptionBn: 'টোল-ফ্রি যেকোনো জরুরি পুলিশি সহায়তা, অগ্নিনির্বাপণ বা অ্যাম্বুলেন্সের জন্য',
        descriptionEn: 'Toll-free police, ambulance and fire brigade',
        icon: Icons.emergency,
        color: const Color(0xFFE53935),
      ),
      DhakaEmergencyContact(
        titleBn: 'স্বাস্থ্য বাতায়ন (২৪ ঘণ্টা ডাক্তার পরামর্শ)',
        titleEn: 'Shastho Batayon (Health Helpline)',
        number: '16263',
        category: 'চিকিৎসা ও স্বাস্থ্য',
        descriptionBn: 'সরকারি স্বাস্থ্যসেবা এবং অভিজ্ঞ চিকিৎসকের সরাসরি টেলিমেডিসিন পরামর্শ',
        descriptionEn: 'Government doctor counseling & medical helpline',
        icon: Icons.local_hospital,
        color: const Color(0xFF00897B),
      ),
      DhakaEmergencyContact(
        titleBn: 'জাতীয় তথ্য ও সেবা বাতায়ন',
        titleEn: 'National Info & Services',
        number: '333',
        category: 'নাগরিক সেবা',
        descriptionBn: 'সরকারি দপ্তরসমূহের তথ্য, সামাজিক সমস্যা ও জেলা প্রশাসনের সাহায্য',
        descriptionEn: 'Government services & civic information',
        icon: Icons.info_outline,
        color: const Color(0xFF1E88E5),
      ),
      DhakaEmergencyContact(
        titleBn: 'নারী ও শিশু নির্যাতন প্রতিরোধ হেল্পলাইন',
        titleEn: 'Women & Child Helpline',
        number: '109',
        category: 'আইনি ও সুরক্ষা',
        descriptionBn: 'নারী ও শিশু নির্যাতন প্রতিরোধ এবং তাৎক্ষণিক আইনি সহায়তা সেল',
        descriptionEn: 'Women and child protection hotline',
        icon: Icons.shield,
        color: const Color(0xFF8E24AA),
      ),
      DhakaEmergencyContact(
        titleBn: 'ফায়ার সার্ভিস সেন্ট্রাল কন্ট্রোল রুম (ঢাকা)',
        titleEn: 'Dhaka Fire Service HQ',
        number: '02223355555',
        category: 'অগ্নিনির্বাপণ',
        descriptionBn: 'হেডকোয়ার্টার, ঢাকা ফায়ার সার্ভিস ও সিভিল ডিফেন্স সদরদপ্তর',
        descriptionEn: 'Dhaka Fire Service Central Command',
        icon: Icons.local_fire_department,
        color: const Color(0xFFD84315),
      ),
      DhakaEmergencyContact(
        titleBn: 'ঢাকা মেডিকেল কলেজ হাসপাতাল জরুরি বিভাগ',
        titleEn: 'DMCH Emergency',
        number: '0255165088',
        category: 'হাসপাতাল',
        descriptionBn: 'দেশের সর্ববৃহৎ সরকারি হাসপাতাল ইমার্জেন্সি সার্ভিস',
        descriptionEn: 'Dhaka Medical College Hospital emergency unit',
        icon: Icons.medical_services,
        color: const Color(0xFF0288D1),
      ),
      DhakaEmergencyContact(
        titleBn: 'জাতীয় হেল্পলাইন (দুদক - দুর্নীতি দমন)',
        titleEn: 'Anti-Corruption Helpline',
        number: '106',
        category: 'দুদক',
        descriptionBn: 'দুর্নীতি ও ঘুষের অভিযোগ জানানোর সরকারি হেল্পলাইন',
        descriptionEn: 'Anti-corruption commission toll-free helpline',
        icon: Icons.gavel,
        color: const Color(0xFF5D4037),
      ),
    ];
  }

  // Metro Rail Stations (MRT Line-6)
  static List<DhakaMetroStation> getMetroStations() {
    return [
      DhakaMetroStation(stationNo: 1, nameBn: 'উত্তরা উত্তর', nameEn: 'Uttara North', locationArea: 'উত্তরা দিয়াবাড়ি', fareFromUttaraNorth: 0, travelTime: 'শুরু'),
      DhakaMetroStation(stationNo: 2, nameBn: 'উত্তরা সেন্টার', nameEn: 'Uttara Center', locationArea: 'উত্তরা সেক্টর ৭', fareFromUttaraNorth: 20, travelTime: '৩ মিনিট'),
      DhakaMetroStation(stationNo: 3, nameBn: 'উত্তরা দক্ষিণ', nameEn: 'Uttara South', locationArea: 'উত্তরা রাজলক্ষ্মী সংলগ্ন', fareFromUttaraNorth: 30, travelTime: '৬ মিনিট'),
      DhakaMetroStation(stationNo: 4, nameBn: 'পল্লবী', nameEn: 'Pallabi', locationArea: 'মিরপুর ১২ পল্লবী', fareFromUttaraNorth: 30, travelTime: '১০ মিনিট'),
      DhakaMetroStation(stationNo: 5, nameBn: 'মিরপুর ১১', nameEn: 'Mirpur 11', locationArea: 'মিরপুর ১১ বাসস্ট্যান্ড', fareFromUttaraNorth: 40, travelTime: '১৩ মিনিট'),
      DhakaMetroStation(stationNo: 6, nameBn: 'মিরপুর ১০', nameEn: 'Mirpur 10', locationArea: 'মিরপুর ১০ গোলচত্বর ইন্টারচেঞ্জ', fareFromUttaraNorth: 40, travelTime: '১৬ মিনিট'),
      DhakaMetroStation(stationNo: 7, nameBn: 'কাজীপাড়া', nameEn: 'Kazipara', locationArea: 'কাজীপাড়া বাসস্টপ', fareFromUttaraNorth: 50, travelTime: '১৯ মিনিট'),
      DhakaMetroStation(stationNo: 8, nameBn: 'শেওড়াপাড়া', nameEn: 'Shewrapara', locationArea: 'পশ্চিম শেওড়াপাড়া', fareFromUttaraNorth: 50, travelTime: '২২ মিনিট'),
      DhakaMetroStation(stationNo: 9, nameBn: 'আগারগাঁও', nameEn: 'Agargaon', locationArea: 'পাসপোর্ট অফিস ও বাণিজ্য মেলা মোড়', fareFromUttaraNorth: 60, travelTime: '২৫ মিনিট'),
      DhakaMetroStation(stationNo: 10, nameBn: 'বিজয় সরণি', nameEn: 'Bijoy Sarani', locationArea: 'নভোথিয়েটার ও বিজয় সরণি', fareFromUttaraNorth: 60, travelTime: '২৮ মিনিট'),
      DhakaMetroStation(stationNo: 11, nameBn: 'ফার্মগেট', nameEn: 'Farmgate', locationArea: 'আনন্দ সিনেমা হল ও পার্ক মোড়', fareFromUttaraNorth: 70, travelTime: '৩১ মিনিট'),
      DhakaMetroStation(stationNo: 12, nameBn: 'কারওয়ান বাজার', nameEn: 'Karwan Bazar', locationArea: 'সোনারগাঁও হোটেল ও বাজার মোড়', fareFromUttaraNorth: 70, travelTime: '৩৪ মিনিট'),
      DhakaMetroStation(stationNo: 13, nameBn: 'শাহবাগ', nameEn: 'Shahbagh', locationArea: 'বিএসএমএমইউ ও ঢাকা বিশ্ববিদ্যালয়', fareFromUttaraNorth: 80, travelTime: '৩৭ মিনিট'),
      DhakaMetroStation(stationNo: 14, nameBn: 'ঢাকা বিশ্ববিদ্যালয়', nameEn: 'Dhaka University', locationArea: 'টিএসসি ও দোয়েল চত্বর', fareFromUttaraNorth: 80, travelTime: '৩৯ মিনিট'),
      DhakaMetroStation(stationNo: 15, nameBn: 'বাংলাদেশ সচিবালয়', nameEn: 'Bangladesh Secretariat', locationArea: 'প্রেসক্লাব ও সচিবালয়', fareFromUttaraNorth: 90, travelTime: '৪২ মিনিট'),
      DhakaMetroStation(stationNo: 16, nameBn: 'মতিঝিল', nameEn: 'Motijheel', locationArea: 'শাপলা চত্বর ও ব্যাংক পাড়া', fareFromUttaraNorth: 100, travelTime: '৪৫ মিনিট'),
    ];
  }

  // Popular Bus Routes
  static List<DhakaBusRoute> getBusRoutes() {
    return [
      DhakaBusRoute(
        busNameBn: 'প্রজাপতি পরিবহন (Prajapati)',
        busNameEn: 'Prajapati Paribahan',
        routeBn: 'মিরপুর ১২ ↔ সদরঘাট',
        routeEn: 'Mirpur 12 to Sadarghat',
        startPoint: 'মিরপুর ১২',
        endPoint: 'সদরঘাট',
        keyStopsBn: ['মিরপুর ১০', 'কাজীপাড়া', 'আগারগাঁও', 'ফার্মগেট', 'শাহবাগ', 'গুলিস্তান', 'সদরঘাট'],
        fareRange: '১০ - ৪০ ৳',
      ),
      DhakaBusRoute(
        busNameBn: 'বিকল্প অটো সার্ভিস (Bikolpo)',
        busNameEn: 'Bikolpo Auto Service',
        routeBn: 'মিরপুর ১৪ ↔ মতিঝিল',
        routeEn: 'Mirpur 14 to Motijheel',
        startPoint: 'মিরপুর ১৪',
        endPoint: 'মতিঝিল',
        keyStopsBn: ['মিরপুর ১০', 'টেকনিক্যাল', 'শ্যামলী', 'আসাদগেট', 'সাইন্সল্যাব', 'প্রেসক্লাব', 'মতিঝিল'],
        fareRange: '১৫ - ৪৫ ৳',
      ),
      DhakaBusRoute(
        busNameBn: 'স্বাধীন এক্সপ্রেস (Shadhin Express)',
        busNameEn: 'Shadhin Express',
        routeBn: 'মিরপুর ১ ↔ বাড্ডা ↔ নতুনবাজার',
        routeEn: 'Mirpur 1 to Notun Bazar',
        startPoint: 'মিরপুর ১',
        endPoint: 'নতুনবাজার',
        keyStopsBn: ['মিরপুর ১০', 'কালশী', 'ইসিবি চত্বর', 'কুড়িল', 'নতুনবাজার'],
        fareRange: '২০ - ৪৫ ৳',
      ),
      DhakaBusRoute(
        busNameBn: 'আল মক্কা পরিবহন (Al Makkah)',
        busNameEn: 'Al Makkah Paribahan',
        routeBn: 'গাজীপুর চৌরাস্তা ↔ মতিঝিল',
        routeEn: 'Gazipur to Motijheel',
        startPoint: 'গাজীপুর',
        endPoint: 'মতিঝিল',
        keyStopsBn: ['টঙ্গী', 'বিমানবন্দর', 'উত্তরা', 'মহাখালী', 'মগবাজার', 'কাকরাইল', 'মতিঝিল'],
        fareRange: '২৫ - ৮০ ৳',
      ),
      DhakaBusRoute(
        busNameBn: 'তরঙ্গ প্লাস (Taranga Plus)',
        busNameEn: 'Taranga Plus',
        routeBn: 'মোহাম্মদপুর ↔ সায়েদাবাদ',
        routeEn: 'Mohammadpur to Sayedabad',
        startPoint: 'মোহাম্মদপুর',
        endPoint: 'সায়েদাবাদ',
        keyStopsBn: ['শংকর', 'ঝিগাতলা', 'সাইন্সল্যাব', 'নিউমার্কেট', 'শাহবাগ', 'মতিঝিল', 'সায়েদাবাদ'],
        fareRange: '১৫ - ৪০ ৳',
      ),
      DhakaBusRoute(
        busNameBn: 'রাইদা এন্টারপ্রাইজ (Raida)',
        busNameEn: 'Raida Enterprise',
        routeBn: 'পোস্তগোলা ↔ দিয়াবাড়ি উত্তরা',
        routeEn: 'Postogola to Diabari',
        startPoint: 'পোস্তগোলা',
        endPoint: 'দিয়াবাড়ি',
        keyStopsBn: ['যাত্রাবাড়ী', 'মৌচাক', 'রামপুরা', 'বাড্ডা', 'কুড়িল', 'এয়ারপোর্ট', 'দিয়াবাড়ি'],
        fareRange: '২০ - ৬০ ৳',
      ),
    ];
  }

  // Daily Bazar Prices (Dhaka retail indicative prices)
  static List<DhakaBazarItem> getBazarPrices() {
    return [
      DhakaBazarItem(nameBn: 'মিনিকেট চাল (Miniket Rice)', nameEn: 'Miniket Rice', currentPrice: 72.0, previousPrice: 70.0, unitBn: 'কেজি', category: 'চাল ও ডাল', marketName: 'কারওয়ান বাজার'),
      DhakaBazarItem(nameBn: 'নাজিরশাইল চাল (Nazirshail Rice)', nameEn: 'Nazirshail Rice', currentPrice: 78.0, previousPrice: 80.0, unitBn: 'কেজি', category: 'চাল ও ডাল', marketName: 'কারওয়ান বাজার'),
      DhakaBazarItem(nameBn: 'মসুর ডাল - দেশি (Lentils Local)', nameEn: 'Lentils (Local)', currentPrice: 135.0, previousPrice: 130.0, unitBn: 'কেজি', category: 'চাল ও ডাল', marketName: 'মিরপুর ১ বাজার'),
      DhakaBazarItem(nameBn: 'পেঁয়াজ - দেশি (Local Onion)', nameEn: 'Local Onion', currentPrice: 110.0, previousPrice: 115.0, unitBn: 'কেজি', category: 'সবজি ও মশলা', marketName: 'কারওয়ান বাজার'),
      DhakaBazarItem(nameBn: 'আলু (Potato)', nameEn: 'Potato', currentPrice: 55.0, previousPrice: 55.0, unitBn: 'কেজি', category: 'সবজি ও মশলা', marketName: 'মোহাম্মদপুর কৃষি মার্কেট'),
      DhakaBazarItem(nameBn: 'ডিম - ফার্মের মুরগি (Eggs - 1 Dozen)', nameEn: 'Farm Chicken Eggs', currentPrice: 165.0, previousPrice: 175.0, unitBn: 'ডজন', category: 'প্রোটিন', marketName: 'মিরপুর বাজার'),
      DhakaBazarItem(nameBn: 'ব্রয়লার মুরগি (Broiler Chicken)', nameEn: 'Broiler Chicken', currentPrice: 185.0, previousPrice: 180.0, unitBn: 'কেজি', category: 'প্রোটিন', marketName: 'নিউমার্কেট কাঁচাবাজার'),
      DhakaBazarItem(nameBn: 'সোনালী মুরগি (Sonali Chicken)', nameEn: 'Sonali Chicken', currentPrice: 290.0, previousPrice: 300.0, unitBn: 'কেজি', category: 'প্রোটিন', marketName: 'কারওয়ান বাজার'),
      DhakaBazarItem(nameBn: 'গরুর মাংস (Beef)', nameEn: 'Beef', currentPrice: 750.0, previousPrice: 750.0, unitBn: 'কেজি', category: 'প্রোটিন', marketName: 'মোহাম্মদপুর টাউন হল'),
      DhakaBazarItem(nameBn: 'সয়াবিন তেল - বোতল (Soybean Oil)', nameEn: 'Soybean Oil (1L)', currentPrice: 167.0, previousPrice: 167.0, unitBn: '১ লিটার', category: 'তেল ও চিনি', marketName: 'কারওয়ান বাজার'),
      DhakaBazarItem(nameBn: 'চিনি - প্যাকেট (Sugar)', nameEn: 'Sugar (Packaged)', currentPrice: 135.0, previousPrice: 140.0, unitBn: 'কেজি', category: 'তেল ও চিনি', marketName: 'কারওয়ান বাজার'),
      DhakaBazarItem(nameBn: 'কাঁচামরিচ (Green Chili)', nameEn: 'Green Chili', currentPrice: 180.0, previousPrice: 220.0, unitBn: 'কেজি', category: 'সবজি ও মশলা', marketName: 'যাত্রাবাড়ী আড়ৎ'),
    ];
  }

  // Civic Reports (User & Community feedback)
  static List<DhakaCivicReport> getCivicReports() {
    return [
      DhakaCivicReport(
        id: 'CR-1042',
        titleBn: 'মিরপুর ১০ গোলচত্বরে ভাঙা ম্যানহোল মেরামত প্রয়োজন',
        categoryBn: 'সড়ক ও ড্রেনেজ',
        locationBn: 'মিরপুর ১০, ঢাকা উত্তর সিটি করপোরেশন',
        date: '১৪ অক্টোবর ২০২৬',
        statusBn: 'পর্যালোচনাধীন (Under Review)',
        statusColor: const Color(0xFFF57C00),
        descriptionBn: 'মেট্রোরেল পিলারের কাছে খোলা ম্যানহোলে পথচারী ও রিকশার জন্য মারাত্মক ঝুঁকি তৈরি হয়েছে।',
      ),
      DhakaCivicReport(
        id: 'CR-1039',
        titleBn: 'ধানমন্ডি লেকের পাশে স্ট্রিট লাইট বন্ধ',
        categoryBn: 'বিদ্যুৎ ও বাতি',
        locationBn: 'ধানমন্ডি ৮/এ রোড',
        date: '১৩ অক্টোবর ২০২৬',
        statusBn: 'সমাধান হয়েছে (Resolved)',
        statusColor: const Color(0xFF388E3C),
        descriptionBn: 'সিটি করপোরেশনের বিদ্যুৎ বিভাগ কর্তৃক বাতিগুলো মেরামত করা সম্পন্ন হয়েছে।',
      ),
      DhakaCivicReport(
        id: 'CR-1035',
        titleBn: 'মোহাম্মদপুর রিং রোডে বৃষ্টির পর জলাবদ্ধতা',
        categoryBn: 'জলাবদ্ধতা',
        locationBn: 'রিং রোড, মোহাম্মদপুর',
        date: '১২ অক্টোবর ২০২৬',
        statusBn: 'যাচাইকৃত (Verified)',
        statusColor: const Color(0xFF1976D2),
        descriptionBn: 'ড্রেনে ময়লা জমে পানি নিষ্কাশন বাধাগ্রস্ত হচ্ছে। পরিচ্ছন্নতাকর্মীদের দৃষ্টি আকর্ষণ করা হয়েছে।',
      ),
    ];
  }

  // Nearby Services (Electricians, Plumbers, Clinics)
  static List<DhakaNearbyPlace> getNearbyServices() {
    return [
      DhakaNearbyPlace(nameBn: 'মিরপুর ডেন্টাল ও জেনারেল ক্লিনিক', categoryBn: 'হাসপাতাল ও ক্লিনিক', areaBn: 'মিরপুর ১০', distance: '৪৫০ মিটার', phone: '01711000111', rating: 4.8, icon: Icons.local_hospital),
      DhakaNearbyPlace(nameBn: 'লাজ ফার্মা (২৪ ঘণ্টা খোলা)', categoryBn: 'ফার্মেসি', areaBn: 'মিরপুর ২ মোড়', distance: '৮০০ মিটার', phone: '01712223344', rating: 4.9, icon: Icons.medication),
      DhakaNearbyPlace(nameBn: 'মাস্টার ইলেকট্রিশিয়ান সার্ভিস (হোম ডেলিভারি)', categoryBn: 'ইলেকট্রিশিয়ান', areaBn: 'ধানমন্ডি ও মোহাম্মদপুর', distance: 'অন কল সার্ভিস', phone: '01819998877', rating: 4.7, icon: Icons.bolt),
      DhakaNearbyPlace(nameBn: 'কুইক প্লাম্বিং ও পাইপ সার্ভিস', categoryBn: 'প্লাম্বার', areaBn: 'মিরপুর ও শেওড়াপাড়া', distance: 'অন কল সার্ভিস', phone: '01915556677', rating: 4.6, icon: Icons.plumbing),
      DhakaNearbyPlace(nameBn: 'সিটি বাইক ও গাড়ি মেকানিক', categoryBn: 'অটোমোবাইল মেকানিক', areaBn: 'আগারগাঁও তালতলা', distance: '১.২ কিমি', phone: '01614443322', rating: 4.5, icon: Icons.build),
      DhakaNearbyPlace(nameBn: 'আইএফআইসি ও ডাচ-বাংলা ফাস্টট্র্যাক এটিএম', categoryBn: 'ব্যাংক ও এটিএম', areaBn: 'মিরপুর ১০ চত্বর', distance: '৩০০ মিটার', phone: '16259', rating: 4.8, icon: Icons.atm),
    ];
  }

  // Cached weather instance in memory
  static DhakaWeatherData? _cachedWeatherData;

  /// Fetch typed weather data from Open-Meteo API with timeout and offline caching
  static Future<DhakaWeatherData> fetchDhakaWeatherData({bool forceRefresh = false}) async {
    if (!forceRefresh && _cachedWeatherData != null && _cachedWeatherData!.isLive) {
      return _cachedWeatherData!;
    }

    try {
      final client = HttpClient();
      client.connectionTimeout = const Duration(seconds: 5);
      final uri = Uri.parse(
          'https://api.open-meteo.com/v1/forecast?latitude=23.8103&longitude=90.4125&current=temperature_2m,relative_humidity_2m,apparent_temperature,precipitation,weather_code,wind_speed_10m&timezone=Asia%2FDhaka');
      final request = await client.getUrl(uri);
      final response = await request.close().timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        final body = await response.transform(utf8.decoder).join();
        final json = jsonDecode(body) as Map<String, dynamic>;
        final weather = DhakaWeatherData.fromOpenMeteoJson(json);
        _cachedWeatherData = weather;
        return weather;
      }
    } catch (e) {
      // Graceful offline fallback on error, timeout, or no internet
    }

    if (_cachedWeatherData != null) {
      return _cachedWeatherData!;
    }

    return DhakaWeatherData.fallback();
  }

  /// Legacy map-based weather fetcher for backward-compatibility
  static Future<Map<String, dynamic>> fetchDhakaWeather({bool forceRefresh = false}) async {
    final weather = await fetchDhakaWeatherData(forceRefresh: forceRefresh);
    return weather.toLegacyMap();
  }

  // Fetch Live Recent Notices from NU Website (https://www.nu.ac.bd/recent-news-notice.php)
  static Future<List<NuNoticeItem>> fetchNuRecentNotices() async {
    try {
      final client = HttpClient();
      client.connectionTimeout = const Duration(seconds: 4);
      final request = await client.getUrl(Uri.parse('https://www.nu.ac.bd/recent-news-notice.php'));
      request.headers.set('User-Agent', 'Mozilla/5.0 (Linux; Android 10; Mobile)');
      final response = await request.close();

      if (response.statusCode == 200) {
        final body = await response.transform(utf8.decoder).join();
        final regex = RegExp(
          r'<div class="news-item"><a[^>]*href="([^"]*)"[^>]*>(.*?)<\/a>',
          caseSensitive: false,
          dotAll: true,
        );

        final matches = regex.allMatches(body);
        final List<NuNoticeItem> notices = [];

        for (final m in matches) {
          String url = m.group(1)?.trim() ?? '';
          if (!url.startsWith('http')) {
            url = 'https://www.nu.ac.bd/$url';
          }
          String rawTitle = m.group(2)?.trim() ?? '';
          rawTitle = rawTitle.replaceAll(RegExp(r'<[^>]*>'), '').replaceAll('&nbsp;', ' ').trim();

          // Extract date from URL if present (e.g. pub_date_14102026.pdf)
          String dateStr = '১৪ অক্টোবর ২০২৬';
          final dateMatch = RegExp(r'pub_date_(\d{2})(\d{2})(\d{4})').firstMatch(url);
          if (dateMatch != null) {
            final day = dateMatch.group(1);
            final month = dateMatch.group(2);
            final year = dateMatch.group(3);
            dateStr = '$day/$month/$year';
          }

          if (rawTitle.isNotEmpty) {
            notices.add(
              NuNoticeItem(
                title: rawTitle,
                date: dateStr,
                url: url,
                category: 'অফিশিয়াল নোটিশ',
              ),
            );
          }
          if (notices.length >= 8) break;
        }

        if (notices.isNotEmpty) {
          return notices;
        }
      }
    } catch (e) {
      // Graceful offline fallback
    }

    // Default official verified notices
    return [
      NuNoticeItem(
        title: 'জাতীয় বিশ্ববিদ্যালয়ের ২০২৩-২৪ শিক্ষাবর্ষে মাস্টার্স (নিয়মিত) প্রোগ্রামে ভর্তি বিজ্ঞপ্তি',
        date: '১৪ অক্টোবর ২০২৬',
        url: 'https://www.nu.ac.bd/recent-news-notice.php',
        category: 'ভর্তি বিজ্ঞপ্তি',
      ),
      NuNoticeItem(
        title: '২০২৪ সালের ডিগ্রি পাস ও সার্টিফিকেট কোর্স পরীক্ষার সংশোধিত সময়সূচি সংক্রান্ত জরুরি বিজ্ঞপ্তি',
        date: '১৪ অক্টোবর ২০২৬',
        url: 'https://www.nu.ac.bd/recent-news-notice.php',
        category: 'পরীক্ষা',
      ),
      NuNoticeItem(
        title: 'প্রেস রিলিজ: জাতীয় বিশ্ববিদ্যালয়ে "উচ্চশিক্ষায় গুণগত মানোন্নয়ন ও ভবিষ্যৎ সম্ভাবনা" শীর্ষক কর্মশালা',
        date: '১৩ অক্টোবর ২০২৬',
        url: 'https://www.nu.ac.bd/recent-news-notice.php',
        category: 'প্রেস রিলিজ',
      ),
      NuNoticeItem(
        title: '২০২৫ সালের অনার্স ৪র্থ বর্ষ পরীক্ষার ফরম পূরণ ও ফি জমাদান সংক্রান্ত বিজ্ঞপ্তি',
        date: '১২ অক্টোবর ২০২৬',
        url: 'https://www.nu.ac.bd/recent-news-notice.php',
        category: 'ফরম পূরণ',
      ),
      NuNoticeItem(
        title: 'অধিভুক্ত কলেজসমূহের অনলাইন তথ্য হালনাগাদ ও শিক্ষক ডাটাবেজ আপডেট নির্দেশনা',
        date: '১১ অক্টোবর ২০২৬',
        url: 'https://www.nu.ac.bd/recent-news-notice.php',
        category: 'প্রশাসন',
      ),
    ];
  }
}

