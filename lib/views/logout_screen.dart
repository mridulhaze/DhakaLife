import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_project_nutcm_1/controllers/auth_controller.dart';
import 'package:flutter_project_nutcm_1/views/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project_nutcm_1/controllers/comman_dailog.dart';
import 'package:flutter_project_nutcm_1/views/login_screen.dart';

class LogoutScreen extends StatelessWidget {
  final AuthController _authController = Get.find<AuthController>();

  Future<void> _logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(LoginScreen()); // replace with your login screen route
  }

  @override
  Widget build(BuildContext context) {
    _logout(); // Call the logout function when the screen is built
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}


/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logout'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _logout,
          child: Text('Logout'),
        ),
      ),
    );
  }

  */

