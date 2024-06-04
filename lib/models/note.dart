import 'package:json_annotation/json_annotation.dart';
part 'note.g.dart';

@JsonSerializable()
class Note {
  String title;
  String date;
  String id;
  Note({required this.title, required this.date, required this.id});
  factory Note.fromJson(Map<String, dynamic> json) {
    return _$NoteFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$NoteToJson(this);
  }
}
