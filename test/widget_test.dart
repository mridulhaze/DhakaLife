import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project_nutcm_1/main.dart';

void main() {
  testWidgets('DhakaLife app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a initial frame.
    await tester.pumpWidget(MyApp());

    // Verify that GetMaterialApp and basic MaterialApp widgets are present.
    expect(find.byType(MaterialApp), findsWidgets);
  });
}
