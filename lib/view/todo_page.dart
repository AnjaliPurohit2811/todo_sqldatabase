import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../controller/todo_controller.dart';
import 'components/add_task.dart';
import 'components/edit_task.dart';

class TodoPage extends StatelessWidget {
  final TodoController todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TODO App')),
      body: Obx(() {
        return ListView.builder(
          itemCount: todoController.tasks.length,
          itemBuilder: (context, index) {
            final task = todoController.tasks[index];
            return Card(
              color: getPriorityColor(task['priority']),
              child: ListTile(
                title: Text(task['task_name']),
                subtitle: Text(task['note']),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        task['is_done'] == 1 ? Icons.check_box : Icons.check_box_outline_blank,
                        color: task['is_done'] == 1 ? Colors.green : Colors.grey,
                      ),
                      onPressed: () {
                        todoController.checkTask(task['id'], task['is_done'] == 1 ? false : true);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return EditTaskDialog(task: task);
                          },
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        todoController.deleteTask(task['id']);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AddTaskDialog();
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.green;
      case 2:
        return Colors.yellow;
      case 3:
        return Colors.red;
      default:
        return Colors.white;
    }
  }
}
