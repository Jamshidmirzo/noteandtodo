import 'package:bottom/models/note.dart';

import 'package:bottom/repositroies/noterepository.dart';

class Notescontroller {
  final Noterepository notesrepository = Noterepository();
  List<Note> _list = [];

  Future<List<Note>> getTask() async {
    // try {
    //   _list = await notesrepository.getNotefromsql();
    //   print(_list);
    //   return [..._list];
    // } catch (e) {
    //   throw Exception('Failed to load notes');
    // }
    _list = await notesrepository.getNotefromsql();
    //   print(_list);
    return [..._list];
  }

  Future<void> editTasks(String id, String title, String date) async {
    try {
      final index = _list.indexWhere((note) => note.id == id);
      if (index != 1) {
        _list[index].title = title;
        _list[index].date = date;
        await notesrepository.editTasks(id, title, date);
      }
    } catch (e) {
      throw Exception('Failed to edit note');
    }
  }

  Future<void> addTask(String title, String date) async {
    try {
      final newTask = await notesrepository.addTask(title, date);
      if (newTask != null) {
        _list.add(newTask);
      }
    } catch (e) {
      throw Exception('Failed to add note');
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      _list.removeWhere((task) => task.id == id);
      await notesrepository.deleteTask(id);
    } catch (e) {
      throw Exception('Failed to delete note');
    }
  }

  void createDatabase() {
    notesrepository.createDatabase();
  }

  Future<void> editTasksfromsql(String id, String title, String date) async {
    try {
      final index = _list.indexWhere((note) => note.id == id);
      print(index);
      _list[index].title = title;
      _list[index].date = date;
      await notesrepository.editTasksfromsql(id, title, date);
    } catch (e) {
      print(e);
      throw Exception('Failed to edit note');
    }
  }

  Future<void> deleteTaskfromsql(String id) async {
    try {
      _list.removeWhere((task) => task.id == id);
      await notesrepository.deleteTask(id);
    } catch (e) {
      throw Exception('Failed to delete note');
    }
    notesrepository.deleteTask(id);
  }
}
