import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/dorkar_models.dart';

class DorkarService {
  static final DorkarService _instance = DorkarService._internal();
  factory DorkarService() => _instance;
  DorkarService._internal();

  static DorkarService get instance => _instance;

  // Dhaka Thanas / Areas
  static const List<DorkarArea> dhakaAreas = [
    DorkarArea(
      id: 'mirpur10',
      nameBn: 'মিরপুর ১০ (গোলচত্বর)',
      nameEn: 'Mirpur 10',
      latitude: 23.8071,
      longitude: 90.3686,
    ),
    DorkarArea(
      id: 'mirpur2',
      nameBn: 'মিরপুর ২ (স্টেডিয়াম সংলগ্ন)',
      nameEn: 'Mirpur 2',
      latitude: 23.8042,
      longitude: 90.3621,
    ),
    DorkarArea(
      id: 'dhanmondi',
      nameBn: 'ধানমন্ডি (২৭ ও ৩২ নং)',
      nameEn: 'Dhanmondi',
      latitude: 23.7461,
      longitude: 90.3742,
    ),
    DorkarArea(
      id: 'mohammadpur',
      nameBn: 'মোহাম্মদপুর (রিং রোড ও টাউন হল)',
      nameEn: 'Mohammadpur',
      latitude: 23.7658,
      longitude: 90.3584,
    ),
    DorkarArea(
      id: 'shewrapara',
      nameBn: 'শেওড়াপাড়া ও কাজীপাড়া',
      nameEn: 'Shewrapara & Kazipara',
      latitude: 23.7891,
      longitude: 90.3752,
    ),
    DorkarArea(
      id: 'agargaon',
      nameBn: 'আগারগাঁও (তালতলা)',
      nameEn: 'Agargaon',
      latitude: 23.7785,
      longitude: 90.3792,
    ),
    DorkarArea(
      id: 'gulshan',
      nameBn: 'গুলশান (১ ও ২)',
      nameEn: 'Gulshan',
      latitude: 23.7925,
      longitude: 90.4078,
    ),
    DorkarArea(
      id: 'banani',
      nameBn: 'বনানী',
      nameEn: 'Banani',
      latitude: 23.7937,
      longitude: 90.4043,
    ),
    DorkarArea(
      id: 'uttara',
      nameBn: 'উত্তরা (সেক্টর ৩ ও ৭)',
      nameEn: 'Uttara',
      latitude: 23.8759,
      longitude: 90.3795,
    ),
    DorkarArea(
      id: 'badda',
      nameBn: 'বাড্ডা ও রামপুরা',
      nameEn: 'Badda & Rampura',
      latitude: 23.7805,
      longitude: 90.4267,
    ),
    DorkarArea(
      id: 'farmgate',
      nameBn: 'ফার্মগেট ও তেজগাঁও',
      nameEn: 'Farmgate & Tejgaon',
      latitude: 23.7570,
      longitude: 90.3887,
    ),
    DorkarArea(
      id: 'motijheel',
      nameBn: 'মতিঝিল ও পল্টন',
      nameEn: 'Motijheel',
      latitude: 23.7330,
      longitude: 90.4172,
    ),
    DorkarArea(
      id: 'old_dhaka',
      nameBn: 'পুরান ঢাকা (লালবাগ ও সদরঘাট)',
      nameEn: 'Old Dhaka',
      latitude: 23.7188,
      longitude: 90.3882,
    ),
  ];

  // Currently selected area by user (Default: Mirpur 10)
  final ValueNotifier<DorkarArea> selectedArea =
      ValueNotifier<DorkarArea>(dhakaAreas[0]);

  void setSelectedArea(DorkarArea area) {
    selectedArea.value = area;
  }

  // Categories taxonomy from Khub-e-Dorkar
  static const List<DorkarCategory> categories = [
    DorkarCategory(
      id: 'all',
      titleBn: 'সব সেবা',
      titleEn: 'All Services',
      icon: Icons.grid_view_rounded,
      themeColor: Color(0xFF1E88E5),
    ),
    DorkarCategory(
      id: 'clinic',
      titleBn: 'হাসপাতাল ও ক্লিনিক',
      titleEn: 'Hospital & Clinic',
      icon: Icons.local_hospital_rounded,
      themeColor: Color(0xFFE53935),
    ),
    DorkarCategory(
      id: 'pharmacy',
      titleBn: 'ফার্মেসি (২৪ ঘণ্টা)',
      titleEn: '24h Pharmacy',
      icon: Icons.medication_rounded,
      themeColor: Color(0xFF00897B),
    ),
    DorkarCategory(
      id: 'electrician',
      titleBn: 'ইলেকট্রিশিয়ান',
      titleEn: 'Electrician',
      icon: Icons.bolt_rounded,
      themeColor: Color(0xFFF59E0B),
    ),
    DorkarCategory(
      id: 'plumber',
      titleBn: 'প্লাম্বার ও স্যানিটারি',
      titleEn: 'Plumber & Sanitary',
      icon: Icons.plumbing_rounded,
      themeColor: Color(0xFF0284C7),
    ),
    DorkarCategory(
      id: 'ac_technician',
      titleBn: 'এসি ও রেফ্রিজারেটর',
      titleEn: 'AC & Fridge',
      icon: Icons.ac_unit_rounded,
      themeColor: Color(0xFF06B6D4),
    ),
    DorkarCategory(
      id: 'gas_burner',
      titleBn: 'গ্যাসের চুলা ও সিলিন্ডার',
      titleEn: 'Gas Stove & Burner',
      icon: Icons.local_fire_department_rounded,
      themeColor: Color(0xFFEA580C),
    ),
    DorkarCategory(
      id: 'mechanic',
      titleBn: 'অটোমোবাইল মেকানিক',
      titleEn: 'Automobile Mechanic',
      icon: Icons.build_rounded,
      themeColor: Color(0xFF4F46E5),
    ),
    DorkarCategory(
      id: 'atm',
      titleBn: 'ব্যাংক ও এটিএম',
      titleEn: 'Bank & ATM',
      icon: Icons.atm_rounded,
      themeColor: Color(0xFF16A34A),
    ),
    DorkarCategory(
      id: 'carpenter',
      titleBn: 'কাঠমিস্ত্রি ও ফার্নিচার',
      titleEn: 'Carpenter',
      icon: Icons.handyman_rounded,
      themeColor: Color(0xFFB45309),
    ),
    DorkarCategory(
      id: 'painter',
      titleBn: 'রং মিস্ত্রি ও ড্যাম্প',
      titleEn: 'Painter',
      icon: Icons.format_paint_rounded,
      themeColor: Color(0xFF9333EA),
    ),
    DorkarCategory(
      id: 'cook_cleaner',
      titleBn: 'বুয়া ও রান্নার সাহায্যকারী',
      titleEn: 'Cook & Cleaner',
      icon: Icons.cleaning_services_rounded,
      themeColor: Color(0xFFDB2777),
    ),
    DorkarCategory(
      id: 'mudir_dokan',
      titleBn: 'মুদির দোকান ও জরুরি বাজার',
      titleEn: 'Grocery Store',
      icon: Icons.storefront_rounded,
      themeColor: Color(0xFF65A30D),
    ),
    DorkarCategory(
      id: 'ips_solar',
      titleBn: 'আইপিএস ও জেনারেটর',
      titleEn: 'IPS & Generator',
      icon: Icons.battery_charging_full_rounded,
      themeColor: Color(0xFFD97706),
    ),
  ];

  // Base Providers Seed List (including the exact user screenshot entries + khub-e-dorkar entries)
  final List<DorkarProvider> _baseProviders = [
    // 1. Mirpur Dental & General Clinic (from user's screenshot)
    const DorkarProvider(
      id: 'prov-001-clinic',
      nameBn: 'মিরপুর ডেন্টাল ও জেনারেল ক্লিনিক',
      nameEn: 'Mirpur Dental & General Clinic',
      categoryId: 'clinic',
      categoryTitleBn: 'হাসপাতাল ও ক্লিনিক',
      phone: '01711000111',
      whatsapp: '01711000111',
      shopName: 'মিরপুর জেনারেল ও ডেন্টাল ইউনিট',
      experienceYears: 15,
      toolsOrEquipment: 'আধুনিক ডেন্টাল চেয়ার, ডিজিটাল এক্স-রে, জরুরি চিকিৎসা সেল',
      areaId: 'mirpur10',
      areaNameBn: 'মিরপুর ১০',
      latitude: 23.8075,
      longitude: 90.3690,
      rating: 4.8,
      reviewCount: 68,
      isVerified: true,
      isEmergencyEligible: true,
      priceEstimate: 'পরামর্শ ফি: ৳৩০০ - ৳৬০০',
      servicesOffered: [
        'জরুরি প্রাথমিক চিকিৎসা',
        'দাঁতের রুট ক্যানেল ও ফিলিং',
        'ব্লাড প্রেসার ও ডায়াবেটিস টেস্ট',
        'মেডিসিন বিশেষজ্ঞ পরামর্শ',
      ],
      reviews: [
        DorkarReview(
          id: 'rev-1',
          authorName: 'তানভীর আহমেদ',
          rating: 5.0,
          comment: 'খুব পরিষ্কার ক্লিনিক এবং ডাক্তার খুবই আন্তরিক। ফি-ও যুক্তিসঙ্গত।',
          date: '১২ অক্টোবর ২০২৬',
        ),
        DorkarReview(
          id: 'rev-2',
          authorName: 'রাবেয়া খাতুন',
          rating: 4.6,
          comment: 'জরুরি সময়ে ফোন করতেই দ্রুত সাহায্য পেয়েছি।',
          date: '৮ অক্টোবর ২০২৬',
        ),
      ],
      icon: Icons.local_hospital_rounded,
      iconColor: Color(0xFFE53935),
      iconBgColor: Color(0xFFFFEBEE),
    ),

    // 2. Lazz Pharma 24h (from user's screenshot)
    const DorkarProvider(
      id: 'prov-002-pharma',
      nameBn: 'লাজ ফার্মা (২৪ ঘণ্টা খোলা)',
      nameEn: 'Lazz Pharma (24h Open)',
      categoryId: 'pharmacy',
      categoryTitleBn: 'ফার্মেসি',
      phone: '01712223344',
      whatsapp: '01712223344',
      shopName: 'লাজ ফার্মা মিরপুর শাখা',
      experienceYears: 20,
      toolsOrEquipment: 'তাপমাত্রা নিয়ন্ত্রিত ইনসুলিন স্টোরেজ, অক্সিজেন সিলিন্ডার',
      areaId: 'mirpur2',
      areaNameBn: 'মিরপুর ২ মোড়',
      latitude: 23.8045,
      longitude: 90.3625,
      rating: 4.9,
      reviewCount: 142,
      isVerified: true,
      isEmergencyEligible: true,
      priceEstimate: 'এমআরপি মূল্যে জেনুইন ওষুধ',
      servicesOffered: [
        '২৪ ঘণ্টা লাইভ প্রেসক্রিপশন ডেলিভারি',
        'জরুরি অক্সিজেন সিলিন্ডার সরবরাহ',
        'লাইফ সেভিং ইনজেকশন ও স্যালাইন',
        'ডায়াবেটিক কিট ও স্ট্রিপ',
      ],
      reviews: [
        DorkarReview(
          id: 'rev-3',
          authorName: 'ইমরান হোসাইন',
          rating: 5.0,
          comment: 'রাত ৩টায় জরুরি ইনসুলিন দরকার ছিল, সরাসরি গিয়ে পেয়েছি।',
          date: '১০ অক্টোবর ২০২৬',
        ),
      ],
      icon: Icons.medication_rounded,
      iconColor: Color(0xFF00897B),
      iconBgColor: Color(0xFFE0F2F1),
    ),

    // 3. Master Electrician Service (from user's screenshot)
    const DorkarProvider(
      id: 'prov-003-elec',
      nameBn: 'মাস্টার ইলেকট্রিশিয়ান সার্ভিস (হোম ডেলিভারি)',
      nameEn: 'Master Electrician Service',
      categoryId: 'electrician',
      categoryTitleBn: 'ইলেকট্রিশিয়ান',
      phone: '01819998877',
      whatsapp: '01819998877',
      shopName: 'মাস্টার পাওয়ার ইঞ্জিনিয়ারিং',
      experienceYears: 11,
      toolsOrEquipment: 'ডিজিটাল মাল্টিমিটার, শর্ট সার্কিট ডিটেক্টর, অ্যালুমিনিয়াম মই',
      areaId: 'dhanmondi',
      areaNameBn: 'ধানমন্ডি ও মোহাম্মদপুর',
      latitude: 23.7461,
      longitude: 90.3742,
      rating: 4.7,
      reviewCount: 52,
      isVerified: true,
      isEmergencyEligible: true,
      priceEstimate: 'ভিজিট ফি: ৳২০০ - ৳৫০০',
      servicesOffered: [
        'শর্ট সার্কিট দ্রুত সমাধান',
        'হাউজ ওয়্যারিং ও সার্কিট ব্রেকার',
        'ফ্যান ও ঝাড়বাতি ইনস্টলেশন',
        'সুইচ ও সকেট প্রতিস্থাপন',
      ],
      reviews: [
        DorkarReview(
          id: 'rev-4',
          authorName: 'সাকিব হাসান',
          rating: 4.8,
          comment: 'সন্ধ্যায় মেইন সুইচ বোর্ডে আগুন লেগেছিল, ৩০ মিনিটে এসে ফিক্স করে দিয়েছে।',
          date: '৫ অক্টোবর ২০২৬',
        ),
      ],
      icon: Icons.bolt_rounded,
      iconColor: Color(0xFFF59E0B),
      iconBgColor: Color(0xFFFEF3C7),
    ),

    // 4. Quick Plumbing & Pipe Service (from user's screenshot)
    const DorkarProvider(
      id: 'prov-004-plumb',
      nameBn: 'কুইক প্লাম্বিং ও পাইপ সার্ভিস',
      nameEn: 'Quick Plumbing & Pipe Service',
      categoryId: 'plumber',
      categoryTitleBn: 'প্লাম্বার',
      phone: '01915556677',
      whatsapp: '01915556677',
      shopName: 'কুইক স্যানিটারি সলিউশন',
      experienceYears: 10,
      toolsOrEquipment: 'পাইপ রেঞ্জ সেট, ড্রেন আনব্লকার স্প্রিং, থ্রেড টেপ, প্রেশার মিটার',
      areaId: 'shewrapara',
      areaNameBn: 'মিরপুর ও শেওড়াপাড়া',
      latitude: 23.7891,
      longitude: 90.3752,
      rating: 4.6,
      reviewCount: 39,
      isVerified: true,
      isEmergencyEligible: true,
      priceEstimate: 'ভিজিট ফি: ৳২০০ - ৳৪০০',
      servicesOffered: [
        'পানির পাইপ লিকেজ মেরামত',
        'বেসিন ও কমোড ফিটিংস',
        'পানির মোটর ও পাম্প ওয়্যারিং',
        'ড্রেন ব্লক ও গ্যাসকেট পরিষ্কার',
      ],
      reviews: [
        DorkarReview(
          id: 'rev-5',
          authorName: 'কামরুল ইসলাম',
          rating: 4.5,
          comment: 'বেসিনের লিকেজ খুব সুন্দর করে ফিক্স করেছে। ভদ্র ও দক্ষ মিস্ত্রি।',
          date: '২ অক্টোবর ২০২৬',
        ),
      ],
      icon: Icons.plumbing_rounded,
      iconColor: Color(0xFF0284C7),
      iconBgColor: Color(0xFFE0F2FE),
    ),

    // 5. City Bike & Car Mechanic (from user's screenshot)
    const DorkarProvider(
      id: 'prov-005-mech',
      nameBn: 'সিটি বাইক ও গাড়ি মেকানিক',
      nameEn: 'City Bike & Car Mechanic',
      categoryId: 'mechanic',
      categoryTitleBn: 'অটোমোবাইল মেকানিক',
      phone: '01614443322',
      whatsapp: '01614443322',
      shopName: 'সিটি অটো কেয়ার সেন্টার',
      experienceYears: 14,
      toolsOrEquipment: 'ইলেকট্রনিক ডায়াগনস্টিক স্ক্যানার, হাইড্রোলিক জ্যাক, কারবুরেটর কিট',
      areaId: 'agargaon',
      areaNameBn: 'আগারগাঁও তালতলা',
      latitude: 23.7785,
      longitude: 90.3792,
      rating: 4.5,
      reviewCount: 44,
      isVerified: true,
      isEmergencyEligible: true,
      priceEstimate: 'সার্ভিসিং: ৳৩০০ - ৳১,৫০০',
      servicesOffered: [
        'রাস্তায় বাইক ব্রেকডাউন অন-কল মেরামত',
        'ইঞ্জিন টিউনিং ও মোবিল পরিবর্তন',
        'কার ব্যাটারি জাম্প স্টার্ট',
        'টায়ার পাংচার ও ব্রেক প্যাড মেরামত',
      ],
      reviews: [
        DorkarReview(
          id: 'rev-6',
          authorName: 'ফারহান চৌধুরী',
          rating: 4.7,
          comment: 'রোকেয়া সরণিতে বাইক বন্ধ হয়ে গিয়েছিল। কল দেওয়ার ২০ মিনিটে মেকানিক পৌঁছায়।',
          date: '২৯ সেপ্টেম্বর ২০২৬',
        ),
      ],
      icon: Icons.build_rounded,
      iconColor: Color(0xFF4F46E5),
      iconBgColor: Color(0xFFEEF2FF),
    ),

    // 6. IFIC & Dutch-Bangla FastTrack ATM (from user's screenshot)
    const DorkarProvider(
      id: 'prov-006-atm',
      nameBn: 'আইএফআইসি ও ডাচ-বাংলা ফাস্টট্র্যাক এটিএম',
      nameEn: 'IFIC & DBBL FastTrack ATM',
      categoryId: 'atm',
      categoryTitleBn: 'ব্যাংক ও এটিএম',
      phone: '16259',
      whatsapp: null,
      shopName: 'মিরপুর ১০ ফাস্টট্র্যাক বুথ',
      experienceYears: 8,
      toolsOrEquipment: 'ক্যাশ ডিপোজিট মেশিন (CRM), ২৪/৭ এয়ার কন্ডিশন ও সিসিটিভি গার্ড',
      areaId: 'mirpur10',
      areaNameBn: 'মিরপুর ১০ চত্বর',
      latitude: 23.8073,
      longitude: 90.3688,
      rating: 4.8,
      reviewCount: 95,
      isVerified: true,
      isEmergencyEligible: true,
      priceEstimate: 'টাকা তোলা ও তাৎক্ষণিক জমা সুবিধা',
      servicesOffered: [
        '২৪ ঘণ্টা নগদ টাকা উত্তোলন (ATM)',
        'রিয়েলটাইম ক্যাশ জমা (CRM)',
        'চেক ড্রপবক্স ও ফান্ড ট্রান্সফার',
        'বিদ্যুৎ ও গ্যাস বিল পেমেন্ট',
      ],
      reviews: [
        DorkarReview(
          id: 'rev-7',
          authorName: 'নাসির উদ্দিন',
          rating: 5.0,
          comment: 'সবসময় ক্যাশ থাকে এবং কোনো ভিড় থাকে না। খুব দ্রুত কাজ হয়।',
          date: '২৫ সেপ্টেম্বর ২০২৬',
        ),
      ],
      icon: Icons.atm_rounded,
      iconColor: Color(0xFF16A34A),
      iconBgColor: Color(0xFFDCFCE7),
    ),

    // 7. Abdul Karim Plumber (from khub-e-dorkar seed)
    const DorkarProvider(
      id: 'prov-007-karim',
      nameBn: 'আব্দুল করিম (Karim Mistri)',
      nameEn: 'Abdul Karim Plumber',
      categoryId: 'plumber',
      categoryTitleBn: 'প্লাম্বার',
      phone: '01712345678',
      whatsapp: '01712345678',
      shopName: 'করিম স্যানিটারি ওয়ার্কস',
      experienceYears: 12,
      toolsOrEquipment: 'পাইপ রেঞ্জ, ড্রিল মেশিন, থ্রেড টেপ, প্রেশার গেজ',
      areaId: 'mirpur10',
      areaNameBn: 'মিরপুর ১০, ঢাকা',
      latitude: 23.8071,
      longitude: 90.3686,
      rating: 4.8,
      reviewCount: 42,
      isVerified: true,
      isEmergencyEligible: true,
      priceEstimate: 'ভিজিট ফি: ৳২০০ - ৳৫০০',
      servicesOffered: [
        'পাইপ লিকেজ সমাধান',
        'পানির পাম্প / মোটর মেরামত',
        'বেসিন ও কমোড ফিটিংস',
      ],
      icon: Icons.plumbing_rounded,
      iconColor: Color(0xFF0284C7),
      iconBgColor: Color(0xFFE0F2FE),
    ),

    // 8. Harun Electric (from khub-e-dorkar seed)
    const DorkarProvider(
      id: 'prov-008-harun',
      nameBn: 'মোঃ হারুনুর রশিদ (Harun Electric)',
      nameEn: 'Harunur Rashid Electrician',
      categoryId: 'electrician',
      categoryTitleBn: 'ইলেকট্রিশিয়ান',
      phone: '01819283746',
      whatsapp: '01819283746',
      shopName: 'হারুন ইলেকট্রিক সার্ভিস, রোড ৪',
      experienceYears: 9,
      toolsOrEquipment: 'ডিজিটাল মাল্টিমিটার, টেস্ট ল্যাম্প, অ্যালুমিনিয়াম মই',
      areaId: 'dhanmondi',
      areaNameBn: 'ধানমন্ডি ২৭, ঢাকা',
      latitude: 23.7461,
      longitude: 90.3742,
      rating: 4.9,
      reviewCount: 38,
      isVerified: true,
      isEmergencyEligible: true,
      priceEstimate: 'ভিজিট ফি: ৳২০০ - ৳৬০০',
      servicesOffered: [
        'শর্ট সার্কিট ফিক্স',
        'হাউজ ওয়্যারিং',
        'সুইচ / সকেট পরিবর্তন',
        'ফ্যান ও লাইট ফিটিং',
      ],
      icon: Icons.bolt_rounded,
      iconColor: Color(0xFFF59E0B),
      iconBgColor: Color(0xFFFEF3C7),
    ),

    // 9. Shafiq AC & Fridge (from khub-e-dorkar seed)
    const DorkarProvider(
      id: 'prov-009-shafiq',
      nameBn: 'শফিকুল ইসলাম (Shafiq AC & Fridge)',
      nameEn: 'Shafiq AC & Refrigerator Specialist',
      categoryId: 'ac_technician',
      categoryTitleBn: 'এসি ও রেফ্রিজারেটর',
      phone: '01911445566',
      whatsapp: '01911445566',
      shopName: 'কুল জোন এসি সার্ভিস (Cool Zone)',
      experienceYears: 8,
      toolsOrEquipment: 'হাই প্রেশার ওয়াশার পাম্প, ভ্যাকুয়াম পাম্প, R32/R410A গ্যাস সিলিন্ডার',
      areaId: 'badda',
      areaNameBn: 'মধ্য বাড্ডা, ঢাকা',
      latitude: 23.7805,
      longitude: 90.4267,
      rating: 4.7,
      reviewCount: 29,
      isVerified: true,
      isEmergencyEligible: false,
      priceEstimate: 'সার্ভিসিং: ৳৮০০ - ৳২,৫০০',
      servicesOffered: [
        'এসি মাস্টার ক্লিনিং ও ওয়াশ',
        'রেফ্রিজারেন্ট গ্যাস রিফিল',
        'এসি খোলা ও পুনরায় লাগানো',
        'কুলিং সমস্যা ও কম্প্রেসার মেরামত',
      ],
      icon: Icons.ac_unit_rounded,
      iconColor: Color(0xFF06B6D4),
      iconBgColor: Color(0xFFCFFAFE),
    ),

    // 10. Manjur Gas Burner (from khub-e-dorkar seed)
    const DorkarProvider(
      id: 'prov-010-manjur',
      nameBn: 'মঞ্জুরুল হক (Manjur Gas Burner)',
      nameEn: 'Manjur Gas Stove Technician',
      categoryId: 'gas_burner',
      categoryTitleBn: 'গ্যাসের চুলা ও সিলিন্ডার',
      phone: '01677889900',
      whatsapp: '01677889900',
      shopName: 'হক চুলা সার্ভিস সেন্টার',
      experienceYears: 15,
      toolsOrEquipment: 'বার্নার ক্লিনিং ওয়্যার, রেগুলেটর কিট, গ্যাস ডিটেকশন স্প্রে',
      areaId: 'uttara',
      areaNameBn: 'উত্তরা সেক্টর ৭, ঢাকা',
      latitude: 23.8759,
      longitude: 90.3795,
      rating: 4.6,
      reviewCount: 19,
      isVerified: true,
      isEmergencyEligible: true,
      priceEstimate: 'সার্ভিস ফি: ৳২৫০ - ৳৭০০',
      servicesOffered: [
        'চুলায় অল্প আগুন বা কালি পড়া সমাধান',
        'গ্যাস পাইপ ও রেগুলেটর লিকেজ মেরামত',
        'সিলিন্ডার ও অটো স্টোভ সার্ভিসিং',
      ],
      icon: Icons.local_fire_department_rounded,
      iconColor: Color(0xFFEA580C),
      iconBgColor: Color(0xFFFFEDD5),
    ),

    // 11. Rahima Khala Cook & Cleaner (from khub-e-dorkar seed)
    const DorkarProvider(
      id: 'prov-011-rahima',
      nameBn: 'রহিমা খাতুন (Rahima Khala - Cook & Cleaning)',
      nameEn: 'Rahima Khatun - Home Cook & Cleaning',
      categoryId: 'cook_cleaner',
      categoryTitleBn: 'বুয়া ও রান্নার সাহায্যকারী',
      phone: '01733445577',
      whatsapp: null,
      shopName: 'ঘরোয়া গৃহকর্মী সেবা',
      experienceYears: 10,
      toolsOrEquipment: 'ঘরোয়া রান্নার অভিজ্ঞতা, পরিচ্ছন্নতা সনদ',
      areaId: 'mohammadpur',
      areaNameBn: 'মোহাম্মদপুর তাজমহল রোড',
      latitude: 23.7658,
      longitude: 90.3584,
      rating: 4.9,
      reviewCount: 15,
      isVerified: true,
      isEmergencyEligible: false,
      priceEstimate: 'মাসিক বা দৈনিক চুক্তিতে',
      servicesOffered: [
        'বাঙালি ঐতিহ্যবাহী রান্না (দুপুর ও রাত)',
        'বাসা-বাড়ি ডিপ ক্লিনিং ও মোছা',
        'থালাবাসন ধোয়া ও কাপড় ধোয়া',
      ],
      icon: Icons.cleaning_services_rounded,
      iconColor: Color(0xFFDB2777),
      iconBgColor: Color(0xFFFCE7F3),
    ),

    // 12. Ratan Carpenter (from khub-e-dorkar seed)
    const DorkarProvider(
      id: 'prov-012-ratan',
      nameBn: 'রতন মিয়া (Ratan Carpenter)',
      nameEn: 'Ratan Mia Carpenter',
      categoryId: 'carpenter',
      categoryTitleBn: 'কাঠমিস্ত্রি ও ফার্নিচার',
      phone: '01552334455',
      whatsapp: '01552334455',
      shopName: 'রতন ফার্নিচার ওয়ার্কশপ',
      experienceYears: 14,
      toolsOrEquipment: 'করাত, বাটালি, গ্লু গান, স্ক্রু ড্রাইভার সেট',
      areaId: 'gulshan',
      areaNameBn: 'গুলশান ১, ঢাকা',
      latitude: 23.7925,
      longitude: 90.4078,
      rating: 4.8,
      reviewCount: 24,
      isVerified: true,
      isEmergencyEligible: false,
      priceEstimate: 'ভিজিট ফি: ৳৩০০ - ৳৮০০',
      servicesOffered: [
        'ভাঙা ফার্নিচার মেরামত ও পলিশ',
        'দরজার লক ও কব্জা ফিটিং',
        'ক্যাবিনেট ও কিচেন রেক সংযোজন',
      ],
      icon: Icons.handyman_rounded,
      iconColor: Color(0xFFB45309),
      iconBgColor: Color(0xFFFEF3C7),
    ),

    // 13. Jahangir Mudir Dokan (from khub-e-dorkar seed)
    const DorkarProvider(
      id: 'prov-013-mudir',
      nameBn: 'জাহাঙ্গীর আলম (Bismillah Mudir Dokan)',
      nameEn: 'Bismillah Grocery & Mudir Dokan',
      categoryId: 'mudir_dokan',
      categoryTitleBn: 'মুদির দোকান',
      phone: '01722338899',
      whatsapp: '01722338899',
      shopName: 'বিসমিল্লাহ জেনারেল স্টোর',
      experienceYears: 7,
      toolsOrEquipment: 'হোম ডেলিভারি ভ্যান, ডিজিটাল পাল্লা',
      areaId: 'badda',
      areaNameBn: 'খিলগাঁও ও বাড্ডা সংলগ্ন',
      latitude: 23.7547,
      longitude: 90.4258,
      rating: 4.9,
      reviewCount: 54,
      isVerified: true,
      isEmergencyEligible: true,
      priceEstimate: 'বাজার দরে হোম ডেলিভারি',
      servicesOffered: [
        'জরুরি চাল, ডাল, তেল ও মশলা ডেলিভারি',
        'ফিল্টার করা সুপেয় খাবার পানির জার',
        'শিশু খাদ্য ও দুধ সরবরাহ',
      ],
      icon: Icons.storefront_rounded,
      iconColor: Color(0xFF65A30D),
      iconBgColor: Color(0xFFECFCCB),
    ),

    // 14. Tareq IPS & Battery (from khub-e-dorkar seed)
    const DorkarProvider(
      id: 'prov-014-ips',
      nameBn: 'তারেক হাসান (Tareq IPS & Battery)',
      nameEn: 'Tareq IPS & Solar Technician',
      categoryId: 'ips_solar',
      categoryTitleBn: 'আইপিএস ও জেনারেটর',
      phone: '01844556677',
      whatsapp: '01844556677',
      shopName: 'পাওয়ারটেক আইপিএস সলিউশন',
      experienceYears: 9,
      toolsOrEquipment: 'ডিজিটাল হাইড্রোমিটার, ব্যাটারি চার্জার, ইনভার্টার টেস্টার',
      areaId: 'farmgate',
      areaNameBn: 'ফার্মগেট ও তেজগাঁও',
      latitude: 23.7570,
      longitude: 90.3887,
      rating: 4.8,
      reviewCount: 31,
      isVerified: true,
      isEmergencyEligible: true,
      priceEstimate: 'সার্ভিস ফি: ৳৩০০ - ৳১,০০০',
      servicesOffered: [
        'আইপিএস ব্যাটারি ডিস্টিলড ওয়াটার ও মেইনটেনেন্স',
        'ইনভার্টার সার্কিট ও কার্ড মেরামত',
        'নতুন আইপিএস ও ব্যাটারি সেটআপ',
      ],
      icon: Icons.battery_charging_full_rounded,
      iconColor: Color(0xFFD97706),
      iconBgColor: Color(0xFFFEF3C7),
    ),
  ];

  // User-added community providers stored locally
  final List<DorkarProvider> _userAddedProviders = [];

  // User submitted bookings stored locally
  final List<DorkarBookingRequest> _userBookings = [];

  // User favorite provider IDs
  final Set<String> _favorites = {};

  bool _initialized = false;

  Future<void> init() async {
    if (_initialized) return;
    try {
      final prefs = await SharedPreferences.getInstance();
      
      // Load user added providers
      final provJson = prefs.getString('dorkar_user_providers');
      if (provJson != null) {
        final List list = jsonDecode(provJson);
        for (final item in list) {
          _userAddedProviders.add(DorkarProvider(
            id: item['id'],
            nameBn: item['nameBn'],
            nameEn: item['nameEn'] ?? item['nameBn'],
            categoryId: item['categoryId'],
            categoryTitleBn: item['categoryTitleBn'],
            phone: item['phone'],
            whatsapp: item['whatsapp'],
            shopName: item['shopName'],
            experienceYears: item['experienceYears'] ?? 5,
            toolsOrEquipment: item['toolsOrEquipment'] ?? 'স্ট্যান্ডার্ড টুলস',
            areaId: item['areaId'],
            areaNameBn: item['areaNameBn'],
            latitude: (item['latitude'] as num).toDouble(),
            longitude: (item['longitude'] as num).toDouble(),
            rating: 5.0,
            reviewCount: 1,
            isVerified: false,
            isCommunityAdded: true,
            isEmergencyEligible: item['isEmergencyEligible'] ?? false,
            priceEstimate: item['priceEstimate'] ?? 'আলোচনা সাপেক্ষে',
            servicesOffered: List<String>.from(item['servicesOffered'] ?? []),
            icon: Icons.handyman_rounded,
            iconColor: const Color(0xFF1E88E5),
            iconBgColor: const Color(0xFFE0F2FE),
          ));
        }
      }

      // Load bookings
      final bookJson = prefs.getString('dorkar_user_bookings');
      if (bookJson != null) {
        final List list = jsonDecode(bookJson);
        for (final item in list) {
          _userBookings.add(DorkarBookingRequest.fromJson(item));
        }
      }

      // Load favorites
      final favList = prefs.getStringList('dorkar_favorites');
      if (favList != null) {
        _favorites.addAll(favList);
      }

      _initialized = true;
    } catch (e) {
      debugPrint('DorkarService init error: $e');
    }
  }

  // Get active providers with dynamic filtering and real-time geodesic distance calculation
  List<DorkarProvider> getProviders({
    String categoryId = 'all',
    String searchQuery = '',
    bool emergencyOnly = false,
  }) {
    final allList = [..._baseProviders, ..._userAddedProviders];
    final currentArea = selectedArea.value;

    return allList.where((p) {
      if (categoryId != 'all' && p.categoryId != categoryId) {
        return false;
      }
      if (emergencyOnly && !p.isEmergencyEligible) {
        return false;
      }
      if (searchQuery.isNotEmpty) {
        final q = searchQuery.toLowerCase().trim();
        final matches = p.nameBn.toLowerCase().contains(q) ||
            p.nameEn.toLowerCase().contains(q) ||
            p.categoryTitleBn.toLowerCase().contains(q) ||
            p.areaNameBn.toLowerCase().contains(q) ||
            (p.shopName?.toLowerCase().contains(q) ?? false) ||
            p.servicesOffered.any((s) => s.toLowerCase().contains(q));
        if (!matches) return false;
      }
      return true;
    }).toList()
      ..sort((a, b) {
        // Sort primarily by proximity to selected area
        final distA = DorkarArea.calculateDistanceKm(
          currentArea.latitude,
          currentArea.longitude,
          a.latitude,
          a.longitude,
        );
        final distB = DorkarArea.calculateDistanceKm(
          currentArea.latitude,
          currentArea.longitude,
          b.latitude,
          b.longitude,
        );
        return distA.compareTo(distB);
      });
  }

  /// Calculates distance from current selected area
  String getFormattedDistance(DorkarProvider provider) {
    final currentArea = selectedArea.value;
    final km = DorkarArea.calculateDistanceKm(
      currentArea.latitude,
      currentArea.longitude,
      provider.latitude,
      provider.longitude,
    );
    return DorkarArea.formatDistanceBn(km);
  }

  // Marketplace Services catalog from Khub-e-Dorkar
  static const List<DorkarMarketplaceService> marketplaceServices = [
    DorkarMarketplaceService(
      id: 'plumber_leakage',
      parentCategoryId: 'plumber',
      titleBn: 'প্লাম্বার (পাইপ ও লিকেজ মেরামত)',
      titleEn: 'Plumber — Pipe & Leakage Repair',
      descriptionBn: 'পানির পাইপ, কল, বেসিন, কমোড ও ড্রেন লিকেজ দ্রুত সমাধান',
      icon: Icons.plumbing_rounded,
      priceUnit: 'ভিজিট (Visit)',
      minPriceBdt: 200,
      maxPriceBdt: 500,
      isEmergencyEligible: true,
    ),
    DorkarMarketplaceService(
      id: 'electrician_wiring',
      parentCategoryId: 'electrician',
      titleBn: 'ইলেকট্রিশিয়ান (ওয়্যারিং ও ফিক্সিং)',
      titleEn: 'Electrician — Wiring & Electrical Fix',
      descriptionBn: 'শর্ট সার্কিট, ওয়্যারিং, সুইচ-সকেট, ফ্যান ও লাইট ফিটিং',
      icon: Icons.bolt_rounded,
      priceUnit: 'ভিজিট (Visit)',
      minPriceBdt: 200,
      maxPriceBdt: 600,
      isEmergencyEligible: true,
    ),
    DorkarMarketplaceService(
      id: 'ac_servicing',
      parentCategoryId: 'ac_technician',
      titleBn: 'এসি ওয়াশ ও গ্যাস রিফিল সার্ভিসিং',
      titleEn: 'AC Master Servicing & Gas Refill',
      descriptionBn: 'হাই প্রেশার ওয়াটার জেট ওয়াশ, কুলিং চেকিং ও R32/R410A গ্যাস রিফিল',
      icon: Icons.ac_unit_rounded,
      priceUnit: 'ইউনিট (Unit)',
      minPriceBdt: 800,
      maxPriceBdt: 3500,
      isEmergencyEligible: false,
    ),
    DorkarMarketplaceService(
      id: 'gas_burner_fix',
      parentCategoryId: 'gas_burner',
      titleBn: 'গ্যাসের চুলা ও রেগুলেটর মেরামত',
      titleEn: 'Gas Stove & Cylinder Regulator',
      descriptionBn: 'চুলায় কালি ওঠা, লো ফ্লেম, গ্যাস লিকেজ ও সিলিন্ডার পাইপ ফিটিং',
      icon: Icons.local_fire_department_rounded,
      priceUnit: 'চুলা (Stove)',
      minPriceBdt: 250,
      maxPriceBdt: 700,
      isEmergencyEligible: true,
    ),
    DorkarMarketplaceService(
      id: 'water_pump_repair',
      parentCategoryId: 'plumber',
      titleBn: 'পানির মোটর ও পাম্প মেরামত',
      titleEn: 'Water Pump & Motor Repair',
      descriptionBn: 'মোটরে পানি না ওঠা, কয়েল সমস্যা ও স্বয়ংক্রিয় সুইচ মেরামত',
      icon: Icons.water_damage_rounded,
      priceUnit: 'কাজ (Job)',
      minPriceBdt: 500,
      maxPriceBdt: 1800,
      isEmergencyEligible: true,
    ),
    DorkarMarketplaceService(
      id: 'lock_carpenter',
      parentCategoryId: 'carpenter',
      titleBn: 'দরজার লক ও কব্জা ফিটিং (কাঠমিস্ত্রি)',
      titleEn: 'Door Lock & Hinge Fitting',
      descriptionBn: 'প্রধান দরজার সিকিউরিটি লক, ড্রয়ার লক ও কিচেন কব্জা পরিবর্তন',
      icon: Icons.lock_open_rounded,
      priceUnit: 'লক (Lock)',
      minPriceBdt: 300,
      maxPriceBdt: 800,
      isEmergencyEligible: false,
    ),
    DorkarMarketplaceService(
      id: 'deep_cleaning',
      parentCategoryId: 'cook_cleaner',
      titleBn: 'ফুল বাসা ডিপ ক্লিনিং সার্ভিস',
      titleEn: 'Full Home Deep Cleaning',
      descriptionBn: 'ফ্লোর স্ক্রাবিং, টয়লেট ডিপ ক্লিন ও কিচেন চিমনি গ্রিজ পরিষ্কার',
      icon: Icons.cleaning_services_rounded,
      priceUnit: 'বাসা (Apartment)',
      minPriceBdt: 1500,
      maxPriceBdt: 4500,
      isEmergencyEligible: false,
    ),
    DorkarMarketplaceService(
      id: 'bike_tuneup',
      parentCategoryId: 'mechanic',
      titleBn: 'বাইক অন-কল টিউনিং ও সার্ভিসিং',
      titleEn: 'Bike On-Call Master Tuneup',
      descriptionBn: 'কারবুরেটর টিউনিং, চেইন লুব্রিকেশন, ব্রেক প্যাড ও প্লাগ ক্লিন',
      icon: Icons.two_wheeler_rounded,
      priceUnit: 'বাইক (Bike)',
      minPriceBdt: 400,
      maxPriceBdt: 1200,
      isEmergencyEligible: true,
    ),
  ];

  // Add new community crowdsourced provider
  Future<void> addCommunityProvider({
    required String nameBn,
    required String categoryId,
    required String categoryTitleBn,
    required String phone,
    String? whatsapp,
    String? shopName,
    required int experienceYears,
    required String toolsOrEquipment,
    required String areaId,
    required String areaNameBn,
  }) async {
    final area = dhakaAreas.firstWhere(
      (a) => a.id == areaId,
      orElse: () => selectedArea.value,
    );

    final newProvider = DorkarProvider(
      id: 'user-prov-${DateTime.now().millisecondsSinceEpoch}',
      nameBn: nameBn,
      nameEn: nameBn,
      categoryId: categoryId,
      categoryTitleBn: categoryTitleBn,
      phone: phone,
      whatsapp: whatsapp,
      shopName: shopName,
      experienceYears: experienceYears,
      toolsOrEquipment: toolsOrEquipment,
      areaId: areaId,
      areaNameBn: areaNameBn,
      latitude: area.latitude,
      longitude: area.longitude,
      rating: 5.0,
      reviewCount: 1,
      isVerified: false,
      isCommunityAdded: true,
      isEmergencyEligible: false,
      priceEstimate: 'আলোচনা সাপেক্ষে',
      servicesOffered: [
        '$categoryTitleBn সেবা',
        'স্থানীয় অন-কল পরিদর্শন',
      ],
      icon: Icons.handyman_rounded,
      iconColor: const Color(0xFF1E88E5),
      iconBgColor: const Color(0xFFE0F2FE),
    );

    _userAddedProviders.insert(0, newProvider);

    // Persist
    try {
      final prefs = await SharedPreferences.getInstance();
      final list = _userAddedProviders.map((p) => {
        'id': p.id,
        'nameBn': p.nameBn,
        'nameEn': p.nameEn,
        'categoryId': p.categoryId,
        'categoryTitleBn': p.categoryTitleBn,
        'phone': p.phone,
        'whatsapp': p.whatsapp,
        'shopName': p.shopName,
        'experienceYears': p.experienceYears,
        'toolsOrEquipment': p.toolsOrEquipment,
        'areaId': p.areaId,
        'areaNameBn': p.areaNameBn,
        'latitude': p.latitude,
        'longitude': p.longitude,
        'isEmergencyEligible': p.isEmergencyEligible,
        'priceEstimate': p.priceEstimate,
        'servicesOffered': p.servicesOffered,
      }).toList();
      await prefs.setString('dorkar_user_providers', jsonEncode(list));
    } catch (e) {
      debugPrint('Save user provider error: $e');
    }
  }

  // Create booking request
  Future<DorkarBookingRequest> createBooking({
    required String serviceTitleBn,
    String? providerName,
    required DorkarBookingMode mode,
    required String userPhone,
    required String userAddress,
    required String issueDescription,
    String? scheduledDate,
    required String estimatedPrice,
  }) async {
    final booking = DorkarBookingRequest(
      id: 'DKR-${1000 + _userBookings.length + 1}',
      serviceTitleBn: serviceTitleBn,
      providerName: providerName,
      mode: mode,
      userPhone: userPhone,
      userAddress: userAddress,
      issueDescription: issueDescription,
      scheduledDate: scheduledDate,
      estimatedPrice: estimatedPrice,
      status: 'অনুরোধ গৃহীত (Pending)',
      createdAt: DateTime.now(),
    );

    _userBookings.insert(0, booking);

    try {
      final prefs = await SharedPreferences.getInstance();
      final list = _userBookings.map((b) => b.toJson()).toList();
      await prefs.setString('dorkar_user_bookings', jsonEncode(list));
    } catch (e) {
      debugPrint('Save booking error: $e');
    }

    return booking;
  }

  List<DorkarBookingRequest> getBookings() => List.unmodifiable(_userBookings);

  // Toggle favorite
  Future<void> toggleFavorite(String providerId) async {
    if (_favorites.contains(providerId)) {
      _favorites.remove(providerId);
    } else {
      _favorites.add(providerId);
    }
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('dorkar_favorites', _favorites.toList());
    } catch (e) {
      debugPrint('Favorite error: $e');
    }
  }

  bool isFavorite(String providerId) => _favorites.contains(providerId);

  // Add review to provider
  void addReviewToProvider(String providerId, DorkarReview review) {
    for (int i = 0; i < _baseProviders.length; i++) {
      if (_baseProviders[i].id == providerId) {
        final p = _baseProviders[i];
        final newReviews = [review, ...p.reviews];
        _baseProviders[i] = p.copyWith(
          reviews: newReviews,
          reviewCount: p.reviewCount + 1,
        );
        return;
      }
    }
    for (int i = 0; i < _userAddedProviders.length; i++) {
      if (_userAddedProviders[i].id == providerId) {
        final p = _userAddedProviders[i];
        final newReviews = [review, ...p.reviews];
        _userAddedProviders[i] = p.copyWith(
          reviews: newReviews,
          reviewCount: p.reviewCount + 1,
        );
        return;
      }
    }
  }
}
