import 'package:bottom/models/note.dart';
import 'package:bottom/services/http/notesservice.dart';
import 'package:bottom/services/localdatabase/notesdatabase.dart';

class Noterepository {
  final Notesservice noteService = Notesservice();
  final Notesdatabase notesdatabase = Notesdatabase();
  // Future<List<Note>> getNote() async {
  //   // return noteService.getTask();
  //   return notesdatabase.getNotes();
  // }

  Future<void> editTasks(String id, String title, String date) async {
    return noteService.editTasks(id, title, date);
  }

  Future<Note?> addTask(String title, String date) async {
    // return noteService.addTask(title, date);
    return notesdatabase.addNote(title, date);
  }

  Future<void> deleteTask(String id) async {
    return notesdatabase.deleteNote(id);
  }

  Future<void> createDatabase() async {
    return notesdatabase.createDatabase();
  }

  Future<List<Note>> getNotefromsql() async {
    return notesdatabase.getNotes();
  }

  Future<int> editTasksfromsql(
    String id,
    String title,
    String date,
  ) async {
    return notesdatabase.updateNote(title, date, id);
  }

  Future<void> deletefromsql(String id) async {
    return await notesdatabase.deleteNote(id);
  }
}
