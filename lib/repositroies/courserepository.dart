import 'package:bottom/models/course.dart';
import 'package:bottom/models/newcourse.dart';
import 'package:bottom/services/http/courseservice.dart';

class Courserepository {
  final courseservice = Courseservice();
  Future<List<Course>> getCourse() async {
    return courseservice.getCourse();
  }

  Future<List<Newcourse>> getnewCourse() async {
    return courseservice.getCoursenew();
  }

  Future<void> addCourse(String name, String imageURL) {
    return courseservice.addCourseToNew(name, imageURL);
  }
}
