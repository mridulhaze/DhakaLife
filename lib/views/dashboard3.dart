import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_project_nutcm_1/views/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_project_nutcm_1/views/login_screen.dart';
import 'package:flutter_project_nutcm_1/views/dashboard.dart';
import 'package:flutter_project_nutcm_1/views/sign_up_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../controllers/auth_controller.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    authController.autoLogin();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          // Show error message in Snackbar
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Could not connect'),
              ),
            );
          });
          return Scaffold(
            body: Container(),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Cipher'),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 250,
                  width: 250,
                  child: AnimationConfiguration.synchronized(
                    child: Lottie.asset(
                      'assets/logo_anim.json',
                      fit: BoxFit.contain,
                      repeat: true,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultTextStyle(
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        child: AnimatedTextKit(
                          totalRepeatCount: 3,
                          pause: Duration(milliseconds: 500),
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'Welcome to Cipher ',
                              speed: Duration(milliseconds: 100),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      DefaultTextStyle(
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                        child: Text('Press -> to Start '),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50, width: 70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Get.to(LoginScreen());
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text('            ->            '),
                    ),
                    SizedBox(
                      width: 10,
                      height: 50,
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(60),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 253, 252, 252),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '© 2023 Cipher. All Rights Reserved',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(width: 15),
                      InkWell(
                        onTap: () {
                          // Navigate to Facebook page
                          launch('https://www.facebook.com/mridulhaze');
                        },
                        child: Text(
                          'Mridul Roy',
                          style: TextStyle(
                            color: Colors.greenAccent,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
