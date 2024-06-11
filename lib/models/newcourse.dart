import 'package:json_annotation/json_annotation.dart';
part 'newcourse.g.dart';
@JsonSerializable()
class Newcourse {
  String title;
  String id;
  String imageURL;
  String creatorID;
  Newcourse(
      {required this.title,
      required this.imageURL,
      required this.creatorID,
      required this.id});
}
