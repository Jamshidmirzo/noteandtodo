// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      description: json['description'] as String? ?? '',
      id: json['id'] as String? ?? '',
      imageURL: json['imageURL'] as String? ?? '',
      lessons: json['lessons'] as List<dynamic>? ?? [],
      title: json['title'] as String? ?? '',
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'imageURL': instance.imageURL,
      'lessons': instance.lessons,
      'price': instance.price,
    };
