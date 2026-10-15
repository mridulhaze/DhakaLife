import 'package:flutter_project_nutcm_1/views/login_user_product_screen.dart';
import 'package:flutter_project_nutcm_1/views/notices.dart';
import 'package:flutter_project_nutcm_1/views/profile_screen.dart';
import 'package:flutter_project_nutcm_1/views/sidebar.dart';
import 'package:flutter_project_nutcm_1/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_nutcm_1/views/employee.DART';
//import 'package:flutter_project_nutcm_1/views/collegesLists.DART';
import 'package:flutter_project_nutcm_1/views/collegesLists.dart';
import 'package:flutter_project_nutcm_1/views/notes.DART';
import 'package:flutter_project_nutcm_1/widget/bottomnavigationbar.dart';
import 'package:flutter_project_nutcm_1/event_calendar.dart';
import 'package:flutter_project_nutcm_1/views/drawer_screen.dart';
import 'package:flutter_project_nutcm_1/pages/profile_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<HomeScreen> {
/*

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

  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      //  drawer: DrawerScreen(),
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
          crossAxisCount: 3,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            makeDashboardItem("Locations", Icons.search),
            makeDashboardItem1("Employee", Icons.emoji_people),
            makeDashboardItem2("Colleges", Icons.cast_for_education),
            makeDashboardItem3("Tours Calculator", Icons.man_sharp),
            // makeDashboardItem3("Tours", Icons.man_sharp, _callBottom),
            makeDashboardItem4("Calender", Icons.alarm),
            makeDashboardItem5("User Manual", Icons.alarm),
            makeDashboardItem6("uploaded Notices", Icons.alarm),
            makeDashboardItem7("About", Icons.alarm),
            makeDashboardItem8("User Uploaded Notices", Icons.alarm)
          ],
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
          color: Color.fromARGB(255, 139, 176, 247),
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
                  color: Colors.black,
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
          color: Color.fromARGB(255, 189, 228, 243),
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
                  color: Colors.black,
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
          color: Color.fromARGB(255, 134, 231, 238),
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
                  color: Colors.black,
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
          color: Color.fromARGB(255, 143, 174, 241),
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
                  color: Colors.black,
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
          color: Color.fromARGB(255, 188, 203, 243),
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
                  color: Colors.black,
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
          color: Color.fromARGB(255, 240, 188, 135),
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
                  color: Colors.black,
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
          color: Color.fromARGB(255, 227, 245, 163),
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
                  color: Colors.black,
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
          color: Color.fromARGB(255, 176, 243, 137),
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
                  color: Colors.black,
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
          color: Color.fromARGB(255, 247, 108, 108),
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
                  color: Colors.black,
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


/*
import 'package:flutter_project_nutcm_1/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_nutcm_1/views/employee.DART';
import 'package:flutter_project_nutcm_1/views/collegesLists.dart';
import 'package:flutter_project_nutcm_1/views/notes.DART';
import 'package:flutter_project_nutcm_1/widget/bottomnavigationbar.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_project_nutcm_1/data/model/add_date.dart';
import 'package:flutter_project_nutcm_1/event_calendar.dart';
import 'package:flutter_project_nutcm_1/views/drawer_screen.DART';
import 'package:flutter_project_nutcm_1/controllers/data_controller.dart';
import 'login_user_product_screen.dart';
import 'notices.dart';

//import 'collegesLists.dart';
/*

///////////////////////////////////////////////////////////////////////////
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("T L Bills"),
      ),
      body: const Center(
        child: Text(
            'A Simple App To Search And Calculate Bill of Tour with Locations'),
      ),
    );
  }
}
//////////////////////////////////////////////////////////////////////////
///
///
*/

class HomeScreen extends StatefulWidget {
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
      // drawer: DrawerScreen(),
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
        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 1.0),
        child: GridView.count(
          crossAxisCount: 3,
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            makeDashboardItem("Locations", Icons.search),
            makeDashboardItem1("Employee", Icons.emoji_people),
            makeDashboardItem2("Colleges", Icons.cast_for_education),
            makeDashboardItem6("All Upload Notice", Icons.notification_add),
            makeDashboardItem7("User uploded Notices", Icons.document_scanner),
            makeDashboardItem3("Tours Calculator", Icons.man_sharp),
            // makeDashboardItem3("Tours", Icons.man_sharp, _callBottom),
            makeDashboardItem4("Calender", Icons.calendar_month),
            makeDashboardItem5("User Manual", Icons.book)
          ],
        ),
      ),
    );
  }

  /////////////////////////// all notices ////////////////////

  Card makeDashboardItem7(String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
          child: new InkWell(
            /*
            onDoubleTap: () {
              print('double tapped');
            },
            */

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginUserProductScreen()),
              );

              /*

              MaterialPageRoute(
                builder: (context) => const UserListScreen(),
              );

              */
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                  icon,
                  size: 40.0,
                  color: Colors.black,
                )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title,
                      style:
                          new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }

  //////////////////////////////all notices///////////////////

//////////////////////  notices   //////////////////////////
  ///Get.to(() => LoginUserProductScreen());

  Card makeDashboardItem6(String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
          child: new InkWell(
            /*
            onDoubleTap: () {
              print('double tapped');
            },
            */

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NoticeScreen()),
              );
              /*
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NoticeScreen()),
              );
              */
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                  icon,
                  size: 40.0,
                  color: Colors.black,
                )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title,
                      style:
                          new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }

////////////////////////////////////////////////////////////
  Card makeDashboardItem(String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
          child: new InkWell(
            /*
            onDoubleTap: () {
              print('double tapped');
            },
            */

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                  icon,
                  size: 40.0,
                  color: Colors.black,
                )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title,
                      style:
                          new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }

  Card makeDashboardItem1(String title, IconData icon) {
    return Card(
        elevation: 2.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(38, 38, 38, 0.4)),
          child: new InkWell(
            /*
            onDoubleTap: () {
              print('double tapped');
            },
            */

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                  icon,
                  size: 40.0,
                  color: Colors.black,
                )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title,
                      style:
                          new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }

  Card makeDashboardItem2(String title, IconData icon) {
    return Card(
        elevation: 3.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(255, 179, 102, 1)),
          child: new InkWell(
            /*
            onDoubleTap: () {
              print('double tapped');
            },
            */

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => collegelists()),
              );

              /*

              MaterialPageRoute(
                builder: (context) => const UserListScreen(),
              );

              */
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                  icon,
                  size: 40.0,
                  color: Colors.black,
                )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title,
                      style:
                          new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }

/*
  Card makeDashboardItem3(String title, IconData icon, Function fortap) {
    return Card(
      elevation: 4.0,
      margin: new EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(255, 260, 102, 1)),
        child: new InkWell(
          onTap: fortap(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(height: 50.0),
              Center(
                child: Icon(
                  icon,
                  size: 40.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20.0),
              new Center(
                child: new Text(
                  title,
                  style: new TextStyle(fontSize: 18.0, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
*/

  Card makeDashboardItem3(String title, IconData icon) {
    return Card(
        elevation: 4.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(255, 260, 102, 1)),
          child: new InkWell(
            /*
            onDoubleTap: () {
              print('double tapped');
            },
            */

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                  icon,
                  size: 40.0,
                  color: Colors.black,
                )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title,
                      style:
                          new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }

  Card makeDashboardItem4(String title, IconData icon) {
    return Card(
        elevation: 5.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(255, 179, 255, 2)),
          child: new InkWell(
            /*
            onDoubleTap: () {
              print('double tapped');
            },
            */

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                  icon,
                  size: 40.0,
                  color: Colors.black,
                )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title,
                      style:
                          new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }

  Card makeDashboardItem5(String title, IconData icon) {
    return Card(
        elevation: 6.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(100, 130, 102, 3)),
          child: new InkWell(
            /*
            onDoubleTap: () {
              print('double tapped');
            },
            */

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                  icon,
                  size: 40.0,
                  color: Colors.black,
                )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title,
                      style:
                          new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }
}

*/