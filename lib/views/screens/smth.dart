import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Smth extends StatefulWidget {
  const Smth({super.key});

  @override
  State<Smth> createState() => _SmthState();
}

class _SmthState extends State<Smth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Lottie.asset('assets/lotties/1.json'),
    );
  }
}
