import 'package:bottom/models/task.dart';
import 'package:bottom/repositroies/noterepository.dart';

class Notescontroller {
  final Noterepository notesrepopsitory = Noterepository();
  List _list = [];
  Future<List<Task>> getTask() async {
    _list = await notesrepopsitory.getNote();
    return [..._list];
  }
}
