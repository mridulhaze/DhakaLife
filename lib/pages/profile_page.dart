import 'package:flutter/material.dart';
import 'package:flutter_project_nutcm_1/views/login_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  Future<void> _launchUrl(String urlString) async {
    final uri = Uri.parse(urlString);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'পরিচিতি ও ডেভেলপার',
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF0F172A)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ================= DEVELOPER PROFILE CARD =================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: const Color(0xFFE2E8F0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 14,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Avatar with verified badge
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: 104,
                        height: 104,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF1E88E5),
                            width: 3,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF1E88E5).withOpacity(0.2),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/profile.jpg',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.person,
                                    size: 60, color: Color(0xFF1E88E5)),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Color(0xFF059669),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.verified,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),

                  const Text(
                    'Mridul Roy',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF0F172A),
                      letterSpacing: -0.3,
                    ),
                  ),
                  const SizedBox(height: 4),

                  const Text(
                    'Assistant Programmer, ICT Department',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1E88E5),
                    ),
                  ),
                  const SizedBox(height: 2),

                  const Text(
                    'National University of Bangladesh',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF64748B),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Credential Pills
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildPill('M.Sc. in Cyber Security (DU)',
                          const Color(0xFFE0F2FE), const Color(0xFF0284C7)),
                      _buildPill('B.Sc. in CSE (NU)', const Color(0xFFEDE9FE),
                          const Color(0xFF7C3AED)),
                      _buildPill('~14 Yrs ICT Public Service',
                          const Color(0xFFDCFCE7), const Color(0xFF15803D)),
                      _buildPill('Mobile & Full-Stack', const Color(0xFFFEF3C7),
                          const Color(0xFFB45309)),
                    ],
                  ),
                  const SizedBox(height: 18),

                  const Divider(color: Color(0xFFE2E8F0)),
                  const SizedBox(height: 14),

                  // Bio description from https://mridulhaze.github.io/
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'ডেভেলপার পরিচিতি ও দক্ষতা',
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  const Text(
                    'দীর্ঘ প্রায় ১৪ বছর ধরে জাতীয় বিশ্ববিদ্যালয়ের আইসিটি বিভাগে সহকারী প্রোগ্রামার হিসেবে দায়িত্ব পালন করছি। মূল দক্ষতার মধ্যে রয়েছে ফলাফল প্রক্রিয়াকরণ (Result Processing), সাইবার সিকিউরিটি অডিট, মেশিন লার্নিং এবং আধুনিক ক্রস-প্ল্যাটফর্ম মোবাইল অ্যাপ্লিকেশন আর্কিটেকচার। ঢাকা লাইফ অ্যাপটি তৈরি করা হয়েছে নাগরিক জীবন ও প্রাতিষ্ঠানিক কাজের সুবিধার্থে।',
                    style: TextStyle(
                      fontSize: 12.5,
                      height: 1.55,
                      color: Color(0xFF475569),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Contact / Links Buttons
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () =>
                              _launchUrl('https://mridulhaze.github.io/'),
                          icon: Icon(PhosphorIcons.globe(PhosphorIconsStyle.fill), size: 16),
                          label: const Text('Website'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1E88E5),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () =>
                              _launchUrl('https://github.com/mridulhaze'),
                          icon: Icon(PhosphorIcons.githubLogo(PhosphorIconsStyle.fill), size: 16),
                          label: const Text('GitHub'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xFF0F172A),
                            side: const BorderSide(color: Color(0xFFCBD5E1)),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                      icon: const Icon(Icons.login_rounded, size: 16),
                      label: const Text('লগইন স্ক্রিন দেখুন (User Login)'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF1E88E5),
                        side: const BorderSide(color: Color(0xFF90CAF9)),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ================= ABOUT APP CARD =================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: const Color(0xFFE2E8F0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 14,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFE53935), Color(0xFF1E88E5)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Icon(Icons.flash_on_rounded,
                              color: Colors.white, size: 26),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'DhakaLife (ঢাকা লাইফ)',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0F172A),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'সংস্করণ: ১.০.০ (Production Build)',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF64748B),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  const Text(
                    'ঢাকা লাইফ একটি সমন্বিত সুপার অ্যাপ্লিকেশন। ঢাকার সকল নাগরিক জরুরি সেবা (৯৯৯ কল, মেট্রোরেল ও বাস রুট গাইড, লাইভ বাজার দর, অফলাইন খরচ হিসাব) এবং জাতীয় বিশ্ববিদ্যালয়ের একাডেমিক পোর্টালকে (লাইভ নোটিশ স্লাইডার, কর্মচারী ডিরেক্টরি, কলেজ তালিকা ও ট্যুর দূরত্ব হিসাব) একই ছাদের নিচে নিয়ে এসেছে।',
                    style: TextStyle(
                      fontSize: 12.5,
                      height: 1.55,
                      color: Color(0xFF475569),
                    ),
                  ),
                  const SizedBox(height: 16),

                  _buildFeatureRow(PhosphorIcons.shieldCheck(PhosphorIconsStyle.fill),
                      'অফলাইন ফার্স্ট আর্কিটেকচার (ইন্টারনেট ছাড়াও কার্যকর)',
                      const Color(0xFF059669)),
                  _buildFeatureRow(PhosphorIcons.bell(PhosphorIconsStyle.fill),
                      'জাতীয় বিশ্ববিদ্যালয়ের নোটিশ স্ক্র্যাপার ও স্লাইডার',
                      const Color(0xFF1E88E5)),
                  _buildFeatureRow(PhosphorIcons.heart(PhosphorIconsStyle.fill),
                      'জরুরি ৯৯৯, ফায়ার সার্ভিস ও হাসপাতাল ডিরেক্টরি',
                      const Color(0xFFEF4444)),
                  _buildFeatureRow(PhosphorIcons.shoppingBag(PhosphorIconsStyle.fill),
                      'দৈনিক পাইকারি ও খুচরা বাজার দরের তাৎক্ষণিক তথ্য',
                      const Color(0xFFD97706)),

                  const SizedBox(height: 18),
                  const Divider(color: Color(0xFFE2E8F0)),
                  const SizedBox(height: 10),

                  // Copyright Footer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.copyright, size: 14, color: Color(0xFF64748B)),
                      SizedBox(width: 4),
                      Text(
                        'Mridul Roy. সর্বস্বত্ব সংরক্ষিত।',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF475569),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildPill(String label, Color bg, Color text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: text,
        ),
      ),
    );
  }

  Widget _buildFeatureRow(IconData icon, String text, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF334155),
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
