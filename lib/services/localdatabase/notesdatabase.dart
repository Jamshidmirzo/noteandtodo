import 'package:bottom/models/note.dart';
import 'package:bottom/services/localdatabase/localdatabase.dart';

class Notesdatabase {
  final _localdatabase = Localdatabase();

  void createDatabase() async {
    final db = await _localdatabase.database;
  }

  Future<Note?> addNote(String title, String date) async {
    final db = await _localdatabase.database;
    await db.insert('notes', {'title': title, 'date': date});
  }

  Future<List<Note>> getNotes() async {
    final db = await _localdatabase.database;
    List<Note> notes = [];
    final rows = await db.query('notes');
    for (var row in rows) {
      notes.add(
        Note(
          title: row['title'] as String,
          date: row['date'] as String,
          id: row['id'].toString(),
        ),
      );
    }
    return notes;
  }

  Future<int> updateNote(String title, String date, String id) async {
    final db = await _localdatabase.database;
    final rows = await db.update(
      'notes',
      {
        'title': title,
        'date': date,
      },
      where: 'id = ?',
      whereArgs: [int.parse(id)],
    );
    return rows;
  }

  deleteNote(String id) async {
    final db = await _localdatabase.database;
    db.delete('notes', where: 'id=${int.parse(id)}');
  }
}
