import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:writopia_frontend/constants/constants.dart';
import 'package:writopia_frontend/models/user.dart';
import 'package:writopia_frontend/services/user_services.dart';

class SignUpPageController extends GetxController {
  var firstNameController = TextEditingController().obs;
  var lastNameController = TextEditingController().obs;
  var idController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var confirmPasswordController = TextEditingController().obs;
  var phoneController = TextEditingController().obs;
  var countryController = TextEditingController().obs;
  var hidePassword = true.obs;
  var hideConfirmPassword = true.obs;
  var termsAccepted = false.obs;

  bool isValid() {
    return firstNameController.value.text.isNotEmpty &&
        lastNameController.value.text.isNotEmpty &&
        emailController.value.text.isNotEmpty &&
        passwordController.value.text.isNotEmpty &&
        confirmPasswordController.value.text.isNotEmpty &&
        phoneController.value.text.isNotEmpty &&
        countryController.value.text.isNotEmpty;
  }

  Future<void> signUp() async {
    if (!isValid()) {
      Get.snackbar(
        "Form Validation Error",
        "Please ensure you fill the form then try that again!",
        maxWidth: 500,
        backgroundColor: Colors.white,
        icon: const Icon(
          CupertinoIcons.xmark_circle,
          color: Colors.red,
        ),
      );

      return;
    }
    if (passwordController.value.text != confirmPasswordController.value.text) {
      showErrorMessage(
        "Form Validation Error",
        "Passwords do not match",
      );
      return;
    }

    if (termsAccepted.value == false) {
      showErrorMessage(
        "Form Validation Error",
        "Please ensure you check that you comply to the terms outlined by writopia",
      );
      return;
    }

    var user = User()
      ..firstName = firstNameController.value.text
      ..lastName = lastNameController.value.text
      ..email = emailController.value.text
      ..password = passwordController.value.text
      ..phone = phoneController.value.text
      ..country = countryController.value.text;

    var savedUser = await signUpUser(user);

    if (savedUser != null) {
      showSuccessMessage(
        "Success",
        "${savedUser.firstName} you are now registered",
      );
      Get.toNamed('/login');
    }
  }
}
