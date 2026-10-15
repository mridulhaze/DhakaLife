import 'package:flutter_project_nutcm_1/views/drawer_screen.dart';
import 'package:flutter_project_nutcm_1/views/notices.dart';
import 'package:flutter_project_nutcm_1/views/sidebar.dart';
import 'package:flutter_project_nutcm_1/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_nutcm_1/views/employee.DART';
//import 'package:flutter_project_nutcm_1/views/collegesLists.DART';
import 'package:flutter_project_nutcm_1/views/collegesLists.dart';

import 'package:flutter_project_nutcm_1/views/notes.DART';
//import 'package:flutter_project_nutcm_1/screens/home.dart';
//import 'package:flutter_project_nutcm_1/Screens/statistics.dart';
import 'package:flutter_project_nutcm_1/widget/bottomnavigationbar.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_project_nutcm_1/data/model/add_date.dart';
import 'package:flutter_project_nutcm_1/event_calendar.dart';

import '../controllers/data_controller.dart';
import 'package:flutter_project_nutcm_1/views/login_user_product_screen.dart';
import 'package:flutter_project_nutcm_1/pages/profile_page.dart';
import 'package:flutter_project_nutcm_1/slider/slider_screen.dart';
//import 'package:flutter_project_nutcm_1/widget/bottomnavigationbar.dart';

//import 'collegesLists.dart';

class HomeScreen extends StatefulWidget {
  final DataController controller = Get.put(DataController());
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cipher'),
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              'assets/flutter_logo6.png',
              color: Color.fromRGBO(255, 162, 241, 202),
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 1,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[SliderScreen()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}




/////////////////////////////////// old 1 ////////////////////////
/*

class HomeScreen extends StatefulWidget {
  int currentIndex = 0;
 
  final DataController controller = Get.put(DataController());
  @override
  _DashboardState createState() => _DashboardState();

  
}

class _DashboardState extends State<HomeScreen> {

   

  @override
  void initState() {
    super.initState();
    initHive();
  }

  Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(AdddataAdapter());
    await Hive.openBox<Add_data>('data');
  }

  /*
  void initState() {
    super.initState();
    initHive();
  }

  Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(AdddataAdapter());
    await Hive.openBox<Add_data>('data');
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: DrawerScreen(),
      drawer: AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cipher'),
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              'assets/flutter_logo6.png', // replace with your custom icon asset path
              color: Color.fromRGBO(255, 162, 241, 202),
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      /*AppBar(
        centerTitle: true,
       /* title:Image.asset(''),*/
         /*Image.asset('assets/flutter_logo.png'),*/
             /* const Text("T L Bills"),*/
      ),*/
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 1,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[SliderScreen()],
        ),
      ),
      // bottomNavigationBar: AppBottomNavigationBar(),
/*
       bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),

*/

    );
  }
}

*/