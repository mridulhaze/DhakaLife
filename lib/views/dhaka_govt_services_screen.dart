import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DhakaGovtServicesScreen extends StatelessWidget {
  const DhakaGovtServicesScreen({Key? key}) : super(key: key);

  void _openWebsite(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final govtServices = [
      {
        'title': 'ই-পাসপোর্ট অনলাইন আবেদন',
        'sub': 'বাংলাদেশ ই-পাসপোর্ট অনলাইন পোর্টাল',
        'url': 'https://www.epassport.gov.bd/',
        'icon': Icons.airplane_ticket_rounded,
        'color': const Color(0xFF00897B),
        'desc': 'নতুন পাসপোর্টের আবেদন, ফর্ম পূরণ, পেমেন্ট ও ডেলিভারি স্ট্যাটাস চেক করুন।',
      },
      {
        'title': 'জাতীয় পরিচয়পত্র (NID) সেবা',
        'sub': 'নির্বাচন কমিশন এনআইডি উইং',
        'url': 'https://services.nidw.gov.bd/',
        'icon': Icons.badge_rounded,
        'color': const Color(0xFF1E88E5),
        'desc': 'স্মার্ট কার্ড ডাউনলোড, ভোটার তথ্য সংশোধন ও অনলাইন রিইস্যু আবেদন।',
      },
      {
        'title': 'অনলাইন জন্ম ও মৃত্যু নিবন্ধন (BDRIS)',
        'sub': 'রেজিস্ট্রার জেনারেলের কার্যালয়',
        'url': 'https://bdris.gov.bd/',
        'icon': Icons.child_care_rounded,
        'color': const Color(0xFF8E24AA),
        'desc': 'জন্ম সনদ যাচাই, নতুন জন্ম নিবন্ধনের আবেদন ও সংশোধন।',
      },
      {
        'title': 'বিদ্যুৎ বিল ও সংযোগ (DESCO / DPDC)',
        'sub': 'ঢাকা ইলেকট্রিক সাপ্লাই কোম্পানি',
        'url': 'https://www.desco.org.bd/',
        'icon': Icons.electric_bolt_rounded,
        'color': const Color(0xFFF57C00),
        'desc': 'পোস্টপেইড ও প্রিপেইড মিটার রিচার্জ, বিল পরিশোধ ও অভিযোগ দাখিল।',
      },
      {
        'title': 'ঢাকা ওয়াসা (পানি ও পয়ঃনিষ্কাশন)',
        'sub': 'ঢাকা ওয়াসা অনলাইন বিল ও অভিযোগ',
        'url': 'https://dwasa.org.bd/',
        'icon': Icons.water_drop_rounded,
        'color': const Color(0xFF0288D1),
        'desc': 'ওয়াসা পানির বিল অনুসন্ধান ও পানির গাড়ির আবেদন।',
      },
      {
        'title': 'জাতীয় সেবা পোর্টাল (বাংলাদেশ)',
        'sub': 'সকল নাগরিক সেবার এক ঠিকানা',
        'url': 'https://bangladesh.gov.bd/',
        'icon': Icons.account_balance_rounded,
        'color': const Color(0xFF43A047),
        'desc': 'মন্ত্রণালয়, সরকারি ফরম, গেজেট ও নাগরিক অধিকার বিষয়ক পোর্টাল।',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF0F172A), size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'সরকারি সেবা ও তথ্য ডিরেক্টরি',
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF0FDF4),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFBBF7D0)),
            ),
            child: Row(
              children: const [
                Icon(Icons.verified_user_outlined, color: Color(0xFF16A34A), size: 24),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'সরকারি অফিসিয়াল সিটিজেন চার্টার ও ডিজিটাল সেবাসমূহের সরাসরি পোর্টাল লিংক।',
                    style: TextStyle(fontSize: 12.5, color: Color(0xFF166534), height: 1.4),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),

          ...govtServices.map((service) {
            final color = service['color'] as Color;
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFF1F5F9)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(service['icon'] as IconData, color: color, size: 24),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              service['title'] as String,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14.5, color: Color(0xFF1E293B)),
                            ),
                            Text(
                              service['sub'] as String,
                              style: const TextStyle(fontSize: 11.5, color: Color(0xFF64748B)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    service['desc'] as String,
                    style: const TextStyle(fontSize: 12, color: Color(0xFF475569), height: 1.3),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: color,
                        side: BorderSide(color: color),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      ),
                      icon: const Icon(Icons.open_in_new, size: 14),
                      label: const Text('অফিসিয়াল পোর্টালে যান', style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold)),
                      onPressed: () => _openWebsite(service['url'] as String),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
