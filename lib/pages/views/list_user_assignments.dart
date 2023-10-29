import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:writopia_frontend/models/assignment.dart';

// dummy json based on assignment model with 5 items
String assignmentsJson = '''[
  {
    "id":1,
    "title":"Assignment 1",
    "description":"This is the first assignment",
    "due_date":"2021-10-10T00:00:00Z",
    "number_of_pages":2,
    "file":"",
    "cost":10.00,
    "completed":false,
    "user_id":1,
    "category_id":1
  },
  {
    "id":2,
    "title":"Assignment 2",
    "description":"This is the second assignment",
    "due_date":"2021-10-10T00:00:00Z",
    "number_of_pages":2,
    "file":"",
    "cost":10.00,
    "completed":false,
    "user_id":1,
    "category_id":1
  },
  {
    "id":3,
    "title":"Assignment 3",
    "description":"This is the third assignment",
    "due_date":"2021-10-10T00:00:00Z",
    "number_of_pages":2,
    "file":"",
    "cost":10.00,
    "completed":false,
    "user_id":1,
    "category_id":1
  },
  {
    "id":4,
    "title":"Assignment 4",
    "description":"This is the fourth assignment",
    "due_date":"2021-10-10T00:00:00Z",
    "number_of_pages":2,
    "file":"",
    "cost":10.00,
    "completed":false,
    "user_id":1,
    "category_id":1
  },
  {
    "id":5,
    "title":"Assignment 5",
    "description":"This is the fifth assignment",
    "due_date":"2021-10-10T00:00:00Z",
    "number_of_pages":2,
    "file":"",
    "cost":10.00,
    "completed":false,
    "user_id":1,
    "category_id":1
  }
]''';

// convert the json using Assignment.fromjson
List<Assignment> assignments = (jsonDecode(assignmentsJson) as List)
    .map((data) => Assignment.fromJson(data))
    .toList();

class ListUserAssignments extends StatelessWidget {
  const ListUserAssignments({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: ListView(shrinkWrap: true, children: [
        const Text(
          "Assignments History",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        for (var assignment in assignments)
          ListTile(
            title: Text(assignment.title!),
            subtitle: Text(assignment.description!),
            trailing:
                Text(assignment.completed! ? "Completed" : "Not Completed"),
            // Default GetX Dialog showing information about the assignment and also has button to send reminder
            onTap: () => Get.defaultDialog(
              title: "Title: ${assignment.title!}",
              content: Column(
                children: [
                  Text("Description: ${assignment.description!}"),
                  // Parse date to dd/mm/yyyy
                  Text(
                      "Due Date: ${assignment.dueDate!.day}/${assignment.dueDate!.month}/${assignment.dueDate!.year}"),
                  Text(
                      "Number of pages: ${assignment.numberOfPages!.toString()}"),
                  Text("Cost: \$${assignment.cost!.toString()}"),
                  Text("Completed: ${assignment.completed! ? "Yes" : "No"}"),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Get.back(),
                  child: Text("Close"),
                ),
                TextButton(
                  onPressed: () => Get.back(),
                  child: Text("Send Reminder"),
                ),
              ],
            ),
          )
      ]),
    );
  }
}
