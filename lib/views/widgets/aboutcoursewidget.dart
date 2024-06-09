import 'package:bottom/views/screens/videoscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class Aboutcoursewidget extends StatefulWidget {
  final lessons;
  const Aboutcoursewidget({super.key, required this.lessons});

  @override
  State<Aboutcoursewidget> createState() => _AboutcoursewidgetState();
}

class _AboutcoursewidgetState extends State<Aboutcoursewidget> {
  ontap() {
    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      return Videoscreen(lessons:widget.lessons);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {
        ontap();
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: NetworkImage(
                widget.lessons['mainURL'],
              ),
              fit: BoxFit.cover),
        ),
        child: Text(
          widget.lessons['title'],
          style: GoogleFonts.aBeeZee(
              fontSize: 23, fontWeight: FontWeight.w600, color: Colors.red),
        ),
      ),
    );
    ;
  }
}
