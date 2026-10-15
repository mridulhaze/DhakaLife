import 'package:flutter/material.dart';
import '../models/dhaka_life_models.dart';
import '../services/dhaka_data_service.dart';

class DhakaBazarScreen extends StatefulWidget {
  const DhakaBazarScreen({Key? key}) : super(key: key);

  @override
  State<DhakaBazarScreen> createState() => _DhakaBazarScreenState();
}

class _DhakaBazarScreenState extends State<DhakaBazarScreen> {
  final List<DhakaBazarItem> _allItems = DhakaDataService.getBazarPrices();
  List<DhakaBazarItem> _displayedItems = [];
  String _selectedCategory = 'সব';
  String _searchQuery = '';

  final List<String> _categories = ['সব', 'চাল ও ডাল', 'সবজি ও মশলা', 'প্রোটিন', 'তেল ও চিনি'];

  @override
  void initState() {
    super.initState();
    _displayedItems = _allItems;
  }

  void _applyFilter() {
    setState(() {
      _displayedItems = _allItems.where((item) {
        final matchesCat = (_selectedCategory == 'সব') || (item.category == _selectedCategory);
        final matchesQuery = _searchQuery.isEmpty ||
            item.nameBn.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            item.nameEn.toLowerCase().contains(_searchQuery.toLowerCase());
        return matchesCat && matchesQuery;
      }).toList();
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
          'দৈনিক বাজার দর (Bazar Prices)',
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: Column(
        children: [
          // Search & Market info header
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              children: [
                TextField(
                  onChanged: (val) {
                    _searchQuery = val;
                    _applyFilter();
                  },
                  decoration: InputDecoration(
                    hintText: 'পণ্যের নাম দিয়ে খুঁজুন (যেমন: চাল, ডিম, পেঁয়াজ)...',
                    hintStyle: const TextStyle(fontSize: 13, color: Color(0xFF94A3B8)),
                    prefixIcon: const Icon(Icons.search, color: Color(0xFF64748B), size: 20),
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
                const SizedBox(height: 10),
                // Category Pills
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: _categories.map((cat) {
                      final isSelected = _selectedCategory == cat;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(
                          label: Text(
                            cat,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              color: isSelected ? Colors.white : const Color(0xFF475569),
                            ),
                          ),
                          selected: isSelected,
                          selectedColor: const Color(0xFF1E88E5),
                          backgroundColor: const Color(0xFFF1F5F9),
                          onSelected: (selected) {
                            if (selected) {
                              setState(() {
                                _selectedCategory = cat;
                                _applyFilter();
                              });
                            }
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),

          // Freshness notice
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: const Color(0xFFFEF3C7),
            child: Row(
              children: const [
                Icon(Icons.info_outline, size: 16, color: Color(0xFFB45309)),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'ঢাকার প্রধান পাইকারি ও খুচরা বাজারের নির্দেশক খুচরা মূল্য তালিকা',
                    style: TextStyle(fontSize: 11.5, color: Color(0xFFB45309), fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),

          // Bazar items list
          Expanded(
            child: _displayedItems.isEmpty
                ? const Center(
                    child: Text('কোনো পণ্য খুঁজে পাওয়া যায়নি', style: TextStyle(color: Color(0xFF64748B))),
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(16),
                    itemCount: _displayedItems.length,
                    itemBuilder: (context, index) {
                      final item = _displayedItems[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: const Color(0xFFF1F5F9)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.02),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.nameBn,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Color(0xFF1E293B),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF1F5F9),
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                          item.category,
                                          style: const TextStyle(fontSize: 10.5, color: Color(0xFF64748B)),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        item.marketName,
                                        style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '৳${item.currentPrice.toStringAsFixed(0)} / ${item.unitBn}',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1E293B),
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (item.isPriceUp) ...[
                                      const Icon(Icons.arrow_drop_up, color: Color(0xFFE53935), size: 16),
                                      Text(
                                        '+৳${(item.currentPrice - item.previousPrice).toStringAsFixed(0)}',
                                        style: const TextStyle(fontSize: 11, color: Color(0xFFE53935), fontWeight: FontWeight.bold),
                                      ),
                                    ] else if (item.isPriceDown) ...[
                                      const Icon(Icons.arrow_drop_down, color: Color(0xFF43A047), size: 16),
                                      Text(
                                        '-৳${(item.previousPrice - item.currentPrice).toStringAsFixed(0)}',
                                        style: const TextStyle(fontSize: 11, color: Color(0xFF43A047), fontWeight: FontWeight.bold),
                                      ),
                                    ] else ...[
                                      const Text(
                                        'অপরিবর্তিত',
                                        style: TextStyle(fontSize: 10.5, color: Color(0xFF94A3B8)),
                                      ),
                                    ],
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
