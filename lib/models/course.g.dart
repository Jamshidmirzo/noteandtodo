// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      descrption: json['descrption'] as String? ?? '',
      id: json['id'] as String? ?? '',
      imageURL: json['imageURL'] as String? ?? '',
      lessons: json['lessons'] as String? ?? '',
      title: json['title'] as String? ?? '',
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'descrption': instance.descrption,
      'imageURL': instance.imageURL,
      'lessons': instance.lessons,
      'price': instance.price,
    };
