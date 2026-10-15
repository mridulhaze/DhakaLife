import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_project_nutcm_1/models/dhaka_place_model.dart';

class DhakaMapScreen extends StatefulWidget {
  final LatLng? initialCenter;
  final String? initialCategory;

  const DhakaMapScreen({
    Key? key,
    this.initialCenter,
    this.initialCategory,
  }) : super(key: key);

  @override
  State<DhakaMapScreen> createState() => _DhakaMapScreenState();
}

class _DhakaMapScreenState extends State<DhakaMapScreen> {
  late final MapController _mapController;
  late String _selectedCategory;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  DhakaPlace? _selectedPlace;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _selectedCategory = widget.initialCategory ?? 'all';
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<DhakaPlace> get _filteredPlaces {
    return DhakaPlace.verifiedDhakaPlaces.where((p) {
      final matchesCategory = _selectedCategory == 'all' || p.category == _selectedCategory;
      final matchesSearch = _searchQuery.isEmpty ||
          p.nameBn.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          p.nameEn.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          p.addressBn.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  Color _getCategoryColor(String cat) {
    switch (cat) {
      case 'hospital':
        return const Color(0xFFDC2626); // Red
      case 'police':
        return const Color(0xFF2563EB); // Blue
      case 'metro':
        return const Color(0xFF059669); // Green
      case 'fire':
        return const Color(0xFFEA580C); // Orange
      default:
        return const Color(0xFF7C3AED); // Purple
    }
  }

  IconData _getCategoryIcon(String cat) {
    switch (cat) {
      case 'hospital':
        return PhosphorIconsFill.firstAid;
      case 'police':
        return PhosphorIconsFill.shieldStar;
      case 'metro':
        return PhosphorIconsFill.train;
      case 'fire':
        return PhosphorIconsFill.fire;
      default:
        return PhosphorIconsFill.mapPin;
    }
  }

  void _moveToLocation(LatLng target, {double zoom = 14.5}) {
    _mapController.move(target, zoom);
  }

  Future<void> _makeCall(String? phone) async {
    if (phone == null || phone.isEmpty) return;
    final cleanPhone = phone.replaceAll(RegExp(r'[^0-9+]'), '');
    final Uri url = Uri.parse('tel:$cleanPhone');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  Future<void> _openGoogleMapsDirection(double lat, double lng) async {
    final Uri url = Uri.parse('https://www.google.com/maps/dir/?api=1&destination=$lat,$lng');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  void _showPlaceModal(DhakaPlace place) {
    setState(() => _selectedPlace = place);
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) {
        final catColor = _getCategoryColor(place.category);
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Row(
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: catColor.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Center(
                      child: Icon(_getCategoryIcon(place.category), color: catColor, size: 24),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: catColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                place.categoryBn,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: catColor,
                                ),
                              ),
                            ),
                            if (place.isOpen24Hours) ...[
                              const SizedBox(width: 6),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFDCFCE7),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: const Text(
                                  '২৪/৭ খোলা',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF16A34A),
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          place.nameBn,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(PhosphorIconsRegular.mapPin, color: Color(0xFF64748B), size: 16),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      place.addressBn,
                      style: const TextStyle(fontSize: 13, color: Color(0xFF475569)),
                    ),
                  ),
                ],
              ),
              if (place.phone != null) ...[
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(PhosphorIconsRegular.phone, color: Color(0xFF64748B), size: 16),
                    const SizedBox(width: 6),
                    Text(
                      'হটলাইন: ${place.phone!}',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 20),
              Row(
                children: [
                  if (place.phone != null)
                    Expanded(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1E88E5),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          elevation: 0,
                        ),
                        onPressed: () => _makeCall(place.phone),
                        icon: const Icon(PhosphorIconsFill.phoneCall, size: 18),
                        label: const Text('কল করুন', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  if (place.phone != null) const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF059669),
                        side: const BorderSide(color: Color(0xFF059669), width: 1.5),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () => _openGoogleMapsDirection(place.latitude, place.longitude),
                      icon: const Icon(PhosphorIconsFill.navigationArrow, size: 18),
                      label: const Text('ডিরেকশন', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final places = _filteredPlaces;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: const Text(
          'ঢাকা ম্যাপ ও নিকটবর্তী স্থান',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(PhosphorIconsRegular.crosshair, color: Color(0xFF1E88E5)),
            tooltip: 'ঢাকা কেন্দ্রবিন্দু',
            onPressed: () => _moveToLocation(LatLng(23.8103, 90.4125), zoom: 12.5),
          ),
        ],
      ),
      body: Stack(
        children: [
          // OpenStreetMap Layer
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              center: widget.initialCenter ?? LatLng(23.8103, 90.4125),
              zoom: 12.5,
              minZoom: 10,
              maxZoom: 18,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.flutter_project_nutcm_1',
              ),
              MarkerLayer(
                markers: places.map((place) {
                  final catColor = _getCategoryColor(place.category);
                  return Marker(
                    point: LatLng(place.latitude, place.longitude),
                    width: 44,
                    height: 44,
                    builder: (ctx) => GestureDetector(
                      onTap: () => _showPlaceModal(place),
                      child: Container(
                        decoration: BoxDecoration(
                          color: catColor,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2.5),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Icon(
                            _getCategoryIcon(place.category),
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),

          // Top Controls: Search Bar & Category Filter Pills
          Positioned(
            top: 12,
            left: 12,
            right: 12,
            child: Column(
              children: [
                // Search Input Card
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (val) => setState(() => _searchQuery = val),
                    decoration: InputDecoration(
                      hintText: 'হাসপাতাল, থানা বা মেট্রো স্টেশন খুঁজুন...',
                      hintStyle: const TextStyle(fontSize: 13, color: Color(0xFF94A3B8)),
                      prefixIcon: const Icon(Icons.search, color: Color(0xFF1E88E5), size: 20),
                      suffixIcon: _searchQuery.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear, size: 18),
                              onPressed: () {
                                _searchController.clear();
                                setState(() => _searchQuery = '');
                              },
                            )
                          : null,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // Category Chips Row
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      _buildFilterChip('all', 'সব স্থান', PhosphorIconsRegular.squaresFour),
                      _buildFilterChip('hospital', 'হাসপাতাল', PhosphorIconsRegular.firstAid),
                      _buildFilterChip('police', 'থানা / পুলিশ', PhosphorIconsRegular.shieldCheck),
                      _buildFilterChip('metro', 'মেট্রোরেল', PhosphorIconsRegular.train),
                      _buildFilterChip('fire', 'ফায়ার সার্ভিস', PhosphorIconsRegular.fire),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Bottom Quick Jump Badges (Mirpur, Dhanmondi, Gulshan, Uttara, Motijheel)
          Positioned(
            bottom: 16,
            left: 12,
            right: 12,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  _buildJumpButton('মিরপুর-১০', LatLng(23.8070, 90.3686)),
                  _buildJumpButton('ফার্মগেট', LatLng(23.7568, 90.3887)),
                  _buildJumpButton('শাহবাগ', LatLng(23.7389, 90.3957)),
                  _buildJumpButton('ধানমন্ডি', LatLng(23.7465, 90.3762)),
                  _buildJumpButton('গুলশান-২', LatLng(23.7925, 90.4167)),
                  _buildJumpButton('উত্তরা', LatLng(23.8682, 90.4005)),
                  _buildJumpButton('মতিঝিল', LatLng(23.7317, 90.4182)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String catId, String titleBn, IconData icon) {
    final isSelected = _selectedCategory == catId;
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: FilterChip(
        selected: isSelected,
        avatar: Icon(
          icon,
          size: 16,
          color: isSelected ? Colors.white : const Color(0xFF475569),
        ),
        label: Text(
          titleBn,
          style: TextStyle(
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: isSelected ? Colors.white : const Color(0xFF1E293B),
          ),
        ),
        backgroundColor: Colors.white,
        selectedColor: const Color(0xFF1E88E5),
        elevation: 2,
        pressElevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onSelected: (_) => setState(() => _selectedCategory = catId),
      ),
    );
  }

  Widget _buildJumpButton(String nameBn, LatLng coords) {
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        elevation: 3,
        child: InkWell(
          onTap: () => _moveToLocation(coords, zoom: 15.0),
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(PhosphorIconsFill.navigationArrow, size: 14, color: Color(0xFF1E88E5)),
                const SizedBox(width: 5),
                Text(
                  nameBn,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
