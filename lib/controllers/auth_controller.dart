import 'package:flutter_project_nutcm_1/controllers/comman_dailog.dart';
import 'package:flutter_project_nutcm_1/models/products_model.dart';
import 'package:flutter_project_nutcm_1/services/services.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project_nutcm_1/views/home_screen2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_project_nutcm_1/views/notices.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../views/dashboard2.dart';
//import 'firebase_options.dart';

class AuthController extends GetxController {
  var userId;

  ///////// this functioin save user data for 30 days/////////////
/*
  @override
  void onReady() async {
    super.onReady();
    // Check if the user is already logged in
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      final idTokenResult = await currentUser.getIdTokenResult(true);
      if (idTokenResult != null &&
          idTokenResult.expirationTime != null &&
          DateTime.now().difference(idTokenResult.expirationTime!).inDays >
              30) {
        await currentUser.getIdToken(true);
      }
      // Navigate to HomeScreen if the user is already logged in
      Get.off(HomeScreen());
    }
  }
  */

  ///////////////////////////////////////////////////

  Future<void> signup(pf, email, password, username) async {
    try {
      CommanDialog.showLoading();
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password);
      //print(userCredential);
      CommanDialog.hideLoading();

      // firestore database initialization
      try {
        CommanDialog.showLoading();
        var response =
            await FirebaseFirestore.instance.collection('userslist').add({
          'user_Id': userCredential.user!.uid,
          'user_name': username,
          'pf': pf,
          "password": password,
          'joinDate': DateTime.now().millisecondsSinceEpoch,
          'email': email
        });
        print("Firebase response1111 ${response.id}");
        CommanDialog.hideLoading();
      } catch (exception) {
        CommanDialog.hideLoading();
        print("Error Saving Data at firestore $exception");
      }

      // Finishing firestore database initialization

      Get.back();
    } on FirebaseAuthException catch (e) {
      CommanDialog.hideLoading();
      if (e.code == 'weak-password') {
        CommanDialog.showErrorDialog(
            description: "The password provided is too weak.");
        // print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        CommanDialog.showErrorDialog(
            description: "The account already exists for that email.");
        //print('The account already exists for that email.');
      }
    } catch (e) {
      CommanDialog.hideLoading();
      CommanDialog.showErrorDialog(description: "Something Went Wrong");
      //print(e);
    }
  }

  //////////////  start login controller  //////////////////////
/*
  Future<void> login(email, password, {bool rememberMe = true}) async {
    //print('$email,$password');
    try {
      // this part is for save data in local , if u use autologin() enable this
      /*
      CommanDialog.showLoading();
      if (rememberMe) {
        // set user persistence to local
        await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
        // store user credentials in persistent storage
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        await prefs.setString('email', email);
        await prefs.setString('password', password);
      }
      CommanDialog.hideLoading();
      */
      CommanDialog.showLoading();
      // await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email.trim(), password: password);
      // print(userCredential.user!.uid);
      userId = userCredential.user!.uid;
      CommanDialog.hideLoading();
      //print(userCredential);
      //Get.to(HomeScreen());
      // Get.off(() => NoticeScreen());
      Get.off(() => HomeScreen());
      //  CommanDialog.hideLoading();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        CommanDialog.showErrorDialog(
            description: "No user found for that email.");
        CommanDialog.hideLoading();
        // print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        CommanDialog.showErrorDialog(
            description: "Wrong password provided for that user.");
        CommanDialog.hideLoading();
        //print('Wrong password provided for that user.');
      }
    }
  }

  */

////////////////////////////////////////////////  test login /////////

  Future<void> login(email, password, {bool rememberMe = true}) async {
    try {
      CommanDialog.showLoading();

      // Perform the login operation
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email.trim(), password: password);
      userId = userCredential.user?.uid ?? FirebaseAuth.instance.currentUser?.uid;

      CommanDialog.hideLoading();

      // Save login data locally if rememberMe is true
      if (rememberMe) {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        // Calculate the expiry date as 30 days from the current date
        DateTime expiryDate = DateTime.now().add(Duration(days: 30));

        // Save the user login information
        await prefs.setBool('isLoggedIn', true);
        await prefs.setString('email', email);
        await prefs.setString('password', password);
        await prefs.setString('expiryDate', expiryDate.toString());
      }

      Get.off(() => HomeScreen());
    } on FirebaseAuthException catch (e) {
      CommanDialog.hideLoading();
      CommanDialog.showErrorDialog(description: e.message ?? "Authentication failed");
    } catch (e) {
      CommanDialog.hideLoading();
      if (FirebaseAuth.instance.currentUser != null) {
        userId = FirebaseAuth.instance.currentUser!.uid;
        if (rememberMe) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          DateTime expiryDate = DateTime.now().add(Duration(days: 30));
          await prefs.setBool('isLoggedIn', true);
          await prefs.setString('email', email);
          await prefs.setString('password', password);
          await prefs.setString('expiryDate', expiryDate.toString());
        }
        Get.off(() => HomeScreen());
      } else {
        CommanDialog.showErrorDialog(description: "Login failed: $e");
      }
    }
  }

  Future<void> autoLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    String expiryDateString = prefs.getString('expiryDate') ?? '';
    DateTime? expiryDate;

    // Parse the expiry date string
    if (expiryDateString.isNotEmpty) {
      expiryDate = DateTime.parse(expiryDateString);
    }

    if (isLoggedIn &&
        expiryDate != null &&
        expiryDate.isAfter(DateTime.now())) {
      String email = prefs.getString('email') ?? '';
      String password = prefs.getString('password') ?? '';
      await login(email, password);
    } else {
      // Clear the login data if expired or not available
      await prefs.setBool('isLoggedIn', false);
      await prefs.remove('email');
      await prefs.remove('password');
      await prefs.remove('expiryDate');
    }
  }

  ///////////////////////////////////////////////////////////////////

/*

// this Functoin is for Auto Login
  Future<void> autoLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      String email = prefs.getString('email') ?? '';
      String password = prefs.getString('password') ?? '';
      await login(email, password);
    }
  }


  */
}
