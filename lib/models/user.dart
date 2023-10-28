import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
// import 'package:wakforce/constants/constants.dart';
import 'package:writopia_frontend/constants/constants.dart';

// part 'user.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? firstName;

  @HiveField(2)
  String? lastName;

  @HiveField(3)
  String? email;

  @HiveField(4)
  String? password;

  @HiveField(5)
  bool? isActive;

  @HiveField(6)
  String? altPhoneNo;

  @HiveField(7)
  String? emergencyPhone;

  @HiveField(8)
  String? username;

  @HiveField(9)
  String? phoneNo;

  @HiveField(10)
  String? location;

  @HiveField(11)
  int? nationalID;

  @HiveField(12)
  String? levelOfEducation;

  @HiveField(13)
  String? currentPosition;

  @HiveField(14)
  DateTime? dob = DateTime.now();

  @HiveField(15)
  String? course;

  @HiveField(16)
  DateTime? dateJoined;

  @HiveField(17)
  DateTime? lastLogin;

  @HiveField(18)
  DateTime? sessionExpiry;

  User();

  User.fromJson(Map<dynamic, dynamic> json)
      : id = json["id"],
        password = json["password"],
        username = json["username"],
        firstName = json["first_name"],
        lastName = json["last_name"],
        email = json["email"],
        isActive = json["is_active"],
        phoneNo = json["phone_no"],
        altPhoneNo = json["alt_phone_no"],
        emergencyPhone = json["emergency_phone"],
        location = json["location"],
        nationalID = json["idno"] ?? 2023,
        levelOfEducation = json["level_of_edu"],
        course = json["course"],
        dob = json["dob"] != null ? DateTime.parse(json["dob"]!) : null,
        currentPosition = json["current_position"],
        sessionExpiry = DateTime.now().add(sessionDuration),
        dateJoined = DateTime.parse(json["date_joined"]) {
    if (json["last_login"] == null) {
      lastLogin = null;
    } else {
      lastLogin = DateTime.parse(json["last_login"]);
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idno': nationalID,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
      'is_active': isActive,
      'alt_phone_no': altPhoneNo,
      'emergency_phone': emergencyPhone,
      'username': username,
      'phone_no': phoneNo,
      'location': location,
      'national_id': nationalID,
      'level_of_education': levelOfEducation,
      'current_position': currentPosition,
      'dob': DateFormat('yyyy-MM-dd').format(dob!),
      'course': course,
      'date_joined': dateJoined?.toIso8601String(),
    };
  }

  Map<String, String> toLoginJson() {
    return {"username": username!, "password": password!};
  }
}
