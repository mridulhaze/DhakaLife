import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:nutsm/user_list.dart';
import 'package:flutter_project_nutcm_1/views/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_project_nutcm_1/views/login_screen.dart';
import 'package:flutter_project_nutcm_1/views/dashboard.dart';

class Dashboard extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cipher'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage('assets/Cipher_logo.png'),
            backgroundColor: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/Cipher_logo.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[200],
            ),
            child: Text(
              'Welcome to Cipher App!',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Do something when the button is pressed
                  ///////////////////////////////////////////////////

                  FutureBuilder(
                    future: _initialization,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('could Not Connected'),
                        );
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        return LoginScreen();
                        //return Dashboard();
                      }

                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );

                  ////////////////////////////////////////////////
                },
                child: Text('Login'),
              ),
              SizedBox(width: 16),
              OutlinedButton(
                onPressed: () {
                  // Do something when the button is pressed
                },
                child: Text('Register'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
