import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/dhaka_life_models.dart';
import '../services/dhaka_data_service.dart';

class DhakaEmergencyScreen extends StatelessWidget {
  const DhakaEmergencyScreen({Key? key}) : super(key: key);

  static Future<bool> makeCall(BuildContext? context, String number) async {
    final cleanNumber = number.replaceAll(RegExp(r'[^0-9+]'), '');
    final Uri uri = Uri.parse('tel:$cleanNumber');
    try {
      final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!launched && context != null && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('ডায়ালার চালু করা যায়নি: $cleanNumber'),
            backgroundColor: const Color(0xFFDC2626),
          ),
        );
      }
      return launched;
    } catch (e) {
      debugPrint('Error calling $cleanNumber: $e');
      if (context != null && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('ডায়ালার ত্রুটি: $cleanNumber'),
            backgroundColor: const Color(0xFFDC2626),
          ),
        );
      }
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final contacts = DhakaDataService.getEmergencyContacts();

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              color: Color(0xFF0F172A), size: 20),
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          },
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'জরুরি সেবা ডিরেক্টরি (Emergency)',
              style: TextStyle(
                color: Color(0xFF0F172A),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              'এক স্পর্শে সরাসরি জরুরি নম্বরে কল করুন',
              style: TextStyle(
                color: Color(0xFF64748B),
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        children: [
          // 999 Hero Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFE53935), Color(0xFFB71C1C)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFE53935).withOpacity(0.35),
                  blurRadius: 15,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'টোল-ফ্রি ২৪/৭',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Icon(Icons.emergency, color: Colors.white, size: 30),
                  ],
                ),
                const SizedBox(height: 14),
                const Text(
                  'জাতীয় জরুরি সেবা ৯৯৯',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'পুলিশ, অ্যাম্বুলেন্স অথবা অগ্নিনির্বাপণ তাৎক্ষণিক সাহায্যের জন্য কল করুন',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFFCDD2),
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 18),
                ElevatedButton.icon(
                  onPressed: () => makeCall(context, '999'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFFB71C1C),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  icon: const Icon(Icons.phone_in_talk, size: 20),
                  label: const Text(
                    'এখনই ৯৯৯ কল করুন',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),

          const Text(
            'অন্যান্য গুরুত্বপূর্ণ জাতীয় হটলাইন',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 12),

          ...contacts.skip(1).map((contact) {
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
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
              child: ListTile(
                onTap: () => makeCall(context, contact.number),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: contact.color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(contact.icon, color: contact.color, size: 26),
                ),
                title: Text(
                  contact.titleBn,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color(0xFF1E293B),
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text(
                      contact.descriptionBn,
                      style: const TextStyle(
                          fontSize: 12, color: Color(0xFF64748B)),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'নম্বর: ${contact.number}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF334155),
                        ),
                      ),
                    ),
                  ],
                ),
                trailing: IconButton(
                  icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: contact.color,
                      shape: BoxShape.circle,
                    ),
                    child:
                        const Icon(Icons.call, color: Colors.white, size: 18),
                  ),
                  onPressed: () => makeCall(context, contact.number),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
