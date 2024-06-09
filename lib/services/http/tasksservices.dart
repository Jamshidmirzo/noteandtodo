import 'dart:convert';
import 'package:bottom/models/task.dart';

import 'package:http/http.dart' as http;

class Tasksservices {
  final String baseUrl = "https://todo-e79e8-default-rtdb.firebaseio.com/tasks";
  Future<List<Task>> getTasks() async {
    Uri url =
        Uri.parse('https://todo-e79e8-default-rtdb.firebaseio.com/tasks.json');
    final response = await http.get(url);
    final data = jsonDecode(response.body);

    List<Task> loadedTasks = [];
    data.forEach((key, value) {
      value['id'] = key;
      loadedTasks.add(Task.fromJson(value));
    });
    return loadedTasks;
  }

  Future<Task?> addTask(String title, String date, bool isDone) async {
    Uri url =
        Uri.parse('https://todo-e79e8-default-rtdb.firebaseio.com/tasks.json');
    Map<String, dynamic> taskData = {
      'title': title,
      'date': date,
      'isDone': isDone
    };

    final response = await http.post(url, body: jsonEncode(taskData));
    final data = jsonDecode(response.body);
    if (data != null) {
      taskData['id'] = data['name'];

      return Task.fromJson(taskData);
    }
    return null;
  }

  Future<bool> editTasks(
      String id, String title, String date, bool isDone) async {
    print("Bu $id");
    Uri url = Uri.parse(
        'https://todo-e79e8-default-rtdb.firebaseio.com/tasks/$id.json');
    Map<String, dynamic> taskData = {
      'title': title,
      'date': date,
      'isDone': false,
      'id': id
    };
    final response = await http.patch(url, body: jsonEncode(taskData));
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> isDelete(String id) async {
    Uri url = Uri.parse('$baseUrl/$id.json');
    final response = await http.delete(url);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return true;
    }
    return false;
  }
}
