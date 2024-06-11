// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newcourse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Newcourse _$NewcourseFromJson(Map<String, dynamic> json) => Newcourse(
      title: json['title'] as String? ?? '',
      imageURL: json['imageURL'] as String? ?? '',
      creatorID: json['creatorID'] as String? ?? '',
      id: json['id'] as String? ?? '',
    );

Map<String, dynamic> _$NewcourseToJson(Newcourse instance) => <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'imageURL': instance.imageURL,
      'creatorID': instance.creatorID,
    };
