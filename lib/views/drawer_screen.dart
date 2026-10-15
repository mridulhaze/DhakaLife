import 'package:flutter/material.dart';
import 'package:flutter_project_nutcm_1/pages/profile_page.dart';
import 'package:flutter_project_nutcm_1/views/dashboard2.dart';
import 'package:flutter_project_nutcm_1/views/login_screen.dart';
import 'package:flutter_project_nutcm_1/views/notices.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_project_nutcm_1/controllers/data_controller.dart';
import 'package:flutter_project_nutcm_1/views/login_user_product_screen.dart';
import 'package:flutter_project_nutcm_1/data/model/add_date.dart';
import 'package:flutter_project_nutcm_1/event_calendar.dart';
import 'package:flutter_project_nutcm_1/views/notes.DART';
import '../user_list.dart';
import 'collegesLists.dart';
import 'employee.DART';

class AppDrawer extends StatelessWidget {
  DataController get controller =>
      Get.isRegistered<DataController>() ? Get.find<DataController>() : Get.put(DataController());

  String _formatJoinDate(dynamic joinDate) {
    if (joinDate == null || joinDate == '') return 'Guest User';
    try {
      if (joinDate is int) {
        return DateFormat.yMMMMd().format(DateTime.fromMillisecondsSinceEpoch(joinDate));
      }
      final parsed = int.tryParse(joinDate.toString());
      if (parsed != null) {
        return DateFormat.yMMMMd().format(DateTime.fromMillisecondsSinceEpoch(parsed));
      }
    } catch (_) {}
    return 'Active User';
  }

  @override
  Widget build(BuildContext context) {
    final userName = controller.userProfileData['userName'];
    final displayName = (userName != null && userName.toString().isNotEmpty)
        ? userName.toString()
        : 'ঢাকাবাসী (Dhaka Citizen)';

    return SafeArea(
      child: Container(
        width: 240,
        child: Drawer(
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0D47A1), Color(0xFF1976D2)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      displayName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'স্ট্যাটাস: ${_formatJoinDate(controller.userProfileData['joinDate'])}',
                      style: const TextStyle(
                        color: Color(0xFFE2E8F0),
                        fontSize: 11.5,
                      ),
                    ),
                  ],
                ),
              ),

              /*
              ListTile(
                leading: Icon(Icons.home_max),
                title: const Text('Home'),
                onTap: () {
                  // Get.back();
                  // Get.off(() => HomeScreen());
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
              ),
              */
              ListTile(
                leading: Icon(Icons.person),
                title: const Text('Your Notices'),
                onTap: () {
                  Get.back();
                  Get.to(() => LoginUserProductScreen());
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: const Text('All Notices'),
                onTap: () {
                  Get.back();
                  Get.to(() => NoticeScreen());
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: const Text('Employee'),
                onTap: () {
                  Get.back();
                  Get.to(() => const employeeList());
/*
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const employeeList()),
                */
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: const Text('Colleges'),
                onTap: () {
                  Get.back();
                  Get.to(() => const collegelists());
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: const Text('Locations'),
                onTap: () {
                  Get.back();
                  Get.to(() => const UserListScreen());
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: const Text('Calender'),
                onTap: () {
                  Get.back();
                  Get.to(() => const EventCalendarScreen());
                },
              ),
              ListTile(
                leading: const Icon(Icons.info_outline, color: Color(0xFF1E88E5)),
                title: const Text('পরিচিতি ও ডেভেলপার (About)'),
                onTap: () {
                  Get.back();
                  Get.to(() => const ProfilePage());
                },
              ),
              ListTile(
                leading: const Icon(Icons.login, color: Color(0xFF1E88E5)),
                title: const Text('লগইন (Login Screen)'),
                onTap: () {
                  Get.back();
                  Get.to(() => LoginScreen());
                },
              ),
              ListTile(
                leading: const Icon(Icons.menu_book, color: Color(0xFF64748B)),
                title: const Text('User Manual'),
                onTap: () {
                  Get.off(() => NotesPage());
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Color(0xFFEF4444)),
                title: const Text('LogOut'),
                onTap: () {
                  Get.off(() => LoginScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

////////////////////////////////////////////////
