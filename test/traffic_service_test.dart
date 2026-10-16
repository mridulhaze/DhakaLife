import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_project_nutcm_1/models/dhaka_traffic_model.dart';
import 'package:flutter_project_nutcm_1/services/dhaka_traffic_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });
  group('DhakaTrafficModel Tests', () {
    test('Default constructor and color mappings', () {
      final report = DhakaTrafficReport(
        id: 'test_1',
        title: 'টেস্ট যানজট',
        roadName: 'মিরপুর রোড',
        areaName: 'মিরপুর-১০',
        description: 'গাড়ির ধীরগতি',
        category: DhakaTrafficCategory.congestion,
        severity: DhakaTrafficSeverity.severe,
        latitude: 23.8069,
        longitude: 90.3687,
        timestamp: DateTime.now(),
      );

      expect(report.severityLabel, 'তীব্র যানজট');
      expect(report.categoryLabel, 'যানজট');
      expect(report.severityColor.value, 0xFFEF4444);
      expect(report.confirmations, 1);
    });

    test('JSON serialization round-trip', () {
      final original = DhakaTrafficReport(
        id: 'test_2',
        title: 'দুর্ঘটনা আপডেট',
        roadName: 'বিজয় সরণি',
        areaName: 'তেজগাঁও',
        description: 'গাড়ির দীর্ঘ সারি',
        category: DhakaTrafficCategory.accident,
        severity: DhakaTrafficSeverity.slow,
        latitude: 23.7663,
        longitude: 90.3878,
        timestamp: DateTime.now(),
        confirmations: 5,
        isVerified: true,
      );

      final json = original.toJson();
      final restored = DhakaTrafficReport.fromJson(json);

      expect(restored.id, original.id);
      expect(restored.title, original.title);
      expect(restored.roadName, original.roadName);
      expect(restored.severity, original.severity);
      expect(restored.category, original.category);
      expect(restored.confirmations, 5);
      expect(restored.isVerified, true);
    });
  });

  group('DhakaTrafficService Tests', () {
    test('Baseline reports contain essential Dhaka corridors', () async {
      final service = DhakaTrafficService.to;
      await service.loadReports();
      expect(service.reports, isNotEmpty);
      final roads = service.reports.map((r) => r.areaName).toList();
      expect(roads.any((a) => a.contains('মিরপুর') || a.contains('বিজয় সরণি') || a.contains('মহাখালী')), isTrue);
    });
  });
}
