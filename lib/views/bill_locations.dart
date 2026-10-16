import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/nu_location_model.dart';
import '../services/nu_location_service.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final NuLocationService _locationService = NuLocationService.to;
  final TextEditingController _searchController = TextEditingController();
  List<NuLocationItem> _filteredLocations = [];

  @override
  void initState() {
    super.initState();
    _filteredLocations = _locationService.locations;
    _locationService.fetchLocations().then((_) {
      if (mounted) {
        setState(() {
          _filteredLocations = _locationService.locations;
        });
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _runFilter(String query) {
    if (query.trim().isEmpty) {
      setState(() {
        _filteredLocations = _locationService.locations;
      });
    } else {
      setState(() {
        _filteredLocations = _locationService.search(query);
      });
    }
  }

  void _showLocationDetailsModal(BuildContext context, NuLocationItem item) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE0F2FE),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.location_on, color: Color(0xFF0284C7), size: 24),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.placeName,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                          ),
                          Text(
                            'জেলা: ${item.district}',
                            style: const TextStyle(fontSize: 13, color: Color(0xFF64748B)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(ctx),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.directions_car, color: Color(0xFF2563EB), size: 20),
                    const SizedBox(width: 10),
                    const Text(
                      'গাজীপুর সদর থেকে দূরত্ব:',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                    ),
                    const Spacer(),
                    Text(
                      '${item.distanceKm} কিমি',
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF2563EB)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'ভাতা ও ট্যুর বিল স্কেল (জাতীয় বিশ্ববিদ্যালয়)',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
              ),
              const SizedBox(height: 10),
              _buildBillRow('ক্যাটাগরি ১ (গ্রেড ১):', '৳ ${item.cat1Grade1Bill}', const Color(0xFFDC2626)),
              _buildBillRow('ক্যাটাগরি ১ (গ্রেড ২-৩):', '৳ ${item.cat1Grade23Bill}', const Color(0xFFEA580C)),
              _buildBillRow('ক্যাটাগরি ১ (গ্রেড ৪-৫):', '৳ ${item.cat1Grade45Bill}', const Color(0xFFD97706)),
              _buildBillRow('ক্যাটাগরি ২ (গ্রেড ৬-৭):', '৳ ${item.cat2Grade67Bill}', const Color(0xFF059669)),
              _buildBillRow('ক্যাটাগরি ২ (গ্রেড ৮-১০):', '৳ ${item.cat2Grade810Bill}', const Color(0xFF0D9488)),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(ctx),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E88E5),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('ঠিক আছে', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBillRow(String label, String amount, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 13, color: Color(0xFF334155))),
          Text(amount, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('লোকেশন ও দূরত্ব (Tour Bills)'),
        elevation: 0.5,
        backgroundColor: Colors.white,
      ),
      body: Obx(() {
        if (_locationService.isLoading.value && _filteredLocations.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                onChanged: _runFilter,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
                  hintText: 'স্থান বা জেলা খুঁজুন (যেমন: বরগুনা, আমতলী)...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _searchController.clear();
                            _runFilter('');
                          },
                        )
                      : null,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'মোট স্থান: ${_filteredLocations.length} টি',
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF475569), fontSize: 13),
                  ),
                  const Text(
                    'ক্লিক করে বিল বিস্তারিত দেখুন',
                    style: TextStyle(color: Color(0xFF64748B), fontSize: 11),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Expanded(
                child: _filteredLocations.isNotEmpty
                    ? ListView.separated(
                        itemCount: _filteredLocations.length,
                        separatorBuilder: (context, _) => const SizedBox(height: 8),
                        itemBuilder: (context, index) {
                          final item = _filteredLocations[index];
                          return Card(
                            elevation: 0.5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                              side: const BorderSide(color: Color(0xFFE2E8F0)),
                            ),
                            child: ListTile(
                              onTap: () => _showLocationDetailsModal(context, item),
                              leading: Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEEF2FF),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Center(
                                  child: Icon(Icons.location_on, color: Color(0xFF4F46E5), size: 22),
                                ),
                              ),
                              title: Text(
                                item.placeName,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF0F172A)),
                              ),
                              subtitle: Text(
                                'জেলা: ${item.district} • দূরত্ব: ${item.distanceKm} কিমি',
                                style: const TextStyle(color: Color(0xFF64748B), fontSize: 12),
                              ),
                              trailing: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFECFDF5),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  '৳${item.cat1Grade1Bill}',
                                  style: const TextStyle(color: Color(0xFF059669), fontWeight: FontWeight.bold, fontSize: 12),
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.location_off, size: 48, color: Color(0xFF94A3B8)),
                            const SizedBox(height: 12),
                            const Text(
                              'কোনো ফলাফল পাওয়া যায়নি',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF334155)),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              '"${_searchController.text}" সম্পর্কিত কোনো তথ্য নেই।',
                              style: const TextStyle(color: Color(0xFF64748B), fontSize: 13),
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
