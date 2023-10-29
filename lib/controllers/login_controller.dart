import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:writopia_frontend/constants/constants.dart';
import 'package:writopia_frontend/models/user.dart';
import 'package:writopia_frontend/services/user_services.dart';

class LoginController extends GetxController {
  var usernameController = TextEditingController().obs;
  var passWordController = TextEditingController().obs;
  var showPassword = true.obs;
  var isLoading = false.obs;

  Future<void> login() async {
    if (usernameController.value.text.isEmpty ||
        usernameController.value.text.isEmpty) {
      showErrorMessage(
        "Form Validation Error",
        "Please ensure you fill all fields",
      );
      return;
    }

    User? user = User()
      ..email = usernameController.value.text
      ..password = passWordController.value.text;

    user = await loginUser(user);
    if(user != null){
      Get.toNamed("/dashboard");
    }
  }
}
