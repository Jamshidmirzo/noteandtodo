import 'package:bottom/controllers/authcontroller.dart';
import 'package:bottom/views/screens/homepage.dart';
import 'package:bottom/views/screens/registerpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final authcontroller = Authcontroller();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool isLoading = false;
  submit() async {
    if (formkey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      try {
        await authcontroller.login(
            emailcontroller.text, passwordcontroller.text);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (ctx) {
              return Homepage();
            },
          ),
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text("Xatolik"),
              content: Text(e.toString()),
            );
          },
        );
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://www.kenility.com/sites/default/files/images/2024-05/Portadas-notasblog2024-AIToolsFlutter%20%281%29.jpg'),
                fit: BoxFit.cover),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Welcome to our AI and FLUTTER course app',
                    style: GoogleFonts.aboreto(
                        color: Colors.red,
                        fontWeight: FontWeight.w900,
                        fontSize: 40),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Input oyur email!';
                    }
                    return null;
                  },
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    label: const Text(
                      'Input your email',
                      style: TextStyle(color: Colors.red),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Input your email!';
                    }
                    return null;
                  },
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    label: const Text(
                      'Input your password',
                      style: TextStyle(color: Colors.red),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    submit();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue),
                    child: Text(
                      'Sign in 🛸',
                      style: GoogleFonts.aboreto(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) {
                            return Registerpage();
                          },
                        ),
                      );
                    },
                    child: Text(
                      'Don`t have an account? Register here',
                      style: GoogleFonts.aboreto(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                TextButton(
                    onPressed: () {
                      authcontroller.changepass(emailcontroller.text);
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text('Emailingizni tekishiirng! '),
                          );
                        },
                      );
                    },
                    child: Text(
                      'Parol estan chqidimi, bos uka',
                      style: GoogleFonts.aboreto(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
