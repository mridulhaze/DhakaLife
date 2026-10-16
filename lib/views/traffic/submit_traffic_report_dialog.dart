import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/dhaka_traffic_model.dart';
import '../../services/dhaka_location_service.dart';
import '../../services/dhaka_traffic_service.dart';

class SubmitTrafficReportDialog extends StatefulWidget {
  const SubmitTrafficReportDialog({Key? key}) : super(key: key);

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const SubmitTrafficReportDialog(),
    );
  }

  @override
  State<SubmitTrafficReportDialog> createState() => _SubmitTrafficReportDialogState();
}

class _SubmitTrafficReportDialogState extends State<SubmitTrafficReportDialog> {
  final _titleController = TextEditingController();
  final _roadController = TextEditingController();
  final _descController = TextEditingController();

  DhakaTrafficCategory _selectedCategory = DhakaTrafficCategory.congestion;
  DhakaTrafficSeverity _selectedSeverity = DhakaTrafficSeverity.moderate;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    // Default area from user's current location
    _roadController.text = DhakaLocationService.to.currentLocationName.value;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _roadController.dispose();
    _descController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final road = _roadController.text.trim();
    final desc = _descController.text.trim();
    var title = _titleController.text.trim();

    if (road.isEmpty) {
      Get.snackbar(
        'সতর্কতা',
        'অনুগ্রহ করে সড়ক বা এলাকার নাম দিন',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade800,
        colorText: Colors.white,
      );
      return;
    }

    if (title.isEmpty) {
      title = '${_selectedCategory.name == 'congestion' ? 'যানজট' : 'ট্রাফিক সতর্কতা'} - $road';
    }

    setState(() => _isSubmitting = true);

    final coords = DhakaLocationService.to.currentCoordinates.value;

    await DhakaTrafficService.to.submitReport(
      title: title,
      roadName: road,
      areaName: DhakaLocationService.to.currentLocationName.value,
      description: desc.isNotEmpty ? desc : 'কমিউনিটি ব্যবহারকারী কর্তৃক প্রদত্ত ট্রাফিক আপডেট।',
      category: _selectedCategory,
      severity: _selectedSeverity,
      lat: coords.latitude,
      lng: coords.longitude,
    );

    if (!mounted) return;
    setState(() => _isSubmitting = false);
    Navigator.of(context).pop();

    Get.snackbar(
      'ধন্যবাদ!',
      'আপনার ট্রাফিক রিপোর্ট সফলভাবে যুক্ত হয়েছে এবং ম্যাপে প্রদর্শিত হচ্ছে।',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF0F172A),
      colorText: Colors.white,
      icon: const Icon(Icons.check_circle_rounded, color: Color(0xFF10B981)),
      duration: const Duration(seconds: 4),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        left: 20,
        right: 20,
        top: 20,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 44,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEF4444).withOpacity(0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.add_location_alt_rounded, color: Color(0xFFEF4444), size: 22),
                ),
                const SizedBox(width: 12),
                const Text(
                  'ট্রাফিক আপডেট রিপোর্ট করুন',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),

            // Category Selector
            const Text(
              'সমস্যার ধরন নির্বাচন করুন:',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF475569)),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: DhakaTrafficCategory.values.map((cat) {
                final isSelected = _selectedCategory == cat;
                return ChoiceChip(
                  label: Text(_getCatName(cat)),
                  selected: isSelected,
                  selectedColor: const Color(0xFF1E88E5),
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : const Color(0xFF334155),
                    fontSize: 12,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                  backgroundColor: const Color(0xFFF1F5F9),
                  onSelected: (val) {
                    if (val) setState(() => _selectedCategory = cat);
                  },
                );
              }).toList(),
            ),

            const SizedBox(height: 16),

            // Severity Level Selector
            const Text(
              'যানজট বা পরিস্থিতির তীব্রতা:',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF475569)),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: DhakaTrafficSeverity.values.map((sev) {
                final isSelected = _selectedSeverity == sev;
                final color = _getSevColor(sev);
                return ChoiceChip(
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(color: isSelected ? Colors.white : color, shape: BoxShape.circle),
                      ),
                      const SizedBox(width: 6),
                      Text(_getSevName(sev)),
                    ],
                  ),
                  selected: isSelected,
                  selectedColor: color,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : const Color(0xFF334155),
                    fontSize: 12,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                  backgroundColor: const Color(0xFFF1F5F9),
                  onSelected: (val) {
                    if (val) setState(() => _selectedSeverity = sev);
                  },
                );
              }).toList(),
            ),

            const SizedBox(height: 16),

            // Road / Area Input
            const Text(
              'সড়ক / এলাকা / মোড়:*',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF475569)),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: _roadController,
              decoration: InputDecoration(
                hintText: 'যেমন: বিজয় সরণি মোড়, রোকেয়া সরণি',
                filled: true,
                fillColor: const Color(0xFFF8FAFC),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              ),
            ),

            const SizedBox(height: 14),

            // Short Description
            const Text(
              'বিস্তারিত বিবরণ (ঐচ্ছিক):',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF475569)),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: _descController,
              maxLines: 2,
              decoration: InputDecoration(
                hintText: 'কেমন সময় লাগছে বা কোনো বিকল্প রাস্তা আছে কি না...',
                filled: true,
                fillColor: const Color(0xFFF8FAFC),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              ),
            ),

            const SizedBox(height: 20),

            // Submit Button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: _isSubmitting ? null : _submit,
                icon: _isSubmitting
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      )
                    : const Icon(Icons.send_rounded, size: 18),
                label: Text(
                  _isSubmitting ? 'জমা দেওয়া হচ্ছে...' : 'রিপোর্ট প্রকাশ করুন',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E88E5),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  elevation: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getCatName(DhakaTrafficCategory cat) {
    switch (cat) {
      case DhakaTrafficCategory.congestion:
        return 'যানজট';
      case DhakaTrafficCategory.accident:
        return 'দুর্ঘটনা';
      case DhakaTrafficCategory.breakdown:
        return 'গাড়ি বিকল';
      case DhakaTrafficCategory.waterlogging:
        return 'জলাবদ্ধতা';
      case DhakaTrafficCategory.construction:
        return 'রাস্তা সংস্কার';
      case DhakaTrafficCategory.vipMovement:
        return 'ভিআইপি মুভমেন্ট';
      case DhakaTrafficCategory.rally:
        return 'সমাবেশ/মিছিল';
    }
  }

  String _getSevName(DhakaTrafficSeverity sev) {
    switch (sev) {
      case DhakaTrafficSeverity.clear:
        return 'হালকা / ক্লিয়ার';
      case DhakaTrafficSeverity.moderate:
        return 'মাঝারি জ্যাম';
      case DhakaTrafficSeverity.slow:
        return 'ধীরগতি';
      case DhakaTrafficSeverity.severe:
        return 'তীব্র যানজট';
      case DhakaTrafficSeverity.closed:
        return 'রাস্তা বন্ধ';
    }
  }

  Color _getSevColor(DhakaTrafficSeverity sev) {
    switch (sev) {
      case DhakaTrafficSeverity.clear:
        return const Color(0xFF10B981);
      case DhakaTrafficSeverity.moderate:
        return const Color(0xFFEAB308);
      case DhakaTrafficSeverity.slow:
        return const Color(0xFFF97316);
      case DhakaTrafficSeverity.severe:
        return const Color(0xFFEF4444);
      case DhakaTrafficSeverity.closed:
        return const Color(0xFF64748B);
    }
  }
}
