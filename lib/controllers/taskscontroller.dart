import 'package:bottom/models/task.dart';
import 'package:bottom/repositroies/tasksrepositroeis.dart';

class TasksController {
  final TasksRepositories taskRepository = TasksRepositories();
  List<Task> _list = [];

  Future<List<Task>> get list async {
    if (_list.isEmpty) {
      await _fetchTasksfromsql();
    }

    return [..._list];
  }

  Future<void> _fetchTasks() async {
    _list = await taskRepository.getTasks();
  }

  Future<void> addTask(String title, String date) async {
    bool isDone = false;
    final newTask = await taskRepository.addTask(title, date, isDone);
    if (newTask != null) {
      _list.add(newTask);
    }
  }

  Future<bool> editTasks(
    String id,
    String title,
    String date,
    bool isDone,
  ) async {
    bool isSuccess = await taskRepository.editTasks(id, title, date, isDone);
    if (isSuccess) {
      _list = await taskRepository.getTasks();
      return isSuccess;
    }
    return isSuccess;
  }

  isDelete(String id) async {
    // _list.removeWhere((task) {
    //   return task.id == id;
    // });
    taskRepository.isdelete(id);
  }

  void createDB() {
    taskRepository.createDB();
  }

  Future<void> _fetchTasksfromsql() async {
    _list = await taskRepository.getTasksfromsql();
  }
   Future<void> addTasktosql(String title, String date) async {
    bool isDone = false;
    final newTask = await taskRepository.addTasktosql(title, date, isDone);
    if (newTask != null) {
      _list.add(newTask);
    }
  }
}
