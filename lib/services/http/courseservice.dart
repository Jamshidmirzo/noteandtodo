import 'dart:convert';

import 'package:bottom/models/course.dart';
import 'package:bottom/models/newcourse.dart';
import 'package:bottom/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Courseservice {
  Future<List<Course>> getCourse() async {
    Uri url = Uri.parse(
        'https://courses-57a9c-default-rtdb.firebaseio.com/courses.json');
    final responce = await http.get(url);
    final data = jsonDecode(responce.body);
    List<Course> loadedcourses = [];
    data.forEach((key, value) {
      value['id'] = key;
      loadedcourses.add(Course.fromJson(value));
    });

    return loadedcourses;
  }

  Future<void> addCourseToNew(String name, String imageURL) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();

    final userData = sharedPref.getString('userData');
    final user = User.fromMap(jsonDecode(userData!));

    Uri url = Uri.parse(
        'https://coursess-c409a-default-rtdb.firebaseio.com/courser.json');

    final Map<String, dynamic> courseData = {
      'title': name,
      'imageURL': imageURL,
      'creatorID': user.id,
    };

    final response = await http.post(
      url,
      body: jsonEncode(courseData),
    );

    print(response.body);
  }

  Future<List<Newcourse>> getCoursenew() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();

    final userData = sharedPref.getString('userData');
    final user = User.fromMap(jsonDecode(userData!));
    final id = user.id;
    Uri url = Uri.parse(
        'https://coursess-c409a-default-rtdb.firebaseio.com/courser.json?orderBy="creatorID"&equalTo="$id"');
    final responce = await http.get(url);
    final data = jsonDecode(responce.body);
    List<Newcourse> loadedcourses = [];
    data.forEach(
      (key, value) {
        loadedcourses.add(
          Newcourse(
            id: key,
            title: value['title'],
            imageURL: value['imageURL'],
            creatorID: value['creatorID'],
          ),
        );
      },
    );

    return loadedcourses;
  }

  Future<void> fetchCoursesByCreatorID() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();

    final userData = sharedPref.getString('userData');
    final user = User.fromMap(jsonDecode(userData!));
    final id = user.id;
    Uri url = Uri.parse(
        'https://coursess-c409a-default-rtdb.firebaseio.com/courser.json?orderBy="creatorID"&equalTo="$id"');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> courses = jsonDecode(response.body);
      courses.forEach((key, value) {
        print('Course ID: $key, Data: $value');
      });
    } else {
      print('Failed to load courses: ${response.statusCode}');
    }
  }
}
