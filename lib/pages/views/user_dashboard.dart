import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDashboard extends StatelessWidget {
  // final UserController userController = Get.put(UserController());
  final userFirstName = "Newton".obs;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: ListView(children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(() => Text(
                    'Welcome ${userFirstName}!',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              SizedBox(height: 16),
              const Text(
                "You have no assignments yet",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/new_assignment');
                },
                child: const Text("Create New Assignment"),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
