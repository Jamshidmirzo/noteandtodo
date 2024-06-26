import 'dart:convert';

import 'package:bottom/models/user.dart';
import 'package:bottom/services/http/authhttpservice.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Authcontroller {
  User? user;
  final authhttpservice = Authhttpservice();
  Future<void> register(String email, String password) async {
    try {
      final responce = await authhttpservice.register(email, password);
      user = User(
          email: email,
          id: responce['localId'],
          expiryDate: DateTime.now().add(Duration(
            seconds: int.parse(responce['expiresIn']),
          )),
          password: password,
          token: responce['idToken']);
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString(
        'userData',
        jsonEncode(
          user!.toMap(),
        ),
      );
    } catch (e) {
      String message = e.toString();
      if (message.contains("EMAIL_EXISTS")) {
        message = "Bu email mavjud";
      } else if (message.contains("WEAK_PASSWORD")) {
        message = "Parol juda qisqa!";
      }

      throw (message);
    }
  }

  Future<void> login(String email, String password) async {
    try {
      final response = await authhttpservice.login(email, password);
      user = User(
        id: response['localId'],
        email: email,
        password: password,
        token: response['idToken'],
        expiryDate: DateTime.now().add(
          Duration(
            seconds: int.parse(response['expiresIn']),
          ),
        ),
      );

      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString(
        "userData",
        jsonEncode(user!.toMap()),
      );
    } catch (e) {
      print(e);
      String message = e.toString();
      if (message.contains("EMAIL_EXISTS")) {
        message = "Bu email bor";
      } else if (message.contains("WEAK_PASSWORD")) {
        message = "Parol juda onson!";
      }

      throw (message);
    }
  }

  Future<bool> checkLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userData = sharedPreferences.getString("userData");

    if (userData == null) {
      return false;
    }
    user = User.fromMap(jsonDecode(userData));

    return DateTime.now().isBefore(user!.expiryDate);
  }

  Future<void> changepass(String email) async {
    authhttpservice.changepass(email);
  }
}
