import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import '../../models/dhaka_traffic_model.dart';
import '../../services/dhaka_location_service.dart';
import '../../services/dhaka_traffic_service.dart';
import 'submit_traffic_report_dialog.dart';

class DhakaTrafficScreen extends StatefulWidget {
  const DhakaTrafficScreen({Key? key}) : super(key: key);

  @override
  State<DhakaTrafficScreen> createState() => _DhakaTrafficScreenState();
}

class _DhakaTrafficScreenState extends State<DhakaTrafficScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final MapController _mapController = MapController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _centerToUserLocation() {
    final userCoords = DhakaLocationService.to.currentCoordinates.value;
    _mapController.move(userCoords, 14.5);
  }

  void _showReportDetailsModal(DhakaTrafficReport report) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildDetailSheet(report),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'লাইভ ট্রাফিক ও রুট আপডেট',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF0F172A),
        elevation: 0.5,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded, color: Color(0xFF1E88E5)),
            tooltip: 'তাজা করুন',
            onPressed: () {
              DhakaTrafficService.to.loadReports();
              Get.snackbar(
                'আপডেট',
                'ট্রাফিক তথ্য রিফ্রেশ করা হয়েছে',
                snackPosition: SnackPosition.BOTTOM,
                duration: const Duration(seconds: 2),
              );
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: const Color(0xFF1E88E5),
          unselectedLabelColor: const Color(0xFF64748B),
          indicatorColor: const Color(0xFF1E88E5),
          indicatorWeight: 3,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          tabs: const [
            Tab(icon: Icon(Icons.map_rounded, size: 20), text: 'ম্যাপ ভিউ'),
            Tab(icon: Icon(Icons.view_list_rounded, size: 20), text: 'তাজা রিপোর্ট'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => SubmitTrafficReportDialog.show(context),
        backgroundColor: const Color(0xFFEF4444),
        foregroundColor: Colors.white,
        elevation: 4,
        icon: const Icon(Icons.add_location_alt_rounded, size: 20),
        label: const Text(
          'রিপোর্ট দিন',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildMapTab(),
          _buildListTab(),
        ],
      ),
    );
  }

  Widget _buildMapTab() {
    return Obx(() {
      final reports = DhakaTrafficService.to.reports;
      final userCoords = DhakaLocationService.to.currentCoordinates.value;

      return Stack(
        children: [
          // FlutterMap Tile Engine
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              center: userCoords,
              zoom: 12.5,
              maxZoom: 18.0,
              minZoom: 9.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.ais_nu.dhakalife',
              ),

              // Incident Markers
              MarkerLayer(
                markers: [
                  // User Current Location Blue Pulse Marker
                  Marker(
                    point: userCoords,
                    width: 48,
                    height: 48,
                    builder: (context) => Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF2563EB).withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: const Color(0xFF2563EB),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Traffic Point Markers
                  ...reports.map((report) {
                    return Marker(
                      point: LatLng(report.latitude, report.longitude),
                      width: 44,
                      height: 44,
                      builder: (context) => GestureDetector(
                        onTap: () => _showReportDetailsModal(report),
                        child: Container(
                          decoration: BoxDecoration(
                            color: report.severityColor,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2.5),
                            boxShadow: [
                              BoxShadow(
                                color: report.severityColor.withOpacity(0.45),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Icon(
                              report.categoryIcon,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ],
          ),

          // Map Severity Guide Badge (Top Left)
          Positioned(
            top: 12,
            left: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.92),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _legendDot(const Color(0xFF10B981), 'ক্লিয়ার'),
                  const SizedBox(width: 8),
                  _legendDot(const Color(0xFFEAB308), 'মাঝারি'),
                  const SizedBox(width: 8),
                  _legendDot(const Color(0xFFF97316), 'ধীরগতি'),
                  const SizedBox(width: 8),
                  _legendDot(const Color(0xFFEF4444), 'তীব্র জ্যাম'),
                ],
              ),
            ),
          ),

          // Recenter to Current GPS Button (Top Right)
          Positioned(
            top: 12,
            right: 12,
            child: FloatingActionButton.small(
              heroTag: 'recenter_gps_btn',
              onPressed: _centerToUserLocation,
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF1E88E5),
              elevation: 3,
              tooltip: 'আমার অবস্থান',
              child: const Icon(Icons.my_location_rounded),
            ),
          ),
        ],
      );
    });
  }

  Widget _legendDot(Color color, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold, color: Color(0xFF334155)),
        ),
      ],
    );
  }

  Widget _buildListTab() {
    return Obx(() {
      final reports = DhakaTrafficService.to.filteredReports;

      return Column(
        children: [
          // Filter and Search Header
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.white,
            child: Column(
              children: [
                // Search Input
                TextField(
                  controller: _searchController,
                  onChanged: (val) => DhakaTrafficService.to.searchQuery.value = val,
                  decoration: InputDecoration(
                    hintText: 'রাস্তা বা এলাকা খুঁজুন (যেমন: বিজয় সরণি, ফার্মগেট)...',
                    hintStyle: const TextStyle(fontSize: 13, color: Color(0xFF94A3B8)),
                    prefixIcon: const Icon(Icons.search_rounded, size: 20, color: Color(0xFF64748B)),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.close_rounded, size: 18),
                            onPressed: () {
                              _searchController.clear();
                              DhakaTrafficService.to.searchQuery.value = '';
                            },
                          )
                        : null,
                    filled: true,
                    fillColor: const Color(0xFFF1F5F9),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  ),
                ),
                const SizedBox(height: 10),

                // Severity Filter Chips
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _filterChip('সব', 'all'),
                      const SizedBox(width: 6),
                      _filterChip('তীব্র জ্যাম', DhakaTrafficSeverity.severe.name),
                      const SizedBox(width: 6),
                      _filterChip('মাঝারি', DhakaTrafficSeverity.moderate.name),
                      const SizedBox(width: 6),
                      _filterChip('ধীরগতি', DhakaTrafficSeverity.slow.name),
                      const SizedBox(width: 6),
                      _filterChip('স্বাভাবিক', DhakaTrafficSeverity.clear.name),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Reports List
          Expanded(
            child: reports.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.traffic_rounded, size: 48, color: Colors.grey.shade400),
                        const SizedBox(height: 12),
                        const Text(
                          'কোনো ট্রাফিক রিপোর্ট পাওয়া যায়নি',
                          style: TextStyle(fontSize: 14, color: Color(0xFF64748B), fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(14),
                    itemCount: reports.length,
                    separatorBuilder: (context, _) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final item = reports[index];
                      return _buildReportCard(item);
                    },
                  ),
          ),
        ],
      );
    });
  }

  Widget _filterChip(String label, String value) {
    return Obx(() {
      final isSelected = DhakaTrafficService.to.selectedSeverity.value == value;
      return InkWell(
        onTap: () => DhakaTrafficService.to.selectedSeverity.value = value,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF1E88E5) : const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : const Color(0xFF475569),
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ),
      );
    });
  }

  Widget _buildReportCard(DhakaTrafficReport item) {
    final distKm = DhakaTrafficService.to.calculateDistanceTo(item.latitude, item.longitude);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => _showReportDetailsModal(item),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Row: Category icon + Road & Area + Severity Badge
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: item.severityColor.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(item.categoryIcon, color: item.severityColor, size: 20),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: const TextStyle(
                              fontSize: 13.5,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0F172A),
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            '${item.roadName} • ${item.areaName}',
                            style: const TextStyle(fontSize: 11.5, color: Color(0xFF64748B)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: item.severityColor.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: item.severityColor.withOpacity(0.3)),
                      ),
                      child: Text(
                        item.severityLabel,
                        style: TextStyle(
                          color: item.severityColor,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),
                Text(
                  item.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, color: Color(0xFF334155), height: 1.35),
                ),

                const SizedBox(height: 12),
                const Divider(height: 1, color: Color(0xFFF1F5F9)),
                const SizedBox(height: 8),

                // Footer Row: Distance + Time ago + Confirmations
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.near_me_outlined, size: 13, color: Color(0xFF64748B)),
                        const SizedBox(width: 3),
                        Text(
                          '${distKm.toStringAsFixed(1)} কিমি দূরে',
                          style: const TextStyle(fontSize: 11, color: Color(0xFF64748B)),
                        ),
                        const SizedBox(width: 10),
                        const Icon(Icons.access_time_rounded, size: 13, color: Color(0xFF64748B)),
                        const SizedBox(width: 3),
                        Text(
                          item.timeAgoBengali,
                          style: const TextStyle(fontSize: 11, color: Color(0xFF64748B)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.thumb_up_alt_rounded, size: 13, color: Color(0xFF1E88E5)),
                        const SizedBox(width: 4),
                        Text(
                          '${item.confirmations} জন নিশ্চিত করেছেন',
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E88E5),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailSheet(DhakaTrafficReport report) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(2)),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: report.severityColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(report.categoryIcon, color: report.severityColor, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      report.title,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '${report.roadName} (${report.areaName})',
                      style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'পরিস্থিতি: ${report.severityLabel}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: report.severityColor,
                      ),
                    ),
                    Text(
                      report.timeAgoBengali,
                      style: const TextStyle(fontSize: 11, color: Color(0xFF64748B)),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  report.description,
                  style: const TextStyle(fontSize: 13, color: Color(0xFF334155), height: 1.4),
                ),
                const SizedBox(height: 10),
                Text(
                  'রিপোর্টকারী: ${report.reportedBy}',
                  style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    DhakaTrafficService.to.markCleared(report.id);
                    Navigator.of(context).pop();
                    Get.snackbar(
                      'আপডেট গৃহীত',
                      'রাস্তা ক্লিয়ার হিসেবে চিহ্নিত করা হয়েছে',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                  icon: const Icon(Icons.check_circle_outline_rounded, size: 16),
                  label: const Text('রাস্তা ক্লিয়ার'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF10B981),
                    side: const BorderSide(color: Color(0xFF10B981)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    DhakaTrafficService.to.upvoteReport(report.id);
                    Navigator.of(context).pop();
                    Get.snackbar(
                      'নিশ্চিতকরণ যুক্ত হয়েছে',
                      'আপনার সমর্থন যোগ করা হয়েছে',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                  icon: const Icon(Icons.thumb_up_alt_rounded, size: 16),
                  label: const Text('সঠিক তথ্য'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E88E5),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
