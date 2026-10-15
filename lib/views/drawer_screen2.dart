import 'package:flutter/material.dart';
import 'package:flutter_project_nutcm_1/views/home_screen.dart';
import 'package:flutter_project_nutcm_1/views/notices.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_project_nutcm_1/controllers/data_controller.dart';
import 'package:flutter_project_nutcm_1/views/login_user_product_screen.dart';

class AppDrawer extends StatelessWidget {
  final DataController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 220,
        child: Drawer(
          child: ListView(
            children: [
              Container(
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'User : ${controller.userProfileData['userName']}',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    FittedBox(
                      child: Text(
                        // 'Joining Date : ${controller.userProfileData['joinDate']}',
                        'Join Date :${DateFormat.yMMMMd().format(DateTime.fromMillisecondsSinceEpoch(controller.userProfileData['joinDate']))} ',
                        // 'Join Date :${DateFormat.yMMMMd().format(DateTime.fromMillisecondsSinceEpoch(int.parse(controller.userProfileData['joinDate'])))} ',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
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
                title: const Text('LogOut'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

////////////////////////////////////////////////
