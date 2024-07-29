import 'package:get/get.dart';
import '../helper/database_helper.dart';

class TodoController extends GetxController {
  var tasks = [].obs;
  final DatabaseHelper dbHelper = DatabaseHelper();

  @override
  void onInit() {
    super.onInit();
    fetchTasks();
  }

  void fetchTasks() async {
    tasks.assignAll(await dbHelper.getTasks());
  }

  void addTask(String taskName, String note, int priority) async {
    await dbHelper.insertTask({
      'task_name': taskName,
      'is_done': 0,
      'note': note,
      'priority': priority,
    });
    fetchTasks();
  }

  void updateTask(int id, String taskName, String note, int priority, bool isDone) async {
    await dbHelper.updateTask({
      'id': id,
      'task_name': taskName,
      'is_done': isDone ? 1 : 0,
      'note': note,
      'priority': priority,
    });
    fetchTasks();
  }

  void deleteTask(int id) async {
    await dbHelper.deleteTask(id);
    fetchTasks();
  }

  void checkTask(int id, bool isDone) async {
    var task = tasks.firstWhere((element) => element['id'] == id);
    task['is_done'] = isDone ? 1 : 0;
    await dbHelper.updateTask(task);
    fetchTasks();
  }
}
