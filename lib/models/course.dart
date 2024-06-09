import 'package:json_annotation/json_annotation.dart';
part 'course.g.dart';

@JsonSerializable()
class Course {
  String id;
  String title;
  String description;
  String imageURL;
  List<dynamic> lessons;
  // String lessons;
  double price;
  Course(
      {required this.description,
      required this.id,
      required this.imageURL,
      required this.lessons,
      required this.title,
      required this.price});
  factory Course.fromJson(Map<String, dynamic> json) {
    print(json);
    return _$CourseFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$CourseToJson(this);
  }
}
