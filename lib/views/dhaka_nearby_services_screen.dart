import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/dorkar_models.dart';
import '../services/dorkar_service.dart';
import 'dhaka_map_screen.dart';

class DhakaNearbyServicesScreen extends StatefulWidget {
  const DhakaNearbyServicesScreen({Key? key}) : super(key: key);

  @override
  State<DhakaNearbyServicesScreen> createState() =>
      _DhakaNearbyServicesScreenState();
}

class _DhakaNearbyServicesScreenState extends State<DhakaNearbyServicesScreen>
    with SingleTickerProviderStateMixin {
  final DorkarService _dorkarService = DorkarService.instance;
  final TextEditingController _searchController = TextEditingController();

  String _selectedCategoryId = 'all';
  bool _emergencyOnly = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _dorkarService.init().then((_) {
      if (mounted) setState(() {});
    });
    _dorkarService.selectedArea.addListener(_onAreaChanged);
  }

  void _onAreaChanged() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _dorkarService.selectedArea.removeListener(_onAreaChanged);
    _searchController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  // Launch Phone Call
  Future<void> _callProvider(String phone) async {
    final cleanPhone = phone.replaceAll(RegExp(r'[^0-9+]'), '');
    final Uri url = Uri.parse('tel:$cleanPhone');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      _showSnackbar('ফোন কল ডায়াল করা সম্ভব হয়নি: $phone');
    }
  }

  // Launch WhatsApp Chat
  Future<void> _openWhatsApp(String phone) async {
    var cleaned = phone.replaceAll(RegExp(r'[^0-9]'), '');
    if (cleaned.startsWith('0')) {
      cleaned = '88$cleaned';
    } else if (!cleaned.startsWith('88')) {
      cleaned = '880$cleaned';
    }
    final Uri url = Uri.parse(
        'https://wa.me/$cleaned?text=${Uri.encodeComponent('হ্যালো, ঢাকা লাইফ অ্যাপ থেকে আপনার সাথে যোগাযোগ করছি।')}');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      _showSnackbar('হোয়াটসঅ্যাপ চালু করা সম্ভব হয়নি: $phone');
    }
  }

  void _showSnackbar(String message, {bool isSuccess = false}) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isSuccess ? const Color(0xFF16A34A) : const Color(0xFFE53935),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // Area Selector Modal Sheet
  void _showAreaSelectorSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.72,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'আপনার এলাকা / থানা নির্বাচন করুন',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close_rounded),
                    onPressed: () => Navigator.pop(ctx),
                  ),
                ],
              ),
              const Text(
                'নির্বাচিত এলাকা অনুযায়ী নিকটবর্তী কারিগরদের দূরত্ব স্বয়ংক্রিয়ভাবে হিসাব করা হবে।',
                style: TextStyle(fontSize: 12.5, color: Color(0xFF64748B)),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: DorkarService.dhakaAreas.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final area = DorkarService.dhakaAreas[index];
                    final isSelected =
                        _dorkarService.selectedArea.value.id == area.id;
                    return ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFFEFF6FF)
                              : const Color(0xFFF1F5F9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.location_on_rounded,
                          color: isSelected
                              ? const Color(0xFF1D4ED8)
                              : const Color(0xFF64748B),
                          size: 20,
                        ),
                      ),
                      title: Text(
                        area.nameBn,
                        style: TextStyle(
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.w500,
                          color: isSelected
                              ? const Color(0xFF1D4ED8)
                              : const Color(0xFF1E293B),
                        ),
                      ),
                      subtitle: Text(
                        area.nameEn,
                        style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                      ),
                      trailing: isSelected
                          ? const Icon(Icons.check_circle_rounded,
                              color: Color(0xFF1D4ED8))
                          : null,
                      onTap: () {
                        _dorkarService.setSelectedArea(area);
                        Navigator.pop(ctx);
                        _showSnackbar('${area.nameBn} এলাকা নির্বাচন করা হয়েছে',
                            isSuccess: true);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Add Provider Dialog / Sheet (Crowdsourcing form from Khub-e-Dorkar)
  void _showAddProviderSheet() {
    final nameCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    final whatsappCtrl = TextEditingController();
    final shopCtrl = TextEditingController();
    final expCtrl = TextEditingController(text: '5');
    final toolsCtrl = TextEditingController(text: 'স্ট্যান্ডার্ড কিট ও যন্ত্রপাতি');
    String selectedCatId = 'electrician';
    String selectedAreaId = _dorkarService.selectedArea.value.id;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.88,
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                top: 20,
                left: 20,
                right: 20,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'নতুন বিশ্বস্ত কারিগর যুক্ত করুন',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close_rounded),
                          onPressed: () => Navigator.pop(ctx),
                        ),
                      ],
                    ),
                    const Text(
                      'আপনার পরিচিত কোনো দক্ষ ইলেকট্রিশিয়ান, প্লাম্বার বা মেকানিকের তথ্য যোগ করুন যাতে এলাকার সবাই উপকৃত হতে পারেন।',
                      style: TextStyle(fontSize: 12.5, color: Color(0xFF64748B)),
                    ),
                    const SizedBox(height: 18),

                    // Name
                    _buildTextField(
                      controller: nameCtrl,
                      label: 'কারিগর বা দোকানের নাম *',
                      hint: 'যেমন: রফিক ইলেকট্রিক ওয়ার্কস / মো: রফিকুল ইসলাম',
                      icon: Icons.person_outline_rounded,
                    ),
                    const SizedBox(height: 14),

                    // Category dropdown
                    const Text('পেশা বা সেবার ধরণ *',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF334155))),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8FAFC),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFFCBD5E1)),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedCatId,
                          isExpanded: true,
                          items: DorkarService.categories
                              .where((c) => c.id != 'all')
                              .map((c) => DropdownMenuItem(
                                    value: c.id,
                                    child: Row(
                                      children: [
                                        Icon(c.icon, size: 18, color: c.themeColor),
                                        const SizedBox(width: 10),
                                        Text(c.titleBn,
                                            style: const TextStyle(fontSize: 14)),
                                      ],
                                    ),
                                  ))
                              .toList(),
                          onChanged: (val) {
                            if (val != null) {
                              setModalState(() => selectedCatId = val);
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Area dropdown
                    const Text('এলাকা / থানা *',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF334155))),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8FAFC),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFFCBD5E1)),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedAreaId,
                          isExpanded: true,
                          items: DorkarService.dhakaAreas
                              .map((a) => DropdownMenuItem(
                                    value: a.id,
                                    child: Text(a.nameBn,
                                        style: const TextStyle(fontSize: 14)),
                                  ))
                              .toList(),
                          onChanged: (val) {
                            if (val != null) {
                              setModalState(() => selectedAreaId = val);
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Phone & WhatsApp
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            controller: phoneCtrl,
                            label: 'মোবাইল নম্বর *',
                            hint: '01XXXXXXXXX',
                            icon: Icons.phone_outlined,
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildTextField(
                            controller: whatsappCtrl,
                            label: 'হোয়াটসঅ্যাপ (ঐচ্ছিক)',
                            hint: '01XXXXXXXXX',
                            icon: Icons.chat_bubble_outline_rounded,
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),

                    // Experience & Shop
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            controller: expCtrl,
                            label: 'অভিজ্ঞতা (বছর)',
                            hint: 'যেমন: ৫',
                            icon: Icons.history_edu_rounded,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildTextField(
                            controller: shopCtrl,
                            label: 'দোকান / প্রতিষ্ঠানের নাম',
                            hint: 'যদি থাকে',
                            icon: Icons.storefront_outlined,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),

                    _buildTextField(
                      controller: toolsCtrl,
                      label: 'যন্ত্রপাতি ও কাজের বর্ণনা',
                      hint: 'যেমন: ড্রিল মেশিন, টেস্ট ল্যাম্প, সিড়ি...',
                      icon: Icons.handyman_outlined,
                    ),
                    const SizedBox(height: 24),

                    // Submit Button
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1D4ED8),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () async {
                          if (nameCtrl.text.trim().isEmpty ||
                              phoneCtrl.text.trim().isEmpty) {
                            _showSnackbar('অনুগ্রহ করে নাম এবং মোবাইল নম্বর দিন');
                            return;
                          }

                          final cat = DorkarService.categories
                              .firstWhere((c) => c.id == selectedCatId);
                          final area = DorkarService.dhakaAreas
                              .firstWhere((a) => a.id == selectedAreaId);

                          await _dorkarService.addCommunityProvider(
                            nameBn: nameCtrl.text.trim(),
                            categoryId: selectedCatId,
                            categoryTitleBn: cat.titleBn,
                            phone: phoneCtrl.text.trim(),
                            whatsapp: whatsappCtrl.text.trim().isNotEmpty
                                ? whatsappCtrl.text.trim()
                                : null,
                            shopName: shopCtrl.text.trim().isNotEmpty
                                ? shopCtrl.text.trim()
                                : null,
                            experienceYears:
                                int.tryParse(expCtrl.text.trim()) ?? 5,
                            toolsOrEquipment: toolsCtrl.text.trim(),
                            areaId: selectedAreaId,
                            areaNameBn: area.nameBn,
                          );

                          if (mounted) {
                            Navigator.pop(ctx);
                            setState(() {});
                            _showSnackbar('কারিগর সফলভাবে যুক্ত করা হয়েছে!',
                                isSuccess: true);
                          }
                        },
                        child: const Text(
                          'তালিকায় যুক্ত করুন',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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

  // Provider Detail Sheet (Rich details, call, whatsapp, reviews, request quote)
  void _showProviderDetailSheet(DorkarProvider provider) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            final isFav = _dorkarService.isFavorite(provider.id);
            return Container(
              height: MediaQuery.of(context).size.height * 0.86,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 12),
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
                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(20),
                      children: [
                        // Header Profile
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: provider.iconBgColor,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Icon(provider.icon,
                                  color: provider.iconColor, size: 36),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          provider.nameBn,
                                          style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF0F172A),
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          isFav
                                              ? Icons.favorite_rounded
                                              : Icons.favorite_border_rounded,
                                          color: isFav
                                              ? const Color(0xFFE11D48)
                                              : const Color(0xFF94A3B8),
                                        ),
                                        onPressed: () async {
                                          await _dorkarService
                                              .toggleFavorite(provider.id);
                                          setModalState(() {});
                                          setState(() {});
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Wrap(
                                    spacing: 6,
                                    runSpacing: 6,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 3),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF1F5F9),
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                        child: Text(
                                          provider.categoryTitleBn,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF475569),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      if (provider.isVerified)
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 3),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFDCFCE7),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: const Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(Icons.verified_rounded,
                                                  color: Color(0xFF16A34A),
                                                  size: 13),
                                              SizedBox(width: 3),
                                              Text(
                                                'যাচাইকৃত',
                                                style: TextStyle(
                                                  fontSize: 11.5,
                                                  color: Color(0xFF16A34A),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: [
                                      const Icon(Icons.star_rounded,
                                          color: Color(0xFFEAB308), size: 18),
                                      const SizedBox(width: 4),
                                      Text(
                                        '${provider.rating} (${provider.reviewCount} রিভিউ)',
                                        style: const TextStyle(
                                          fontSize: 12.5,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF334155),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      const Icon(Icons.location_on_outlined,
                                          size: 14, color: Color(0xFF64748B)),
                                      const SizedBox(width: 2),
                                      Text(
                                        _dorkarService
                                            .getFormattedDistance(provider),
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF64748B),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),

                        // Action Buttons: Call & WhatsApp
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF16A34A),
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                icon: const Icon(Icons.call_rounded, size: 20),
                                label: const Text('সরাসরি কল করুন',
                                    style: TextStyle(fontWeight: FontWeight.bold)),
                                onPressed: () => _callProvider(provider.phone),
                              ),
                            ),
                            if (provider.whatsapp != null) ...[
                              const SizedBox(width: 10),
                              Expanded(
                                child: OutlinedButton.icon(
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: const Color(0xFF0F766E),
                                    side: const BorderSide(
                                        color: Color(0xFF14B8A6), width: 1.5),
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  icon: const Icon(
                                      Icons.chat_bubble_outline_rounded,
                                      size: 18),
                                  label: const Text('হোয়াটসঅ্যাপ',
                                      style: TextStyle(fontWeight: FontWeight.bold)),
                                  onPressed: () =>
                                      _openWhatsApp(provider.whatsapp!),
                                ),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Divider(),

                        // Details list
                        _buildDetailRow(
                            'অভিজ্ঞতা', '${provider.experienceYears} বছরের বেশি বাস্তব কাজের অভিজ্ঞতা'),
                        if (provider.shopName != null)
                          _buildDetailRow('দোকান / প্রতিষ্ঠান', provider.shopName!),
                        _buildDetailRow('এলাকা', provider.areaNameBn),
                        _buildDetailRow('আনুমানিক রেট', provider.priceEstimate),
                        _buildDetailRow('টুলস ও সরঞ্জাম', provider.toolsOrEquipment),

                        const SizedBox(height: 16),
                        const Text(
                          'প্রদত্ত সেবাসমূহ (Services Offered)',
                          style: TextStyle(
                            fontSize: 14.5,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                        const SizedBox(height: 8),
                        ...provider.servicesOffered.map((s) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(Icons.check_circle_outline_rounded,
                                      size: 16, color: Color(0xFF16A34A)),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(s,
                                        style: const TextStyle(
                                            fontSize: 13, color: Color(0xFF334155))),
                                  ),
                                ],
                              ),
                            )),

                        const SizedBox(height: 20),
                        const Divider(),

                        // Reviews Section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'গ্রাহকদের রিভিউ (${provider.reviews.length})',
                              style: const TextStyle(
                                fontSize: 14.5,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0F172A),
                              ),
                            ),
                            TextButton.icon(
                              icon: const Icon(Icons.rate_review_outlined, size: 16),
                              label: const Text('রিভিউ দিন'),
                              onPressed: () =>
                                  _showAddReviewDialog(provider, setModalState),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        if (provider.reviews.isEmpty)
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              'এখনো কোনো গ্রাহক লিখিত রিভিউ দেননি। প্রথম রিভিউ দিন!',
                              style:
                                  TextStyle(fontSize: 12.5, color: Color(0xFF94A3B8)),
                            ),
                          )
                        else
                          ...provider.reviews.map((r) => Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF8FAFC),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: const Color(0xFFF1F5F9)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          r.authorName,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            color: Color(0xFF1E293B),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const Icon(Icons.star_rounded,
                                                color: Color(0xFFEAB308), size: 15),
                                            Text(
                                              ' ${r.rating}',
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      r.comment,
                                      style: const TextStyle(
                                          fontSize: 12.5, color: Color(0xFF475569)),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      r.date,
                                      style: const TextStyle(
                                          fontSize: 11, color: Color(0xFF94A3B8)),
                                    ),
                                  ],
                                ),
                              )),

                        const SizedBox(height: 16),
                        // Request Booking Button
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1D4ED8),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 0,
                            ),
                            onPressed: () {
                              Navigator.pop(ctx);
                              _showBookingSheet(
                                initialServiceTitle: provider.categoryTitleBn,
                                providerName: provider.nameBn,
                                estimatedPrice: provider.priceEstimate,
                              );
                            },
                            child: const Text(
                              'সার্ভিস বুকিং বা কোটেশন চান',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF64748B),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E293B),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Add Review Dialog
  void _showAddReviewDialog(
      DorkarProvider provider, void Function(void Function()) setParentState) {
    double stars = 5.0;
    final nameCtrl = TextEditingController();
    final commentCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              title: const Text('রিভিউ ও রেটিং লিখুন',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        final starValue = index + 1.0;
                        return IconButton(
                          icon: Icon(
                            starValue <= stars
                                ? Icons.star_rounded
                                : Icons.star_border_rounded,
                            color: const Color(0xFFEAB308),
                            size: 32,
                          ),
                          onPressed: () {
                            setDialogState(() => stars = starValue);
                          },
                        );
                      }),
                    ),
                    const SizedBox(height: 10),
                    _buildTextField(
                      controller: nameCtrl,
                      label: 'আপনার নাম',
                      hint: 'যেমন: ফারহান করিম',
                      icon: Icons.person_outline,
                    ),
                    const SizedBox(height: 12),
                    _buildTextField(
                      controller: commentCtrl,
                      label: 'আপনার মতামত',
                      hint: 'কাজের মান, সময়ানুবর্তিতা কেমন ছিল...',
                      icon: Icons.comment_outlined,
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('বাতিল'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1D4ED8),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    if (commentCtrl.text.trim().isEmpty) {
                      _showSnackbar('অনুগ্রহ করে মতামত লিখুন');
                      return;
                    }
                    final review = DorkarReview(
                      id: 'rev-${DateTime.now().millisecondsSinceEpoch}',
                      authorName: nameCtrl.text.trim().isEmpty
                          ? 'বেনামী সেবাগ্রহীতা'
                          : nameCtrl.text.trim(),
                      rating: stars,
                      comment: commentCtrl.text.trim(),
                      date: 'আজ',
                    );
                    _dorkarService.addReviewToProvider(provider.id, review);
                    Navigator.pop(ctx);
                    setParentState(() {});
                    setState(() {});
                    _showSnackbar('আপনার রিভিউ সফলভাবে যুক্ত হয়েছে!', isSuccess: true);
                  },
                  child: const Text('জমা দিন'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // Booking Flow BottomSheet (Instant Booking from Khub-e-Dorkar)
  void _showBookingSheet({
    required String initialServiceTitle,
    String? providerName,
    required String estimatedPrice,
  }) {
    DorkarBookingMode mode = DorkarBookingMode.emergencyNow;
    final phoneCtrl = TextEditingController();
    final addressCtrl = TextEditingController(
        text: '${_dorkarService.selectedArea.value.nameBn}, ঢাকা');
    final descCtrl = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.85,
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                top: 20,
                left: 20,
                right: 20,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'সার্ভিস রিকোয়েস্ট ও বুকিং',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close_rounded),
                          onPressed: () => Navigator.pop(ctx),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFF6FF),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFFDBEAFE)),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.check_circle_rounded,
                              color: Color(0xFF1D4ED8), size: 20),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  initialServiceTitle,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Color(0xFF1E293B),
                                  ),
                                ),
                                if (providerName != null)
                                  Text(
                                    'নির্দিষ্ট কারিগর: $providerName',
                                    style: const TextStyle(
                                        fontSize: 12, color: Color(0xFF475569)),
                                  ),
                                Text(
                                  'আনুমানিক চার্জ: $estimatedPrice',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF1D4ED8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),

                    // Booking Mode Selection
                    const Text('বুকিংয়ের ধরণ নির্বাচন করুন *',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF334155))),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        _buildModeChip(
                          title: 'তাৎক্ষণিক বুকিং',
                          subtitle: '৩০-৪৫ মিনিটে পৌঁছাবে',
                          selected: mode == DorkarBookingMode.emergencyNow,
                          onTap: () => setModalState(
                              () => mode = DorkarBookingMode.emergencyNow),
                        ),
                        const SizedBox(width: 8),
                        _buildModeChip(
                          title: 'কোটেশন নিন',
                          subtitle: 'আগে দেখে মূল্য নির্ধারণ',
                          selected: mode == DorkarBookingMode.inspectThenQuote,
                          onTap: () => setModalState(
                              () => mode = DorkarBookingMode.inspectThenQuote),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Phone
                    _buildTextField(
                      controller: phoneCtrl,
                      label: 'আপনার মোবাইল নম্বর *',
                      hint: '01XXXXXXXXX',
                      icon: Icons.phone_outlined,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 14),

                    // Address
                    _buildTextField(
                      controller: addressCtrl,
                      label: 'সম্পূর্ণ ঠিকানা / বাড়ি ও রোড নম্বর *',
                      hint: 'বাসা নং, রোড নং, ফ্ল্যাট, থানা',
                      icon: Icons.home_outlined,
                    ),
                    const SizedBox(height: 14),

                    // Issue Description
                    _buildTextField(
                      controller: descCtrl,
                      label: 'কাজের বিস্তারিত বিবরণ *',
                      hint: 'যেমন: রান্নাঘরের পানির লাইন চুইয়ে পড়ছে, বা সুইচে স্পার্ক হচ্ছে...',
                      icon: Icons.notes_rounded,
                      maxLines: 3,
                    ),
                    const SizedBox(height: 24),

                    // Submit Booking
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1D4ED8),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () async {
                          if (phoneCtrl.text.trim().isEmpty ||
                              addressCtrl.text.trim().isEmpty ||
                              descCtrl.text.trim().isEmpty) {
                            _showSnackbar(
                                'অনুগ্রহ করে মোবাইল নম্বর, ঠিকানা এবং কাজের বিবরণ দিন');
                            return;
                          }

                          final booking = await _dorkarService.createBooking(
                            serviceTitleBn: initialServiceTitle,
                            providerName: providerName,
                            mode: mode,
                            userPhone: phoneCtrl.text.trim(),
                            userAddress: addressCtrl.text.trim(),
                            issueDescription: descCtrl.text.trim(),
                            estimatedPrice: estimatedPrice,
                          );

                          if (mounted) {
                            Navigator.pop(ctx);
                            _tabController.animateTo(2); // Switch to My Bookings tab
                            setState(() {});
                            _showSnackbar(
                                'বুকিং সফল! ট্র্যাকিং আইডি: ${booking.id}',
                                isSuccess: true);
                          }
                        },
                        child: const Text(
                          'বুকিং কনফার্ম করুন',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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

  Widget _buildModeChip({
    required String title,
    required String subtitle,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            color: selected ? const Color(0xFFEFF6FF) : const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selected ? const Color(0xFF1D4ED8) : const Color(0xFFE2E8F0),
              width: selected ? 1.5 : 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: selected ? const Color(0xFF1D4ED8) : const Color(0xFF1E293B),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 11, color: Color(0xFF64748B)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Color(0xFF334155),
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 13, color: Color(0xFF94A3B8)),
            prefixIcon: Icon(icon, size: 20, color: const Color(0xFF64748B)),
            filled: true,
            fillColor: const Color(0xFFF8FAFC),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF1D4ED8), width: 1.5),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final providers = _dorkarService.getProviders(
      categoryId: _selectedCategoryId,
      searchQuery: _searchController.text,
      emergencyOnly: _emergencyOnly,
    );
    final bookings = _dorkarService.getBookings();

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              color: Color(0xFF0F172A), size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        titleSpacing: 0,
        title: const Text(
          'নিকটবর্তী প্রয়োজনীয় সেবা ও কারিগর',
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.map_outlined,
                color: Color(0xFF1D4ED8), size: 22),
            tooltip: 'ঢাকা ম্যাপে দেখুন',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DhakaMapScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person_add_alt_1_rounded,
                color: Color(0xFF1D4ED8), size: 22),
            tooltip: 'নতুন কারিগর যুক্ত করুন',
            onPressed: _showAddProviderSheet,
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: const Color(0xFF1D4ED8),
          unselectedLabelColor: const Color(0xFF64748B),
          indicatorColor: const Color(0xFF1D4ED8),
          indicatorWeight: 3,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5),
          tabs: [
            const Tab(text: 'কারিগর ও প্রতিষ্ঠান'),
            const Tab(text: 'সার্ভিস মার্কেটপ্লেস'),
            Tab(text: 'আমার বুকিং (${bookings.length})'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tab 1: Providers Directory (Matches uploaded screenshot layout!)
          _buildDirectoryTab(providers),

          // Tab 2: Service Marketplace (From Khub-e-Dorkar client service catalog)
          _buildMarketplaceTab(),

          // Tab 3: My Bookings & Activity
          _buildBookingsTab(bookings),
        ],
      ),
    );
  }

  // TAB 1: Directory View
  Widget _buildDirectoryTab(List<DorkarProvider> providers) {
    final currentArea = _dorkarService.selectedArea.value;

    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16),
      children: [
        // Top Banner (Matches the user's screenshot exactly!)
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF1D4ED8).withOpacity(0.25),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.handyman, color: Colors.white, size: 28),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'যাচাইকৃত স্থানীয় কারিগর ও সেবা',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'ইলেকট্রিশিয়ান, প্লাম্বার ও জরুরি ফার্মেসি সরাসরি যোগাযোগ',
                          style: TextStyle(color: Color(0xFFBFDBFE), fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Area & GPS Selector Pill inside banner
              InkWell(
                onTap: _showAreaSelectorSheet,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.18),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.location_on_rounded,
                          color: Colors.white, size: 16),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          'আপনার এলাকা: ${currentArea.nameBn}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12.5,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Text(
                        'পরিবর্তন ▼',
                        style: TextStyle(
                          color: Color(0xFFFEF08A),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 14),

        // Search Bar & Emergency Toggle
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    prefixIcon:
                        const Icon(Icons.search_rounded, color: Color(0xFF1D4ED8)),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear_rounded, size: 18),
                            onPressed: () {
                              _searchController.clear();
                              setState(() {});
                            },
                          )
                        : null,
                    hintText: 'কী খুঁজছেন? (যেমন: এসি, কল লিক, প্লাম্বার...)',
                    hintStyle:
                        const TextStyle(fontSize: 13, color: Color(0xFF94A3B8)),
                    border: InputBorder.none,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            // Emergency 24/7 Filter Pill
            InkWell(
              onTap: () {
                setState(() => _emergencyOnly = !_emergencyOnly);
              },
              borderRadius: BorderRadius.circular(14),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                  color: _emergencyOnly
                      ? const Color(0xFFE11D48)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: _emergencyOnly
                        ? const Color(0xFFE11D48)
                        : const Color(0xFFE2E8F0),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.flash_on_rounded,
                      size: 16,
                      color: _emergencyOnly
                          ? Colors.white
                          : const Color(0xFFE11D48),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'জরুরি',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: _emergencyOnly
                            ? Colors.white
                            : const Color(0xFFE11D48),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        // Horizontal Category Filter Carousel
        SizedBox(
          height: 38,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: DorkarService.categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final cat = DorkarService.categories[index];
              final isSelected = _selectedCategoryId == cat.id;
              return InkWell(
                onTap: () {
                  setState(() => _selectedCategoryId = cat.id);
                },
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFF1D4ED8)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFF1D4ED8)
                          : const Color(0xFFE2E8F0),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        cat.icon,
                        size: 16,
                        color: isSelected ? Colors.white : cat.themeColor,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        cat.titleBn,
                        style: TextStyle(
                          fontSize: 12.5,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.w500,
                          color: isSelected
                              ? Colors.white
                              : const Color(0xFF334155),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 16),

        // Providers List (Matches user screenshot cards exactly!)
        if (providers.isEmpty)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40),
            alignment: Alignment.center,
            child: Column(
              children: [
                Icon(Icons.search_off_rounded,
                    size: 48, color: Colors.grey.shade400),
                const SizedBox(height: 10),
                const Text(
                  'কোনো কারিগর বা প্রতিষ্ঠান খুঁজে পাওয়া যায়নি',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF64748B)),
                ),
                const SizedBox(height: 4),
                const Text(
                  'ফিল্টার পরিবর্তন করুন অথবা নিজেই নতুন কারিগর যোগ করুন।',
                  style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: _showAddProviderSheet,
                  icon: const Icon(Icons.add_rounded, size: 16),
                  label: const Text('নতুন কারিগর যোগ করুন'),
                ),
              ],
            ),
          )
        else
          ...providers.map((provider) => _buildProviderCard(provider)),

        const SizedBox(height: 20),
      ],
    );
  }

  // Card matching user's uploaded screenshot
  Widget _buildProviderCard(DorkarProvider provider) {
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
      child: InkWell(
        onTap: () => _showProviderDetailSheet(provider),
        borderRadius: BorderRadius.circular(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon Container (Soft tinted rounded square)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: provider.iconBgColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(provider.icon, color: provider.iconColor, size: 24),
            ),
            const SizedBox(width: 14),

            // Info (Title, Category, Rating, Area & Distance)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    provider.nameBn,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F5F9),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          provider.categoryTitleBn,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFF475569),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Icon(Icons.star_rounded,
                          color: Color(0xFFEAB308), size: 14),
                      Text(
                        ' ${provider.rating}',
                        style: const TextStyle(
                          fontSize: 11.5,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF334155),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${provider.areaNameBn} • ${_dorkarService.getFormattedDistance(provider)}',
                    style: const TextStyle(
                      fontSize: 11.5,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ),

            // Call Button (Green circle matching user screenshot!)
            InkWell(
              onTap: () => _callProvider(provider.phone),
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Color(0xFF16A34A),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.phone,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // TAB 2: Service Marketplace (From Khub-e-Dorkar)
  Widget _buildMarketplaceTab() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFEFF6FF),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFDBEAFE)),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF1D4ED8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.verified_user_rounded,
                    color: Colors.white, size: 24),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'নির্ধারিত সার্ভিস রেট ও সরাসরি বুকিং',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.5,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'স্বচ্ছ মূল্য তালিকা। কাজ শেষে নিশ্চিত হওয়ার পর মূল্য পরিশোধ করুন।',
                      style: TextStyle(fontSize: 12, color: Color(0xFF475569)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        ...DorkarService.marketplaceServices.map((service) {
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF6FF),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(service.icon,
                      color: const Color(0xFF1D4ED8), size: 24),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        service.titleBn,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        service.descriptionBn,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF64748B),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '৳${service.minPriceBdt} - ৳${service.maxPriceBdt} / ${service.priceUnit}',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF16A34A),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1D4ED8),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0,
                            ),
                            onPressed: () {
                              _showBookingSheet(
                                initialServiceTitle: service.titleBn,
                                estimatedPrice:
                                    '৳${service.minPriceBdt} - ৳${service.maxPriceBdt}',
                              );
                            },
                            child: const Text('বুক করুন',
                                style: TextStyle(
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  // TAB 3: My Bookings
  Widget _buildBookingsTab(List<DorkarBookingRequest> bookings) {
    if (bookings.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.assignment_outlined,
                  size: 56, color: Colors.grey.shade400),
              const SizedBox(height: 12),
              const Text(
                'কোনো সক্রিয় বুকিং নেই',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'যেকোনো সেবা বা কারিগরের প্রোফাইল থেকে "সার্ভিস বুকিং" রিকোয়েস্ট পাঠালে তা এখানে ট্র্যাকিং করতে পারবেন।',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Color(0xFF64748B)),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1D4ED8),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => _tabController.animateTo(0),
                child: const Text('তালিকায় যান'),
              ),
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        final b = bookings[index];
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF6FF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      b.id,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1D4ED8),
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFEF3C7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      b.status,
                      style: const TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB45309),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                b.serviceTitleBn,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
              if (b.providerName != null)
                Text(
                  'কারিগর: ${b.providerName}',
                  style: const TextStyle(fontSize: 12.5, color: Color(0xFF475569)),
                ),
              const SizedBox(height: 6),
              Text(
                'বিবরণ: ${b.issueDescription}',
                style: const TextStyle(fontSize: 12.5, color: Color(0xFF64748B)),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.location_on_outlined,
                      size: 14, color: Color(0xFF94A3B8)),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      b.userAddress,
                      style:
                          const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Divider(height: 1),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'আনুমানিক: ${b.estimatedPrice}',
                    style: const TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF16A34A),
                    ),
                  ),
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      foregroundColor: const Color(0xFF16A34A),
                    ),
                    icon: const Icon(Icons.phone_rounded, size: 16),
                    label: const Text('হেল্পলাইন কল'),
                    onPressed: () => _callProvider('16263'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
