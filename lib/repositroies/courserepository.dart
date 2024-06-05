import 'package:bottom/models/course.dart';
import 'package:bottom/services/courseservice.dart';

class Courserepository {
  final courseservice = Courseservice();
  Future<List<Course>> getCourse() async {
    return courseservice.getCourse();
  }
}
