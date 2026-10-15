import 'package:flutter_project_nutcm_1/views/drawer_screen.dart';
import 'package:flutter_project_nutcm_1/views/notices.dart';
import 'package:flutter_project_nutcm_1/views/sidebar.dart';
//import 'package:flutter_project_nutcm_1/user_list.dart';
import 'package:flutter_project_nutcm_1/views/bill_locations.dart';
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
//import 'package:flutter_project_nutcm_1/slider/slider_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_project_nutcm_1/chatBot.dart';
import 'package:flutter_project_nutcm_1/views/gcall.DART';

//import 'package:flutter_project_nutcm_1/widget/bottomnavigationbar.dart';

//import 'collegesLists.dart';

import 'package:flutter_project_nutcm_1/views/dhaka_home_screen.dart';

class HomeScreen extends StatefulWidget {
//  int currentIndex = 0;
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

  @override
  Widget build(BuildContext context) {
    return const DhakaHomeScreen();
  }


  Card makeDashboardItem9(String title, IconData icon) {
    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 237, 239, 243),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatBot()),
            );

            /*

              MaterialPageRoute(
                builder: (context) => const UserListScreen(),
              );

              */
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  icon,
                  size: 30.0,
                  color: Color.fromARGB(255, 72, 89, 241),
                ),
                const SizedBox(height: 8.0),
                Text(
                  title,
                  style: const TextStyle(fontSize: 14.0, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Card makeDashboardItem10(String title, IconData icon) {
    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 237, 239, 243),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GSheet2Flutter()),
            );

            /*

              MaterialPageRoute(
                builder: (context) => const UserListScreen(),
              );

              */
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  icon,
                  size: 30.0,
                  color: Color.fromARGB(255, 72, 89, 241),
                ),
                const SizedBox(height: 8.0),
                Text(
                  title,
                  style: const TextStyle(fontSize: 14.0, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Card makeDashboardItem8(String title, IconData icon) {
    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 237, 239, 243),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginUserProductScreen()),
            );

            /*

              MaterialPageRoute(
                builder: (context) => const UserListScreen(),
              );

              */
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  icon,
                  size: 30.0,
                  color: Color.fromARGB(255, 236, 115, 247),
                ),
                const SizedBox(height: 8.0),
                Text(
                  title,
                  style: const TextStyle(fontSize: 14.0, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Card makeDashboardItem7(String title, IconData icon) {
    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 237, 239, 243),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  icon,
                  size: 30.0,
                  color: Color.fromARGB(255, 120, 243, 157),
                ),
                const SizedBox(height: 8.0),
                Text(
                  title,
                  style: const TextStyle(fontSize: 14.0, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Card makeDashboardItem6(String title, IconData icon) {
    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 237, 239, 243),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NoticeScreen()),
            );

            /*

              MaterialPageRoute(
                builder: (context) => const UserListScreen(),
              );

              */
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  icon,
                  size: 30.0,
                  color: Color.fromARGB(255, 195, 233, 58),
                ),
                const SizedBox(height: 8.0),
                Text(
                  title,
                  style: const TextStyle(fontSize: 14.0, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Card makeDashboardItem(String title, IconData icon) {
    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 237, 239, 243),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserListScreen()),
            );

            /*

              MaterialPageRoute(
                builder: (context) => const UserListScreen(),
              );

              */
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  icon,
                  size: 30.0,
                  color: Color.fromARGB(255, 241, 162, 42),
                ),
                const SizedBox(height: 8.0),
                Text(
                  title,
                  style: const TextStyle(fontSize: 14.0, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Card makeDashboardItem1(String title, IconData icon) {
    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 237, 239, 243),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const employeeList()),
            );

            /*

              MaterialPageRoute(
                builder: (context) => const UserListScreen(),
              );

              */
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  icon,
                  size: 30.0,
                  color: Color.fromARGB(255, 240, 58, 194),
                ),
                const SizedBox(height: 8.0),
                Text(
                  title,
                  style: const TextStyle(fontSize: 14.0, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Card makeDashboardItem2(String title, IconData icon) {
    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 237, 239, 243),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => collegelists()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  icon,
                  size: 30.0,
                  color: Color.fromARGB(255, 46, 241, 215),
                ),
                const SizedBox(height: 8.0),
                Text(
                  title,
                  style: const TextStyle(fontSize: 14.0, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Card makeDashboardItem3(String title, IconData icon) {
    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 237, 239, 243),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MaterialApp(
                        debugShowCheckedModeBanner: false,
                        home: Bottom(),
                      )),
            );

            /*

              MaterialPageRoute(
                builder: (context) => const UserListScreen(),
              );

              */
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  icon,
                  size: 30.0,
                  color: Color.fromARGB(255, 92, 54, 19),
                ),
                const SizedBox(height: 8.0),
                Text(
                  title,
                  style: const TextStyle(fontSize: 14.0, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Card makeDashboardItem4(String title, IconData icon) {
    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 237, 239, 243),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EventCalendarScreen()),
            );

            /*

              MaterialPageRoute(
                builder: (context) => const UserListScreen(),
              );

              */
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  icon,
                  size: 30.0,
                  color: Color.fromARGB(255, 25, 245, 36),
                ),
                const SizedBox(height: 8.0),
                Text(
                  title,
                  style: const TextStyle(fontSize: 14.0, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Card makeDashboardItem5(String title, IconData icon) {
    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 237, 239, 243),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotesPage()),
            );

            /*

              MaterialPageRoute(
                builder: (context) => const UserListScreen(),
              );

              */
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  icon,
                  size: 30.0,
                  color: Color.fromARGB(255, 236, 24, 24),
                ),
                const SizedBox(height: 8.0),
                Text(
                  title,
                  style: const TextStyle(fontSize: 14.0, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
