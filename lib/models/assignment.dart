import 'package:hive/hive.dart';

// part 'assignment.g.dart';

@HiveType(typeId: 1)
class Assignment {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  String? description;

  @HiveField(3)
  DateTime? dueDate;

  @HiveField(4)
  int? numberOfPages;

  // file attachments
  @HiveField(5)
  String? file;

  @HiveField(6)
  double? cost;

  @HiveField(7)
  bool? completed;

  @HiveField(8)
  int? userId;

  @HiveField(9)
  int? categoryId;

  Assignment();

  Assignment.fromJson(Map<dynamic, dynamic> json)
      : id = json["id"],
        title = json["title"],
        description = json["description"],
        dueDate = DateTime.parse(json["due_date"]),
        numberOfPages = json["number_of_pages"],
        file = json["file"],
        cost = json["cost"],
        completed = json["completed"],
        userId = json["userId"],
        categoryId = json["categoryId"];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'due_date': dueDate?.toIso8601String(),
      'completed': completed,
      'user_id': userId,
      'category_id': categoryId,
    };
  }
}
