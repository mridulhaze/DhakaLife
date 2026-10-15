import 'package:flutter/material.dart';
import '../models/dhaka_life_models.dart';
import '../services/dhaka_data_service.dart';

class DhakaBusMetroScreen extends StatefulWidget {
  const DhakaBusMetroScreen({Key? key}) : super(key: key);

  @override
  State<DhakaBusMetroScreen> createState() => _DhakaBusMetroScreenState();
}

class _DhakaBusMetroScreenState extends State<DhakaBusMetroScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<DhakaMetroStation> _metroStations = DhakaDataService.getMetroStations();
  final List<DhakaBusRoute> _allBusRoutes = DhakaDataService.getBusRoutes();
  List<DhakaBusRoute> _filteredBusRoutes = [];
  String _busSearchQuery = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _filteredBusRoutes = _allBusRoutes;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onSearchBus(String query) {
    setState(() {
      _busSearchQuery = query;
      if (query.trim().isEmpty) {
        _filteredBusRoutes = _allBusRoutes;
      } else {
        _filteredBusRoutes = _allBusRoutes.where((route) {
          final q = query.toLowerCase();
          return route.busNameBn.toLowerCase().contains(q) ||
              route.routeBn.toLowerCase().contains(q) ||
              route.startPoint.toLowerCase().contains(q) ||
              route.endPoint.toLowerCase().contains(q) ||
              route.keyStopsBn.any((stop) => stop.toLowerCase().contains(q));
        }).toList();
      }
    });
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
          'পাবলিক ট্রান্সপোর্ট গাইড (Transport)',
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: const Color(0xFF1E88E5),
          unselectedLabelColor: const Color(0xFF64748B),
          indicatorColor: const Color(0xFF1E88E5),
          indicatorWeight: 3,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          tabs: const [
            Tab(icon: Icon(Icons.train_rounded), text: 'মেট্রোরেল (Line-6)'),
            Tab(icon: Icon(Icons.directions_bus_filled_rounded), text: 'বাস রুটসমূহ'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Metro Rail Tab
          _buildMetroTab(),
          // Bus Routes Tab
          _buildBusTab(),
        ],
      ),
    );
  }

  Widget _buildMetroTab() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16),
      children: [
        // MRT Info Banner
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF00897B), Color(0xFF004D40)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF00897B).withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ঢাকা মেট্রোরেল (MRT Line-6)',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Icon(Icons.directions_transit, color: Colors.white, size: 24),
                ],
              ),
              SizedBox(height: 6),
              Text(
                'উত্তরা উত্তর ↔ মতিঝিল (মোট ১৬টি স্টেশন)',
                style: TextStyle(color: Color(0xFFB2DFDB), fontSize: 13),
              ),
              SizedBox(height: 4),
              Text(
                'চলাচলের সময়: সকাল ৭:১০ - রাত ৯:৪০ (শুক্রবার বন্ধ)',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
        ),

        const SizedBox(height: 18),
        const Text(
          'সকল স্টেশনের তালিকা ও ভাড়া',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E293B),
          ),
        ),
        const SizedBox(height: 10),

        ..._metroStations.map((station) {
          final isStart = station.stationNo == 1;
          final isEnd = station.stationNo == 16;
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: (isStart || isEnd) ? const Color(0xFF00897B) : const Color(0xFFF1F5F9),
                width: (isStart || isEnd) ? 1.5 : 1.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: (isStart || isEnd) ? const Color(0xFF00897B) : const Color(0xFFE0F2F1),
                  child: Text(
                    '${station.stationNo}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: (isStart || isEnd) ? Colors.white : const Color(0xFF004D40),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        station.nameBn,
                        style: const TextStyle(
                          fontSize: 14.5,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                      Text(
                        '${station.nameEn} • ${station.locationArea}',
                        style: const TextStyle(fontSize: 11.5, color: Color(0xFF64748B)),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      station.fareFromUttaraNorth == 0 ? 'প্রারম্ভিক' : '৳${station.fareFromUttaraNorth}',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: station.fareFromUttaraNorth == 0 ? const Color(0xFF00897B) : const Color(0xFFE53935),
                      ),
                    ),
                    Text(
                      station.travelTime,
                      style: const TextStyle(fontSize: 10.5, color: Color(0xFF94A3B8)),
                    ),
                  ],
                ),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }

  Widget _buildBusTab() {
    return Column(
      children: [
        // Bus Search Bar
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: TextField(
            onChanged: _onSearchBus,
            decoration: InputDecoration(
              hintText: 'বাসের নাম বা এলাকা খুঁজুন (যেমন: মিরপুর, ফার্মগেট)...',
              hintStyle: const TextStyle(fontSize: 13, color: Color(0xFF94A3B8)),
              prefixIcon: const Icon(Icons.search, color: Color(0xFF64748B), size: 20),
              suffixIcon: _busSearchQuery.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear, size: 18),
                      onPressed: () => _onSearchBus(''),
                    )
                  : null,
              filled: true,
              fillColor: const Color(0xFFF8FAFC),
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
              ),
            ),
          ),
        ),

        Expanded(
          child: _filteredBusRoutes.isEmpty
              ? const Center(
                  child: Text(
                    'কোনো বাস রুট খুঁজে পাওয়া যায়নি',
                    style: TextStyle(color: Color(0xFF64748B)),
                  ),
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  itemCount: _filteredBusRoutes.length,
                  itemBuilder: (context, index) {
                    final route = _filteredBusRoutes[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(14),
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
                              Text(
                                route.busNameBn,
                                style: const TextStyle(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1E293B),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE3F2FD),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  'ভাড়া: ${route.fareRange}',
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1565C0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.route, color: Color(0xFF00897B), size: 16),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  route.routeBn,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                    color: Color(0xFF334155),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 6,
                            runSpacing: 4,
                            children: route.keyStopsBn.map((stop) {
                              return Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF8FAFC),
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(color: const Color(0xFFE2E8F0)),
                                ),
                                child: Text(
                                  stop,
                                  style: const TextStyle(fontSize: 11, color: Color(0xFF64748B)),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
