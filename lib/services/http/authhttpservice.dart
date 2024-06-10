import 'dart:convert';

import 'package:http/http.dart' as http;

class Authhttpservice {
  final String _apiKey = 'AIzaSyBz2iX61QoUNefBiUBT06Ftkyz1M1E1yco';
  Future<Map<String, dynamic>> _authicate(
      String email, String password, String smth) async {
    Uri url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:$smth?key=$_apiKey');
    try {
      final responce = await http.post(
        url,
        body: jsonEncode(
          {
            'email': email,
            "password": password,
            "returnSecureToken": true,
          },
        ),
      );
      final data = jsonDecode(responce.body);
      print(responce.body);
      if (responce.statusCode != 200) {
        throw (data['error']['message']);
      }

      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> register(String email, String password) async {
    return await _authicate(email, password, 'signUp');
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    return await _authicate(email, password, 'signInWithPassword');
  }



Future<Map<String, dynamic>> changepass(String email) async {
  Uri url = Uri.parse(
      'https://identitytoolkit.googleapis.com/v1/accounts:resetPassword?key=$_apiKey');
  try {
    final response = await http.post(
      url,
      body: jsonEncode(
        {'email': email, 'requestType': 'PASSWORD_RESET'},
      ),
      headers: {'Content-Type': 'application/json'},
    );
    final data = jsonDecode(response.body);
    print(response.body);
    if (response.statusCode != 200) {
      throw (data['error']['message']);
    }

    return data;
  } catch (e) {
    rethrow;
  }
}

}
