import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:bottom/controllers/coursescontroller.dart';
import 'package:bottom/views/screens/loginpage.dart';
import 'package:bottom/views/widgets/courseswidget.dart';
import 'package:bottom/views/widgets/searchviewdelegate.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class Homescreen extends StatefulWidget {
  Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final Coursescontroller coursecontroller = Coursescontroller();

  List<String> filtereddata = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
            onPressed: () async {
              String? result = await showSearch(
                context: context,
                delegate: SearchViewDelegate(coursecontroller.getCourse()),
              );
              if (result != null) filtereddata.add(result);
              setState(() {});
            },
            icon: const Icon(Icons.search)),
        actions: [
          Container(
            margin: EdgeInsets.all(20),
            child: ZoomTapAnimation(
              onTap: () async {
                SharedPreferences sharedpref =
                    await SharedPreferences.getInstance();
                sharedpref.remove('userData');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Loginpage();
                    },
                  ),
                );
              },
              child: Icon(Icons.logout),
            ),
          ),
          IconButton(
              onPressed: () async {
                final themeode = await AdaptiveTheme.getThemeMode();
                if (themeode == AdaptiveThemeMode.dark) {
                  AdaptiveTheme.of(context).setLight();
                } else {
                  AdaptiveTheme.of(context).setDark();
                }
              },
              icon: const Icon(Icons.dark_mode))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ZoomTapAnimation(
                    onTap: () {
                      Navigator.pushNamed(context, '/todo');
                    },
                    child: Container(
                      width: 150,
                      height: 200,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.amber),
                      ),
                      child: Text(
                        'Todo app',
                        style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  ZoomTapAnimation(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (ctx) {
                      //       return Notescreen();
                      //     },
                      //   ),
                      // );
                      Navigator.pushNamed(context, '/note');
                    },
                    child: Container(
                      width: 150,
                      height: 200,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.amber),
                      ),
                      child: Text(
                        'Notes app',
                        style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Expanded(
                child: FutureBuilder(
                  future: coursecontroller.getCourse(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          snapshot.error.toString(),
                          style: GoogleFonts.abel(
                            fontSize: 23,
                            color: Colors.red,
                          ),
                        ),
                      );
                    }

                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(
                        child: Text(
                          'No courses available. Add courses to get started!',
                          style: GoogleFonts.abel(
                            fontSize: 23,
                            color: Colors.red,
                          ),
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final course = snapshot.data![index];
                        return Courseswidget(course: course);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
