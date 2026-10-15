import 'package:flutter/material.dart';

class DhakaAiAssistantScreen extends StatefulWidget {
  const DhakaAiAssistantScreen({Key? key}) : super(key: key);

  @override
  State<DhakaAiAssistantScreen> createState() => _DhakaAiAssistantScreenState();
}

class _DhakaAiAssistantScreenState extends State<DhakaAiAssistantScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {
      'isUser': false,
      'text': 'আসসালামু আলাইকুম! আমি ঢাকালাইফ বাংলা এআই সহকারী।\nঢাকার যাতায়াত, মেট্রো রুট, বাজার দর, হাসপাতাল বা যেকোনো নাগরিক তথ্য জানতে আমাকে প্রশ্ন করুন।',
      'time': 'এখন',
    }
  ];

  final List<String> _quickQuestions = [
    'মিরপুর থেকে মতিঝিল কীভাবে যাব?',
    'জরুরি অ্যাম্বুলেন্স নম্বর কত?',
    'আজকের ডিম ও ব্রয়লার মুরগির দাম কত?',
    'মেট্রোরেল কোন কোন স্টেশনে থামে?',
  ];

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.add({
        'isUser': true,
        'text': text.trim(),
        'time': 'এখন',
      });
    });
    _controller.clear();

    // AI Response Logic based on local Dhaka context
    Future.delayed(const Duration(milliseconds: 600), () {
      String reply = '';
      final q = text.toLowerCase();

      if (q.contains('মিরপুর') && q.contains('মতিঝিল')) {
        reply = 'মিরপুর থেকে মতিঝিল যাওয়ার দ্রুততম মাধ্যম ঢাকা মেট্রোরেল (MRT Line-6)।\n'
            '• স্টেশন: মিরপুর ১০, ১১ বা পল্লবী থেকে উঠে মতিঝিল স্টেশনে নামুন।\n'
            '• ভাড়া: ৪০-৫০ টাকা।\n'
            '• সময়: মাত্র ২৫-৩০ মিনিট।\n'
            'এছাড়া বিকল্প অটো সার্ভিস বা প্রজাপতি বাসে সরাসরি যেতে পারেন।';
      } else if (q.contains('অ্যাম্বুলেন্স') || q.contains('জরুরি') || q.contains('হাসপাতাল')) {
        reply = 'জরুরি চিকিৎসা সেবার জন্য:\n'
            '• জাতীয় জরুরি সেবা: ৯৯৯ (পুলিশ, অ্যাম্বুলেন্স, ফায়ার)\n'
            '• স্বাস্থ্য বাতায়ন (ডাক্তার পরামর্শ): ১৬২৬৩\n'
            '• ঢাকা মেডিকেল কলেজ হাসপাতাল জরুরি বিভাগ: ০২৫৫১৬৫০৮৮';
      } else if (q.contains('ডিম') || q.contains('মুরগি') || q.contains('বাজার') || q.contains('দাম')) {
        reply = 'আজকের বাজার দর নির্দেশিকা:\n'
            '• ফার্মের মুরগির ডিম: ১৬৫ ৳ / ডজন\n'
            '• ব্রয়লার মুরগি: ১৮৫ ৳ / কেজি\n'
            '• দেশি পেঁয়াজ: ১১০ ৳ / কেজি\n'
            '• মিনিকেট চাল: ৭২ ৳ / কেজি\n'
            'বিস্তারিত জানতে অ্যাপের "দৈনিক বাজার দর" মেনু দেখুন।';
      } else if (q.contains('মেট্রো') || q.contains('স্টেশন')) {
        reply = 'ঢাকা মেট্রোরেল লাইন-৬ এ মোট ১৬টি স্টেশন রয়েছে:\n'
            'উত্তরা উত্তর, উত্তরা সেন্টার, উত্তরা দক্ষিণ, পল্লবী, মিরপুর ১১, মিরপুর ১০, কাজীপাড়া, শেওড়াপাড়া, আগারগাঁও, বিজয় সরণি, ফার্মগেট, কারওয়ান বাজার, শাহবাগ, ঢাকা বিশ্ববিদ্যালয়, বাংলাদেশ সচিবালয় ও মতিঝিল।';
      } else {
        reply = 'ধন্যবাদ আপনার প্রশ্নের জন্য। ঢাকালাইফে আপনি ঢাকা শহরের বাস রুট, মেট্রোরেলের সময়সূচী, বাজার দর এবং ৯৯৯ জরুরি সেবা এক ট্যাপে পেতে পারেন। আপনি চাইলে নির্দিষ্ট কোনো এলাকা বা সেবা সম্পর্কে জানতে পারেন।';
      }

      if (mounted) {
        setState(() {
          _messages.add({
            'isUser': false,
            'text': reply,
            'time': 'এখন',
          });
        });
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
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: const Color(0xFF8E24AA).withOpacity(0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.smart_toy_rounded, color: Color(0xFF8E24AA), size: 20),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'ঢাকালাইফ বাংলা এআই',
                  style: TextStyle(
                    color: Color(0xFF0F172A),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  'অনলাইন স্মার্ট সহকারী',
                  style: TextStyle(
                    color: Color(0xFF64748B),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Quick Questions Carousel
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: _quickQuestions.map((q) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ActionChip(
                      backgroundColor: const Color(0xFFF1F5F9),
                      label: Text(
                        q,
                        style: const TextStyle(fontSize: 11.5, color: Color(0xFF334155)),
                      ),
                      onPressed: () => _sendMessage(q),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          // Messages List
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                final isUser = msg['isUser'] as bool;
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.78,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: isUser ? const Color(0xFF1E88E5) : Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(16),
                        topRight: const Radius.circular(16),
                        bottomLeft: Radius.circular(isUser ? 16 : 4),
                        bottomRight: Radius.circular(isUser ? 4 : 16),
                      ),
                      border: isUser ? null : Border.all(color: const Color(0xFFF1F5F9)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.02),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      msg['text'] as String,
                      style: TextStyle(
                        color: isUser ? Colors.white : const Color(0xFF1E293B),
                        fontSize: 13.5,
                        height: 1.4,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Text Input Field
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'যেকোনো প্রশ্ন বাংলায় লিখুন...',
                      hintStyle: const TextStyle(fontSize: 13, color: Color(0xFF94A3B8)),
                      filled: true,
                      fillColor: const Color(0xFFF8FAFC),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                      ),
                    ),
                    onSubmitted: _sendMessage,
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: const Color(0xFF1E88E5),
                  radius: 22,
                  child: IconButton(
                    icon: const Icon(Icons.send_rounded, color: Colors.white, size: 20),
                    onPressed: () => _sendMessage(_controller.text),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
