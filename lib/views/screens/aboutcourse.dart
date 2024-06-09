import 'package:bottom/views/widgets/aboutcoursewidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class Aboutcourse extends StatefulWidget {
  final course;
  const Aboutcourse({super.key, required this.course});

  @override
  State<Aboutcourse> createState() => _AboutcourseState();
}

class _AboutcourseState extends State<Aboutcourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.course.title,
          style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.amber.shade200),
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(widget.course.imageURL),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Information:${widget.course.description}',
              style:
                  GoogleFonts.abel(fontSize: 23, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Price:\$${widget.course.price.toString()}',
              style:
                  GoogleFonts.abel(fontSize: 23, fontWeight: FontWeight.w600),
            ),
            Text(
              "Our Lessons",
              style: GoogleFonts.abel(
                  fontSize: 30, fontWeight: FontWeight.w600, color: Colors.red),
            ),
            const SizedBox(
              height: 20,
            ),
            // smth(),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: widget.course.lessons.length,
                itemBuilder: (context, index) {
                  final lessons = widget.course.lessons[index];
                  return Aboutcoursewidget(lessons: lessons);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
