//import 'package:flutter_project_nutcm_1/views/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_nutcm_1/views/setting_screen.dart';
import 'package:flutter_project_nutcm_1/user_list.dart';
import 'package:flutter_project_nutcm_1/pages/profile_page.dart';
import 'package:flutter_project_nutcm_1/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_project_nutcm_1/views/logout_screen.dart';

class DrawerScreen extends StatelessWidget {
  AuthController controller = Get.put(AuthController());
  DrawerScreen({Key? key}) : super(key: key);

  final List drawerMenuListname = const [
    {
      "leading": Icon(
        Icons.account_circle,
        color: Color(0xFF13C0E3),
      ),
      "title": "Search Loacations",
      "trailing": Icon(
        Icons.chevron_right,
      ),
      "action_id": 1,
    },
    {
      "leading": Icon(
        Icons.animation_rounded,
        color: Color(0xFF13C0E3),
      ),
      "title": "About Us",
      "trailing": Icon(Icons.chevron_right),
      "action_id": 2,
    },
    {
      "leading": Icon(
        Icons.help,
        color: Color(0xFF13C0E3),
      ),
      "title": "Help",
      "trailing": Icon(Icons.chevron_right),
      "action_id": 3,
    },
    {
      "leading": Icon(
        Icons.settings,
        color: Color(0xFF13C0E3),
      ),
      "title": "Settings",
      "trailing": Icon(Icons.chevron_right),
      "action_id": 4,
    },
    {
      "leading": Icon(
        Icons.exit_to_app,
        color: Color(0xFF13C0E3),
      ),
      "title": "Log Out",
      "trailing": Icon(Icons.chevron_right),
      "action_id": 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: 280,
        child: Drawer(
          child: ListView(
            children: [
              const ListTile(
                leading: CircleAvatar(
                  // backgroundImage: AssetImage('assets/images/profile.jpg'),
                  //child: Image.asset('assets/images/profile.jpg'),
                  backgroundImage: AssetImage('assets/images/profile.jpg'),

                  // backgroundImage: NetworkImage("https://photos.app.goo.gl/irt3yzXiYb1jmZdx6"),
                ),

                /*

                title: Text(
                  "Mridul Roy",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),

                */

//------------------------------------------------------------------------------
                title: Text.rich(
                    style: TextStyle(
                        color: Colors.black54), //style for all textspan
                    TextSpan(children: [
                      TextSpan(
                          text: "Mridul Roy", style: TextStyle(fontSize: 16)),
                      TextSpan(text: "             "),
                      TextSpan(
                          text: " Assistant Programmer",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: " ICT,National University",
                          style: TextStyle(color: Colors.black54, fontSize: 16))
                    ])),

                subtitle: Text(
                  "0173734488",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              //-----------------------------------------------------------------------------
              const SizedBox(
                height: 2,
              ),

              ...drawerMenuListname.map((sideMenuData) {
                return ListTile(
                  leading: sideMenuData['leading'],
                  title: Text(
                    sideMenuData['title'],
                  ),
                  trailing: sideMenuData['trailing'],
                  onTap: () {
                    Navigator.pop(context);
                    if (sideMenuData['action_id'] == 1) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const UserListScreen(),
                        ),
                      );
                    } else if (sideMenuData['action_id'] == 4) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SettingScreen(),
                        ),
                      );
                    } else if (sideMenuData['action_id'] == 5) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LogoutScreen(),
                        ),
                      );
                    }

                    /*
                     else if (sideMenuData['action_id'] == 5) {
                      Navigator.of(context).pushNamed("logout");
                    } 
                    */

                    else if (sideMenuData['action_id'] == 2) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(),
                        ),
                      );
                    }
                  },
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
