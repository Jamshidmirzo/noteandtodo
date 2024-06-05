import 'package:bottom/views/screens/notescreen.dart';
import 'package:bottom/views/screens/todoscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ZoomTapAnimation(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Todoscreen();
                    },
                  ));
                },
                child: Container(
                  width: 150,
                  height: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.amber)),
                  child: Text(
                    'Todo app',
                    style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ZoomTapAnimation(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) {
                        return Notescreen();
                      },
                    ),
                  );
                },
                child: Container(
                  width: 150,
                  height: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.amber)),
                  child: Text(
                    'Notes app',
                    style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      
    );
  }
}