import 'package:bottom/views/screens/homescreen.dart';
import 'package:bottom/views/screens/profilepage.dart';
import 'package:bottom/views/screens/statisticpage.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _choiceIndex = 0;
  void _changeIndex(int index) {
    setState(() {
      _choiceIndex = index;
    });
  }

  List<Widget> screens = [Homescreen(), Statisticpage(), Profilepage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        currentIndex: _choiceIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _changeIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.stacked_bar_chart), label: 'Statistic'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: screens[_choiceIndex],
    );
  }
}
