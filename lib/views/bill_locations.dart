import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
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
  String _currentQuery = '';

  @override
  void initState() {
    super.initState();
    _filteredLocations = _locationService.locations;
    // Listen to changes in the reactive list from NuLocationService
    _locationService.locations.listen((locs) {
      if (mounted) {
        setState(() {
          _filteredLocations = _locationService.searchLocations(_currentQuery);
        });
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _runFilter(String enteredKeyword) {
    setState(() {
      _currentQuery = enteredKeyword;
      _filteredLocations = _locationService.searchLocations(enteredKeyword);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF0F172A), size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'লোকেশন ও ট্যুর বিল (Locations & Bills)',
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(PhosphorIconsFill.arrowsClockwise, color: Color(0xFF1E88E5), size: 22),
            tooltip: 'রিফ্রেশ ও সিঙ্ক',
            onPressed: () async {
              await _locationService.fetchLocationsFromFirestore();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('ফায়ারবেস ক্লাউড থেকে তথ্য আপডেট করা হয়েছে'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Top Search & Status Banner
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: Colors.white,
            child: Column(
              children: [
                // Search Input Field
                TextField(
                  controller: _searchController,
                  onChanged: _runFilter,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
                    hintText: 'স্থান বা জেলা খুঁজুন (যেমন: Amtali, Barguna)...',
                    hintStyle: const TextStyle(fontSize: 13, color: Color(0xFF94A3B8)),
                    prefixIcon: const Icon(PhosphorIconsFill.magnifyingGlass, color: Color(0xFF64748B), size: 18),
                    suffixIcon: _currentQuery.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear, color: Color(0xFF94A3B8), size: 18),
                            onPressed: () {
                              _searchController.clear();
                              _runFilter('');
                            },
                          )
                        : null,
                    filled: true,
                    fillColor: const Color(0xFFF1F5F9),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Data Source & Status Pill
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() {
                      final count = _filteredLocations.length;
                      return Text(
                        'মোট $count টি লোকেশন পাওয়া গেছে',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF64748B),
                        ),
                      );
                    }),
                    Obx(() {
                      final isOffline = _locationService.isOffline.value;
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: isOffline ? const Color(0xFFFEF3C7) : const Color(0xFFDCFCE7),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              isOffline ? PhosphorIconsFill.hardDrive : PhosphorIconsFill.cloudCheck,
                              size: 13,
                              color: isOffline ? const Color(0xFFD97706) : const Color(0xFF16A34A),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              isOffline ? 'অফলাইন ক্যাশড' : 'ফায়ারবেস লাইভ',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: isOffline ? const Color(0xFFB45309) : const Color(0xFF15803D),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Locations List
          Expanded(
            child: Obx(() {
              if (_locationService.isLoading.value && _locationService.locations.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              if (_filteredLocations.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.location_off_rounded, size: 54, color: Color(0xFF94A3B8)),
                        const SizedBox(height: 14),
                        const Text(
                          'কোন লোকেশন পাওয়া যায়নি',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF334155)),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          'বানান চেক করে আবার সার্চ করুন',
                          style: TextStyle(fontSize: 13, color: Color(0xFF64748B)),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return RefreshIndicator(
                onRefresh: () => _locationService.fetchLocationsFromFirestore(),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  itemCount: _filteredLocations.length,
                  itemBuilder: (context, index) {
                    final item = _filteredLocations[index];
                    return _buildLocationCard(context, item);
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationCard(BuildContext context, NuLocationItem item) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => _showLocationDetailsModal(context, item),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: [
                // Pin Avatar
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8EAF6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Icon(
                      PhosphorIconsFill.mapPin,
                      color: Color(0xFF3949AB),
                      size: 22,
                    ),
                  ),
                ),
                const SizedBox(width: 14),

                // Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              item.places,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0F172A),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF1F5F9),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              item.district,
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF475569),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(PhosphorIconsFill.compass, size: 14, color: Colors.blueGrey.shade400),
                          const SizedBox(width: 4),
                          Text(
                            '${item.gazipurSadarKm} কিমি (গাজীপুর থেকে)',
                            style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                          ),
                          const SizedBox(width: 10),
                          Icon(PhosphorIconsFill.money, size: 14, color: const Color(0xFF16A34A)),
                          const SizedBox(width: 4),
                          Text(
                            'গ্রেড-১: ৳${item.cat1Grade1Bill}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF16A34A),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward_ios, size: 14, color: Color(0xFF94A3B8)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showLocationDetailsModal(BuildContext context, NuLocationItem item) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext ctx) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Handle Pill
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Title Header
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8EAF6),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(PhosphorIconsFill.mapPin, color: Color(0xFF3949AB), size: 24),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.places,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                        ),
                        Text(
                          'জেলা: ${item.district} • দূরত্ব: ${item.gazipurSadarKm} কিমি',
                          style: const TextStyle(fontSize: 13, color: Color(0xFF64748B)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              const Text(
                'ট্যুর বিল ও ভাতা গ্রেড বিবরণী (Tour Bill Allowance):',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
              const SizedBox(height: 12),

              // Grade Details Cards
              _buildBillRow('ক্যাটাগরি-১ (গ্রেড ১)', item.cat1Grade1Bill, const Color(0xFF15803D)),
              _buildBillRow('ক্যাটাগরি-১ (গ্রেড ২-৩)', item.cat1Grade2To3Bill, const Color(0xFF0284C7)),
              _buildBillRow('ক্যাটাগরি-১ (গ্রেড ৪-৫)', item.cat1Grade4To5Bill, const Color(0xFF4F46E5)),
              _buildBillRow('ক্যাটাগরি-২ (গ্রেড ৬-৭)', item.cat2Grade6To7Bill, const Color(0xFFD97706)),
              _buildBillRow('ক্যাটাগরি-২ (গ্রেড ৮-১০)', item.cat2Grade8To10Bill, const Color(0xFFE11D48)),

              const SizedBox(height: 20),

              // Close Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E88E5),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text(
                    'ঠিক আছে',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBillRow(String gradeTitle, int amount, Color accentColor) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            gradeTitle,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF334155)),
          ),
          Text(
            '৳$amount',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: accentColor),
          ),
        ],
      ),
    );
  }
}
