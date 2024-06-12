import 'package:bottom/models/course.dart';
import 'package:bottom/models/newcourse.dart';
import 'package:bottom/repositroies/courserepository.dart';

class Coursescontroller {
  List<Course> _list = [];
  List<Newcourse> _newlist = [];
  final courserepository = Courserepository();
  Future<List<Course>> getCourse() async {
    _list = await courserepository.getCourse();
    return [..._list];
  }

  Future<List<Newcourse>> getNewcourse() async {
    _newlist = await courserepository.getnewCourse();
    return [..._newlist];
  }

  Future<void> addCourse(String name, String imageURL) {
    return courserepository.addCourse(name, imageURL);
  }

  Future<void> fetchbyID() {
    return courserepository.fetbyid();
  }
}
