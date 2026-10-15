import 'package:flutter/material.dart';
import '../services/dhaka_data_service.dart';

class DhakaWeatherScreen extends StatefulWidget {
  const DhakaWeatherScreen({Key? key}) : super(key: key);

  @override
  State<DhakaWeatherScreen> createState() => _DhakaWeatherScreenState();
}

class _DhakaWeatherScreenState extends State<DhakaWeatherScreen> {
  Map<String, dynamic>? _weather;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadWeather();
  }

  void _loadWeather() async {
    final data = await DhakaDataService.fetchDhakaWeather();
    if (mounted) {
      setState(() {
        _weather = data;
        _isLoading = false;
      });
    }
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
          'আবহাওয়া ও জলাবদ্ধতা সতর্কতা',
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Color(0xFF1E88E5)),
            onPressed: () {
              setState(() => _isLoading = true);
              _loadWeather();
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: Color(0xFF1E88E5)))
          : ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(16),
              children: [
                // Weather Main Card
                Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF0288D1), Color(0xFF01579B)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF0288D1).withOpacity(0.3),
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'ঢাকা, বাংলাদেশ',
                                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'এশিয়া/ঢাকা টাইমজোন',
                                style: TextStyle(color: Color(0xFFB3E5FC), fontSize: 12),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 4,
                                  backgroundColor: _weather!['isLive'] ? Colors.greenAccent : Colors.amberAccent,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  _weather!['isLive'] ? 'লাইভ API' : 'ক্যাশড ডেটা',
                                  style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _weather!['temperature'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                _weather!['conditionBn'],
                                style: const TextStyle(
                                  color: Color(0xFFE1F5FE),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'অনুভূত তাপমাত্রা: ${_weather!['feelsLike']}',
                                style: const TextStyle(color: Color(0xFFB3E5FC), fontSize: 12),
                              ),
                            ],
                          ),
                          Icon(
                            _weather!['icon'] as IconData,
                            size: 72,
                            color: Colors.amberAccent,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Divider(color: Colors.white24, thickness: 1),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildWeatherStat(Icons.water_drop_outlined, 'বাতাসে আর্দ্রতা', _weather!['humidity']),
                          _buildWeatherStat(Icons.air, 'বাতাসের গতি', _weather!['windSpeed']),
                          _buildWeatherStat(Icons.update, 'হালনাগাদ', 'আজ'),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                const Text(
                  'ঢাকার সম্ভাব্য জলাবদ্ধতা এলাকা মনিটরিং',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E293B),
                  ),
                ),
                const SizedBox(height: 10),

                _buildFloodAlert(
                  area: 'মিরপুর ১০ ও কাজীপাড়া বাসস্ট্যান্ড এলাকা',
                  status: 'স্বাভাবিক (পানি নেই)',
                  color: const Color(0xFF43A047),
                  desc: 'ড্রেনেজ ব্যবস্থা সচল রয়েছে, যানবাহন চলাচল স্বাভাবিক।',
                ),
                _buildFloodAlert(
                  area: 'শান্তিনগর ও মালিবাগ মোড়',
                  status: 'মাঝারি ঝুঁকি (বৃষ্টি হলে)',
                  color: const Color(0xFFF57C00),
                  desc: 'ভারী বৃষ্টিপাতের ক্ষেত্রে হাঁটু পানির ঝুঁকি থাকে। সাবধানে চলুন।',
                ),
                _buildFloodAlert(
                  area: 'ধানমন্ডি ২৭ ও শুক্রাবাদ মোড়',
                  status: 'স্বাভাবিক',
                  color: const Color(0xFF43A047),
                  desc: 'বর্তমানে কোনো পানি জমার তথ্য নেই।',
                ),

                const SizedBox(height: 20),

                // Rain Safety Tips
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF6FF),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFBFDBFE)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Row(
                        children: [
                          Icon(Icons.shield_outlined, color: Color(0xFF1E88E5), size: 20),
                          SizedBox(width: 8),
                          Text(
                            'ঢাকাবাসীর জন্য বর্ষা সতর্কতা',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xFF1E88E5),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        '• খোলা বৈদ্যুতিক তার বা খুঁটির কাছে জলাবদ্ধ অবস্থায় যাবেন না।\n• বজ্রপাতের সময় খোলা মাঠ বা গাছের নিচে আশ্রয় নেওয়া থেকে বিরত থাকুন।\n• জরুরি প্রয়োজনে ৯৯৯ নম্বরে ফায়ার সার্ভিসের সাহায্য নিন।',
                        style: TextStyle(fontSize: 12.5, color: Color(0xFF1E3A8A), height: 1.5),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildWeatherStat(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, color: Colors.white70, size: 20),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(color: Color(0xFFB3E5FC), fontSize: 10.5)),
      ],
    );
  }

  Widget _buildFloodAlert({
    required String area,
    required String status,
    required Color color,
    required String desc,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  area,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5, color: Color(0xFF1E293B)),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  status,
                  style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            desc,
            style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
          ),
        ],
      ),
    );
  }
}
