import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:bottom/controllers/authcontroller.dart';
import 'package:bottom/views/screens/homepage.dart';
import 'package:bottom/views/screens/loginpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BottomApp());
}

class BottomApp extends StatefulWidget {
  BottomApp({super.key});

  @override
  State<BottomApp> createState() => _BottomAppState();
}

class _BottomAppState extends State<BottomApp> {
  final Authcontroller _authController = Authcontroller();
  bool _isLogged = false;

  @override
  void initState() {
    super.initState();
    _authController.checkLogin().then((value) {
      setState(() {
        _isLogged = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      dark: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
      ),
      initial: AdaptiveThemeMode.dark,
      builder: (light, dark) => MaterialApp(
        theme: light,
        darkTheme: dark,
        home: _isLogged ? Homepage() : Loginpage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
