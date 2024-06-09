import 'package:bottom/models/task.dart';
import 'package:bottom/services/localdatabase/localdatabase.dart';

class Tasksdatabase {
  final locladatabase = Localdatabase();
  void crearteDatabase() async {
    final db = await locladatabase.database;
  }

  Future<List<Task>> getTask() async {
    final db = await locladatabase.database;
    List<Task> tasks = [];
    final rows = await db.query('tasks');

    for (var row in rows) {
      tasks.add(
        Task(
          title: row['title'] as String,
          date: row['date'] as String,
          id: row['id'] as String,
        ),
      );
    }
    return tasks;
  }

  Future<Task?> addTask(String title, String date, bool isDone) async {
    final db = await locladatabase.database;
    await db.insert('tasks', {'title': title, 'date': date, 'isDone': isDone});
  }
}
