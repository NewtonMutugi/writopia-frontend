import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var usernameController = TextEditingController().obs;
  var passWordController = TextEditingController().obs;
  var showPassword = true.obs;
  var isLoading = false.obs;
}
