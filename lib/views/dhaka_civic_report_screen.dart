import 'package:flutter/material.dart';
import '../models/dhaka_life_models.dart';
import '../services/dhaka_data_service.dart';

class DhakaCivicReportScreen extends StatefulWidget {
  const DhakaCivicReportScreen({Key? key}) : super(key: key);

  @override
  State<DhakaCivicReportScreen> createState() => _DhakaCivicReportScreenState();
}

class _DhakaCivicReportScreenState extends State<DhakaCivicReportScreen> {
  final List<DhakaCivicReport> _reports = List.from(DhakaDataService.getCivicReports());

  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _locationController = TextEditingController();
  String _selectedCategory = 'সড়ক ও ফুটপাত';

  final List<String> _categories = [
    'সড়ক ও ফুটপাত',
    'জলাবদ্ধতা ও ড্রেন',
    'আবর্জনা ও পরিচ্ছন্নতা',
    'স্ট্রিট লাইট ও বাতি',
    'অন্যান্য নাগরিক সমস্যা'
  ];

  void _showNewReportDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'নাগরিক সমস্যা রিপোর্ট করুন',
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text('সমস্যার ধরন', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    const SizedBox(height: 6),
                    DropdownButtonFormField<String>(
                      value: _selectedCategory,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFF8FAFC),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      ),
                      items: _categories.map((c) => DropdownMenuItem(value: c, child: Text(c, style: const TextStyle(fontSize: 13)))).toList(),
                      onChanged: (val) {
                        if (val != null) setModalState(() => _selectedCategory = val);
                      },
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: 'সমস্যার সংক্ষিপ্ত শিরোনাম',
                        hintText: 'যেমন: ম্যানহোলের ঢাকনা ভাঙা',
                        filled: true,
                        fillColor: const Color(0xFFF8FAFC),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _locationController,
                      decoration: InputDecoration(
                        labelText: 'সঠিক স্থান বা এলাকা',
                        hintText: 'যেমন: মিরপুর ১০, বাড়ি নং...',
                        filled: true,
                        fillColor: const Color(0xFFF8FAFC),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _descController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: 'বিস্তারিত বিবরণ',
                        hintText: 'সমস্যার বিস্তারিত বিবরণ লিখুন...',
                        filled: true,
                        fillColor: const Color(0xFFF8FAFC),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(height: 18),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1E88E5),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        ),
                        icon: const Icon(Icons.send_rounded),
                        label: const Text('রিপোর্ট জমা দিন', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                        onPressed: () {
                          if (_titleController.text.trim().isEmpty) return;
                          setState(() {
                            _reports.insert(
                              0,
                              DhakaCivicReport(
                                id: 'CR-${1043 + _reports.length}',
                                titleBn: _titleController.text.trim(),
                                categoryBn: _selectedCategory,
                                locationBn: _locationController.text.trim().isEmpty ? 'ঢাকা' : _locationController.text.trim(),
                                date: 'আজকে (নতুন)',
                                statusBn: 'পর্যালোচনাধীন (Under Review)',
                                statusColor: const Color(0xFFF57C00),
                                descriptionBn: _descController.text.trim(),
                              ),
                            );
                          });
                          _titleController.clear();
                          _descController.clear();
                          _locationController.clear();
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('আপনার নাগরিক রিপোর্টটি সফলভাবে জমা হয়েছে!'),
                              backgroundColor: Color(0xFF388E3C),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
          'নাগরিক সমস্যা ও সমাধান (Civic)',
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF1E88E5),
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('রিপোর্ট করুন', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        onPressed: _showNewReportDialog,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFBFDBFE)),
            ),
            child: Row(
              children: const [
                Icon(Icons.report_problem_outlined, color: Color(0xFF1E88E5), size: 26),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'রাস্তার গর্ত, ড্রেন, ময়লা বা বাতির সমস্যা রিপোর্ট করে ঢাকাকে আরও সুন্দর ও বাসযোগ্য রাখতে সাহায্য করুন।',
                    style: TextStyle(fontSize: 12.5, color: Color(0xFF1E3A8A), height: 1.4),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            'সাম্প্রতিক নাগরিক রিপোর্টসমূহ',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
          ),
          const SizedBox(height: 10),

          ..._reports.map((report) {
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F5F9),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          report.id,
                          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF475569)),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: report.statusColor.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          report.statusBn,
                          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: report.statusColor),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    report.titleBn,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14.5, color: Color(0xFF1E293B)),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    report.descriptionBn,
                    style: const TextStyle(fontSize: 12.5, color: Color(0xFF64748B), height: 1.3),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 14, color: Color(0xFF94A3B8)),
                      const SizedBox(width: 4),
                      Text(report.locationBn, style: const TextStyle(fontSize: 11.5, color: Color(0xFF94A3B8))),
                      const Spacer(),
                      Text(report.date, style: const TextStyle(fontSize: 11.5, color: Color(0xFF94A3B8))),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
