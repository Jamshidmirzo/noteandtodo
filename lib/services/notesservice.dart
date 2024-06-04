import 'dart:convert';

import 'package:bottom/models/note.dart';
import 'package:http/http.dart' as http;

class Notesservice {
  Future<List<Note>> getTask() async {
    Uri url =
        Uri.parse('https://f6b61-default-rtdb.firebaseio.com/.json');
    final responce = await http.get(url);
    final data = jsonDecode(responce.body);
    List<Note> loadedTasks = [];
    data.forEach((key, value) {
      print(key);
      value['id'] = key;
      loadedTasks.add(Note.fromJson(value));
    });
    return loadedTasks;
  }
}
