import 'package:bottom/controllers/authcontroller.dart';
import 'package:bottom/services/http/authhttpservice.dart';
import 'package:bottom/views/screens/homepage.dart';
import 'package:bottom/views/screens/loginpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Bottom());
}

class Bottom extends StatefulWidget {
  Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  final authcontroller = Authcontroller();

  bool isLogged = false;

  @override
  void initState() {
    authcontroller.checkLogin().then((value) {
      setState(() {
        isLogged = value;
      });
    });
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: isLogged ? Homepage() : Loginpage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
