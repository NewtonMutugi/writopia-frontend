import 'package:hive/hive.dart';

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
  bool? active;

  @HiveField(6)
  DateTime? dateJoined;

  @HiveField(7)
  DateTime? lastLogin;

  User();

  User.fromJson(Map<dynamic, dynamic> json)
      : id = json["id"],
        password = json["password"],
        firstName = json["first_name"],
        lastName = json["last_name"],
        email = json["email"],
        active = json["active"],
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
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
      'date_joined': dateJoined?.toIso8601String(),
    };
  }

  Map<String, String> toLoginJson() {
    return {"username": email!, "password": password!};
  }
}
