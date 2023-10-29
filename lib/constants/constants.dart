import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';

import 'package:writopia_frontend/models/user.dart';

const defaultHeader = {"Content-Type": "application/json"};

var client = Client();
const urlPrefix = "http://localhost:8080";
// const urlPrefix = "http://momou.pythonanywhere.com";
// const urlPrefix = "http://52.207.235.233:8000";
var dbName = "wakforcedb";
late Box appDB;
late User? currentUser;

// Typical duration is 45 minutes then logout
const sessionDuration = Duration(hours: 2);

// Give the user the benefit of the doubt for 5 minutes
const checkSessionDuration = Duration(minutes: 20);

var snackbar = Get.snackbar("Hello", "Hi");

void showErrorMessage(String title, String message) {
  Get.snackbar(
    title,
    message,
    maxWidth: 500,
    backgroundColor: Colors.white,
    icon: const Icon(
      CupertinoIcons.xmark_circle,
      color: Colors.red,
    ),
  );
}

void showSuccessMessage(String title, String message) {
  Get.snackbar(
    title,
    message,
    maxWidth: 500,
    backgroundColor: Colors.white,
    icon: const Icon(
      CupertinoIcons.checkmark_seal,
      color: Colors.green,
    ),
  );
}
