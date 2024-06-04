import 'package:bottom/models/note.dart';
import 'package:bottom/services/notesservice.dart';

class Noterepository {
  final noteservice = Notesservice();
  Future<List<Note>> getNote() async {
    return noteservice.getTask();
  }
}
