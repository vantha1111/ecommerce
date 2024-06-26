import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginRepository {
  final http.Client httpClient = http.Client();

  Future<void> login({
    required String email,
    required String password,
  }) async {
    final String url = "http://localhost:3000/login";
    final Map<String, String> headers = {"Content-Type": "application/json"};
    final String body = jsonEncode({
      "email": email,
      "password": password,
    });

    try {
      final http.Response response = await httpClient.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        // Handle successful response
        print('Login successful');
      } else {
        // Handle error response
        print('Login failed: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network or other errors
      print('Error occurred: $e');
    }
  }
}