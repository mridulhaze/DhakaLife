import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:flutter_project_nutcm_1/models/dhaka_radio_station.dart';
import 'package:flutter_project_nutcm_1/services/dhaka_radio_service.dart';

class DhakaRadioDiagnosticScreen extends StatefulWidget {
  const DhakaRadioDiagnosticScreen({Key? key}) : super(key: key);

  @override
  State<DhakaRadioDiagnosticScreen> createState() =>
      _DhakaRadioDiagnosticScreenState();
}

class _DhakaRadioDiagnosticScreenState
    extends State<DhakaRadioDiagnosticScreen> {
  final DhakaRadioService _radioService = DhakaRadioService.to;
  bool _isTestingAll = false;
  String _testingStatus = '';

  Future<void> _runTestAll() async {
    setState(() {
      _isTestingAll = true;
      _testingStatus = 'পরীক্ষা শুরু হচ্ছে...';
    });

    final stations = _radioService.stations;
    for (int i = 0; i < stations.length; i++) {
      final st = stations[i];
      setState(() {
        _testingStatus = 'যাচাই করা হচ্ছে (${i + 1}/${stations.length}): ${st.nameBn}';
      });
      await _radioService.testStream(st);
    }

    if (mounted) {
      setState(() {
        _isTestingAll = false;
        _testingStatus = 'সকল স্টেশনের পরীক্ষা সম্পন্ন হয়েছে।';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('সকল স্টেশনের স্ট্রিম ডায়াগনস্টিক সফলভাবে সম্পন্ন হয়েছে।'),
          backgroundColor: Color(0xFF2E7D32),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              color: Color(0xFF0F172A), size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'রেডিও স্ট্রিম ডায়াগনস্টিক',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),
            Text(
              'লাইভ অডিও স্ট্রিম যাচাই ও সার্ভার স্ট্যাটাস',
              style: TextStyle(
                fontSize: 11,
                color: Color(0xFF64748B),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded, color: Color(0xFF1E88E5)),
            tooltip: 'সব পরীক্ষা করুন',
            onPressed: _isTestingAll ? null : _runTestAll,
          ),
        ],
      ),
      body: Obx(() {
        final stations = _radioService.stations;
        final results = _radioService.diagnosticResults;

        int verifiedCount = 0;
        int failedCount = 0;
        int webCount = 0;

        for (final st in stations) {
          final res = results[st.id];
          if (res != null) {
            if (res['status'] == 'verified_live') {
              verifiedCount++;
            } else if (res['status'] == 'fallback_web') {
              webCount++;
            } else {
              failedCount++;
            }
          } else if (st.isWebOnly) {
            webCount++;
          }
        }

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Top Summary Card
            Container(
              padding: const EdgeInsets.all(16),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'সার্ভার স্বাস্থ্য ও ওভারভিউ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFF6FF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'মোট ${stations.length} টি স্টেশন',
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1D4ED8),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _buildMetricChip(
                        label: 'লাইভ সক্রিয়',
                        count: verifiedCount,
                        color: const Color(0xFF16A34A),
                        bg: const Color(0xFFDCFCE7),
                      ),
                      const SizedBox(width: 8),
                      _buildMetricChip(
                        label: 'ওয়েব প্লেয়ার',
                        count: webCount,
                        color: const Color(0xFFD97706),
                        bg: const Color(0xFFFEF3C7),
                      ),
                      const SizedBox(width: 8),
                      _buildMetricChip(
                        label: 'ত্রুটি / অফলাইন',
                        count: failedCount,
                        color: const Color(0xFFDC2626),
                        bg: const Color(0xFFFEE2E2),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  if (_isTestingAll) ...[
                    LinearProgressIndicator(
                      backgroundColor: const Color(0xFFE2E8F0),
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Color(0xFF1E88E5)),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      _testingStatus,
                      style: const TextStyle(
                          fontSize: 11, color: Color(0xFF64748B)),
                    ),
                    const SizedBox(height: 10),
                  ],
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _isTestingAll ? null : _runTestAll,
                      icon: const Icon(Icons.speed_rounded, size: 18),
                      label: const Text(
                        'সকল স্টেশনের লাইভ টেস্ট চালান',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E88E5),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              'স্টেশন বিস্তারিত ও টেস্ট রিপোর্ট',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF334155),
              ),
            ),
            const SizedBox(height: 10),

            ...stations.map((st) {
              final res = results[st.id];
              return _buildStationDiagnosticCard(st, res);
            }).toList(),
          ],
        );
      }),
    );
  }

  Widget _buildMetricChip({
    required String label,
    required int count,
    required Color color,
    required Color bg,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              count.toString(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: color,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 10.5,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStationDiagnosticCard(
      DhakaRadioStation st, Map<String, dynamic>? res) {
    Color statusColor;
    String statusText;
    IconData statusIcon;

    if (res != null) {
      if (res['status'] == 'verified_live') {
        statusColor = const Color(0xFF16A34A);
        statusText = 'সক্রিয় লাইভ (${res['latencyMs']} ms)';
        statusIcon = Icons.check_circle_rounded;
      } else if (res['status'] == 'fallback_web') {
        statusColor = const Color(0xFFD97706);
        statusText = 'অফিসিয়াল ওয়েব প্লেয়ার';
        statusIcon = Icons.public_rounded;
      } else {
        statusColor = const Color(0xFFDC2626);
        statusText = 'সংযোগ ব্যর্থ';
        statusIcon = Icons.error_rounded;
      }
    } else if (st.isWebOnly) {
      statusColor = const Color(0xFFD97706);
      statusText = 'অফিসিয়াল ওয়েব প্লেয়ার';
      statusIcon = Icons.public_rounded;
    } else {
      statusColor = const Color(0xFF64748B);
      statusText = 'যাচাই করা হয়নি (Pending)';
      statusIcon = Icons.help_outline_rounded;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: (res?['status'] == 'verified_live')
              ? const Color(0xFFBBF7D0)
              : const Color(0xFFE2E8F0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.015),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Icon(statusIcon, color: statusColor, size: 18),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        st.nameBn,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  statusText,
                  style: TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.bold,
                    color: statusColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),

          // Metadata row
          Row(
            children: [
              Text(
                '${st.country} • ${st.frequency} • [${st.streamType.toUpperCase()}]',
                style: const TextStyle(
                  fontSize: 11,
                  color: Color(0xFF64748B),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),

          // Stream URL or Fallback Note
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    st.hasDirectStream
                        ? st.streamUrl
                        : 'ওয়েবসাইট: ${st.websiteUrl}',
                    style: const TextStyle(
                      fontSize: 11,
                      fontFamily: 'monospace',
                      color: Color(0xFF334155),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),

          if (res != null) ...[
            const SizedBox(height: 6),
            Text(
              'রিপোর্ট: ${res['message']} | সময়: ${res['timestamp']?.toString().substring(11, 19) ?? ''}',
              style: TextStyle(
                fontSize: 10.5,
                color: statusColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],

          const SizedBox(height: 10),

          // Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (st.hasDirectStream) ...[
                OutlinedButton.icon(
                  onPressed: () => _radioService.testStream(st),
                  icon: const Icon(Icons.speed_rounded, size: 14),
                  label: const Text('টেস্ট', style: TextStyle(fontSize: 11)),
                  style: OutlinedButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                    foregroundColor: const Color(0xFF1E88E5),
                    side: const BorderSide(color: Color(0xFF90CAF9)),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: () => _radioService.playStation(st),
                  icon: const Icon(Icons.play_arrow_rounded, size: 14),
                  label: const Text('প্লে করুন', style: TextStyle(fontSize: 11)),
                  style: ElevatedButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                    backgroundColor: const Color(0xFF1E88E5),
                    foregroundColor: Colors.white,
                  ),
                ),
              ] else ...[
                ElevatedButton.icon(
                  onPressed: () => _radioService.openStationWebsite(st),
                  icon: const Icon(Icons.open_in_new_rounded, size: 14),
                  label: const Text('ওয়েব প্লেয়ার খুলুন',
                      style: TextStyle(fontSize: 11)),
                  style: ElevatedButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                    backgroundColor: const Color(0xFFD97706),
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
