import 'package:bottom/views/screens/aboutcourse.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class Courseswidget extends StatefulWidget {
  final course;
  const Courseswidget({super.key, required this.course});

  @override
  State<Courseswidget> createState() => _CourseswidgetState();
}

class _CourseswidgetState extends State<Courseswidget> {
  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) {
              return Aboutcourse(
                course: widget.course,
              );
            },
          ),
        );
      },
      child: Card(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.course.imageURL),
                fit: BoxFit.cover)),
        child: ListTile(
          title: Text(
            widget.course.title,
            style: GoogleFonts.abel(
                fontWeight: FontWeight.bold, fontSize: 23, color: Colors.red),
          ),
        ),
      )),
    );
    ;
  }
}
