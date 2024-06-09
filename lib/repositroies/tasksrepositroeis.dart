import 'package:bottom/models/task.dart';
import 'package:bottom/services/http/tasksservices.dart';
import 'package:bottom/services/localdatabase/tasksdatabase.dart';

class TasksRepositories {
  final Tasksservices taskHttpService = Tasksservices();
  final tasklocaldatabase = Tasksdatabase();

  Future<List<Task>> getTasks() async {
    return taskHttpService.getTasks();
  }

  Future<Task?> addTask(String title, String date, bool isDone) async {
    return taskHttpService.addTask(title, date, isDone);
  }

  Future<bool> editTasks(
      String id, String title, String date, bool isDone) async {
    return await taskHttpService.editTasks(id, title, date, isDone);
  }

  Future<bool> isdelete(String id) async {
    return taskHttpService.isDelete(id);
  }

  Future<List<Task>> getTasksfromsql() async {
    return tasklocaldatabase.getTask();
  }

  void createDB() {
    return  tasklocaldatabase.crearteDatabase();
  }
  Future<Task?> addTasktosql(String title, String date, bool isDone) async {
    return tasklocaldatabase.addTask(title, date, isDone);
  }
}
