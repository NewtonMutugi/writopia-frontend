import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:writopia_frontend/constants/constants.dart';
import 'package:writopia_frontend/pages/views/user_dashboard.dart';

class DashBoardController extends GetxController {
  var selectedIndex = 0.obs;
  var pageController = PageController(viewportFraction: 1, keepPage: true).obs;
  var sideMenuController = SideMenuController().obs;
  RxString currentUser = 'standard'.obs;
  RxString userName = 'Newton'.obs;

  DashBoardController() {
    sideMenuController.value.addListener((index) {
      pageController.value.jumpToPage(index);
    });
  }
  @override
  void onReady() {
    // if (currentUser!.lastLogin == null) {
    //   if (currentUser!.currentPosition == "admin") {
    //     sideMenuController.value.changePage(4);
    //   } else {
    //     sideMenuController.value.changePage(3);
    //   }
    // }
    super.onReady();
  }

  void changePage(int index, SideMenuController? _) {
    // if (currentUser!.lastLogin == null) {
    //   Get.snackbar(
    //     "Verification procedure not complete",
    //     "Please complete your profile to continue",
    //     icon: const Icon(
    //       CupertinoIcons.xmark_circle,
    //       color: Colors.red,
    //     ),
    //     maxWidth: 500,
    //     backgroundColor: Colors.white,
    //   );
    //   return;
    // }
    sideMenuController.value.changePage(index);
  }

  List<SideMenuItem> buildSideMenuItems() {
    // if (currentUser?.currentPosition == "admin") {
    if (currentUser == "admin") {
      // Admin User view
      return <SideMenuItem>[
        SideMenuItem(
          title: "Dashboard",
          icon: const Icon(CupertinoIcons.house_fill),
          onTap: (index, _) {
            changePage(index, _);
          },
        ),
        SideMenuItem(
          title: "Manage tasks",
          icon: const Icon(Icons.checklist),
          onTap: (index, _) {
            changePage(index, _);
          },
        ),
        SideMenuItem(
          title: "Manage payouts",
          icon: const Icon(Icons.payment),
          onTap: (index, _) {
            changePage(index, _);
          },
        ),
        SideMenuItem(
          title: "Manage users",
          icon: const Icon(CupertinoIcons.person_3_fill),
          onTap: (index, _) {
            changePage(index, _);
          },
        ),
        SideMenuItem(
          title: "Settings",
          icon: const Icon(Icons.settings_sharp),
          onTap: (index, _) {
            changePage(index, _);
          },
        ),
        SideMenuItem(
          title: "Logout",
          icon: const Icon(Icons.exit_to_app),
          onTap: (index, _) {
            // logout();
          },
        ),
      ];
    }

    // Standard User view
    return <SideMenuItem>[
      SideMenuItem(
        title: "Dashboard",
        icon: const Icon(CupertinoIcons.house_fill),
        onTap: (index, _) {
          changePage(index, _);
        },
      ),
      SideMenuItem(
        title: "My tasks",
        icon: const Icon(Icons.checklist),
        onTap: (index, _) {
          changePage(index, _);
        },
      ),
      SideMenuItem(
        title: "My payouts",
        icon: const Icon(Icons.payment),
        onTap: (index, _) {
          changePage(index, _);
        },
      ),
      SideMenuItem(
        title: "Settings",
        icon: const Icon(Icons.settings_sharp),
        onTap: (index, _) {
          changePage(index, _);
        },
      ),
      SideMenuItem(
        title: "Logout",
        icon: const Icon(Icons.exit_to_app),
        onTap: (index, _) {
          // logout();
        },
      ),
    ];
  }

  List<Widget> buildPages() {
    // if (currentUser?.currentPosition! == "admin") {
    if (currentUser == "admin") {
      // Admin User view
      return const [
        SizedBox(
          child: Placeholder(),
        ),
        SizedBox(
          child: Placeholder(),
        ),
        Center(
          child: Placeholder(),
        ),
        SizedBox(
          child: Placeholder(),
        ),
        SizedBox(
          child: Placeholder(),
        ),
      ];
    }

    // Standard User Views
    return const [
      Center(
        child: UserDashboard(),
      ),
      SizedBox(
        child: Placeholder(),
      ),
      SizedBox(
        child: Placeholder(),
      ),
      Center(
        child: SizedBox(
          child: Placeholder(),
        ),
      ),
    ];
  }

  // void logout() async {
  //   await Get.dialog(
  //     AlertDialog(
  //       title: const Text("Are you sure you want to leave?"),
  //       content: const Text("You will have to relogin again"),
  //       actions: [
  //         ElevatedButton(
  //           style: ElevatedButton.styleFrom(
  //             backgroundColor: Colors.red,
  //           ),
  //           child: const Text('Sure'),
  //           onPressed: () {
  //             Get.delete<DashBoardController>();
  //             Get.delete<HomePageController>();
  //             clearData();
  //           },
  //           // ** result: returns this value up the call stack **
  //         ),
  //         const SizedBox(
  //           width: 5,
  //         ),
  //         ElevatedButton(
  //           child: const Text('Cancel'),
  //           onPressed: () => Get.back(result: false),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // void clearData() async {
  //   currentUser = null;
  //   await appDB.clear();
  //   const GetSnackBar(
  //     title: "Success",
  //     icon: Icon(
  //       CupertinoIcons.checkmark_circle_fill,
  //       color: Colors.green,
  //     ),
  //     message: "You are now logged out",
  //   );
  //   await Get.offAllNamed("/login");
  // }

  // String getUserFirstName() {
  //   return currentUser?.firstName ?? "";
  // }

  // String getUserPosition() {
  //   return currentUser?.currentPosition ?? "";
  // }
}
