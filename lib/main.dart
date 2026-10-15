import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_project_nutcm_1/views/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_project_nutcm_1/views/login_screen.dart';
import 'package:flutter_project_nutcm_1/views/dashboard2.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

/*
void main() {
  runApp(const MyApp());
}
*/

import 'package:flutter_project_nutcm_1/views/dhaka_home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print('Firebase initialization error: $e');
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'DhakaLife',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF1E88E5),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1E88E5)),
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        appBarTheme: const AppBarTheme(
          elevation: 0.5,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Color(0xFF0F172A)),
          titleTextStyle: TextStyle(
            color: Color(0xFF0F172A),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const DhakaHomeScreen(),
    );
  }
}

