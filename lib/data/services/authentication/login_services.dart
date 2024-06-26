import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginService {
  static const String loginUrl = 'http://localhost:3000/api#/';

  Future<String> login(String username, String password) async {
    final response = await http.post(
      Uri.parse(loginUrl),
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      return responseBody['token'];
    } else {
      throw Exception('Failed to login');
    }
  }
}