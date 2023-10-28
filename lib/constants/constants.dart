import 'package:hive/hive.dart';
import 'package:http/http.dart';

import 'package:writopia_frontend/models/user.dart';

var client = Client();
const urlPrefix = "http://localhost:8000";
// const urlPrefix = "http://momou.pythonanywhere.com";
// const urlPrefix = "http://52.207.235.233:8000";
var dbName = "wakforcedb";
late Box appDB;
late User? currentUser;

// Typical duration is 45 minutes then logout
const sessionDuration = Duration(hours: 2);

// Give the user the benefit of the doubt for 5 minutes
const checkSessionDuration = Duration(minutes: 20);
