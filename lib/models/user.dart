import 'package:hive/hive.dart';

part 'user.g.dart';

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
  bool? active;

  @HiveField(6)
  String? country;

  @HiveField(7)
  String? phone;

  @HiveField(8)
  int? userType;

  @HiveField(9)
  UserTypeInformation? userTypeInfo;

  @HiveField(10)
  DateTime? lastLogin;

  @HiveField(11)
  DateTime? createdAt;

  @HiveField(12)
  DateTime? updatedAt;

  User();

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        firstName = json['first_name'],
        lastName = json['last_name'],
        email = json['email'],
        password = json['password'],
        active = json['active'],
        country = json['country'],
        phone = json['phone'],
        userType = json['user_type'],
        userTypeInfo = UserTypeInformation.fromJson(json['user_type_info']),
        lastLogin = DateTime.parse(json['last_login']),
        createdAt = DateTime.parse(json['created_at']),
        updatedAt = DateTime.parse(json['updated_at']);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
      'active': active,
      'country': country,
      'phone': phone,
      'user_type': userType,
      'user_type_info': userTypeInfo?.toJson(),
      'last_login': lastLogin?.toIso8601String(),
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}

@HiveType(typeId: 1)
class UserTypeInformation {
  @HiveField(0)
  late int id;

  @HiveField(1)
  late String userType;

  UserTypeInformation();

  UserTypeInformation.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userType = json['user_type'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_type': userType,
    };
  }
}
