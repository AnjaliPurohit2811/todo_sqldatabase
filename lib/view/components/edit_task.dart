import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/todo_controller.dart';

class EditTaskDialog extends StatelessWidget {
  final Map<String, dynamic> task;
  final TextEditingController taskNameController;
  final TextEditingController noteController;
  final RxInt priority;
  final RxBool isDone;

  EditTaskDialog({required this.task})
      : taskNameController = TextEditingController(text: task['task_name']),
        noteController = TextEditingController(text: task['note']),
        priority = RxInt(task['priority']),
        isDone = RxBool(task['is_done'] == 1);

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.find();

    return AlertDialog(
      title: Text('Edit Task'),
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
          Obx(() {
            return CheckboxListTile(
              title: Text('Done'),
              value: isDone.value,
              onChanged: (value) {
                isDone.value = value!;
              },
            );
          }),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            todoController.updateTask(
              task['id'],
              taskNameController.text,
              noteController.text,
              priority.value,
              isDone.value,
            );
            Get.back();
          },
          child: Text('Save'),
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
