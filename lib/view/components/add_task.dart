import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/todo_controller.dart';

class AddTaskDialog extends StatelessWidget {
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final RxInt priority = 1.obs;

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.find();

    return AlertDialog(
      title: Text('Add Task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: taskNameController,
            decoration: InputDecoration(labelText: 'Task Name'),
          ),
          TextField(
            controller: noteController,
            decoration: InputDecoration(labelText: 'Note'),
          ),
          Obx(() {
            return DropdownButton<int>(
              value: priority.value,
              items: [
                DropdownMenuItem(value: 1, child: Text('Low')),
                DropdownMenuItem(value: 2, child: Text('Medium')),
                DropdownMenuItem(value: 3, child: Text('High')),
              ],
              onChanged: (value) {
                priority.value = value!;
              },
            );
          }),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            todoController.addTask(
              taskNameController.text,
              noteController.text,
              priority.value,
            );
            Get.back();
          },
          child: Text('Add'),
        ),
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }
}
