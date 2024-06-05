import 'package:bottom/views/screens/homepage.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(Bottom());
}

class Bottom extends StatelessWidget {
  const Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
