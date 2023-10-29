import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:writopia_frontend/constants/themes.dart';
import 'package:writopia_frontend/controllers/dashboard_controller.dart';
import 'package:writopia_frontend/widgets/logo_text.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final DashBoardController dashBoardController =
      Get.put(DashBoardController());
  final firstname = "Newton";
  late String position;

  @override
  void initState() {
    super.initState();
    position =
        dashBoardController.currentUser.value == "admin" ? "admin" : "standard";
  }

  bool isSideMenuOpen = false;

  void toggleSideMenu() {
    setState(() {
      isSideMenuOpen = !isSideMenuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width <
              600) // Show button on small devices
            IconButton(
              icon: Icon(isSideMenuOpen ? Icons.menu_open : Icons.menu),
              onPressed: toggleSideMenu,
            ),
          if (isSideMenuOpen || MediaQuery.of(context).size.width >= 600)
            Container(
              color: Colors.white,
              width: 250,
              child: SideMenu(
                footer: const Text("Debug Release"),
                collapseWidth: 250,
                title: Padding(
                  padding: const EdgeInsets.only(
                      top: 12, bottom: 10, left: 60, right: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: LogoText(),
                      ),
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.transparent,
                        child: Image.asset("assets/images/profile.png"),
                      ),
                      Text(
                        "$firstname - $position",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                items: dashBoardController.buildSideMenuItems(),
                controller: dashBoardController.sideMenuController.value,
                style: sideMenuStyle,
              ),
            ),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: dashBoardController.pageController.value,
              children: dashBoardController.buildPages(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          RxString user = "admin".obs;
          dashBoardController.currentUser = user;
          Get.offAndToNamed('/dashboard');
        },
        child: const Icon(CupertinoIcons.ant),
      ),
    );
  }
}
