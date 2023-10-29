import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<String> categories = ["Arts", "Social Sciences", "Music", "Theology"];

class NewUserAssignment extends StatelessWidget {
  const NewUserAssignment({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "New Assignment",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.plus_circle_fill),
              ),
            ],
          ),
        ),
        // Form for registering new assignments based on the assignment model that allows you to select the category based on a drop down
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Title",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Description",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Number of pages",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter the number of pages";
                    }
                    int num = int.parse(value);
                    if (num < 1) {
                      return "Please enter a valid number of pages";
                    }
                  },
                ),
                const SizedBox(height: 20),
                // Date time selector
                DateTimeFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.event_note),
                    labelText: 'Due Date',
                  ),
                  mode: DateTimeFieldPickerMode.date,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (e) =>
                      (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                  onDateSelected: (DateTime value) {
                    debugPrint(value.toString());
                  },
                ),
                const SizedBox(height: 20),
                DropdownMenu(
                  dropdownMenuEntries:
                      categories.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(
                      value: value,
                      label: value,
                    );
                  }).toList(),
                  hintText: "Category",
                  enableSearch: false,
                  initialSelection: categories.first,
                  onSelected: (value) {
                    debugPrint(value);
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Dialog that shows total cost and payment methods
                    Get.defaultDialog(
                      title: "Payment",
                      content: Column(
                        children: [
                          const Text("Total cost: \$100"),
                          const SizedBox(height: 20),
                          const Text("Payment methods"),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text("Paypal"),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text("Credit Card"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
