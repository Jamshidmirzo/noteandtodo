import 'package:bottom/models/note.dart';
import 'package:bottom/services/notesservice.dart';

class Noterepository {
  final Notesservice noteService = Notesservice();

  Future<List<Note>> getNote() async {
    return noteService.getTask();
  }

  Future<void> editTasks(String id, String title, String date) async {
    return noteService.editTasks(id, title, date);
  }

  Future<Note?> addTask(String title, String date) async {
    return noteService.addTask(title, date);
  }

  Future<void> deleteTask(String id) async {
    return noteService.isDelete(id);
  }
}
