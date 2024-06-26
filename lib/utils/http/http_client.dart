import 'dart:convert';
import 'package:http/http.dart' as http;

class UHttpClient {
  static const String baseUrl = "http://localhost:3000/api#/";
  

  // Get request
  static Future<Map<String, dynamic>> get(String endpoint) async{
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));
    return _handleresponse(response);
  }

  // Post request
  static Future<Map<String, dynamic>> post(String endpoint, dynamic data) async{
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
      
      );
    return _handleresponse(response);
  }
  
  // Put request
  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async{
    final response = await http.put(
      Uri.parse('$baseUrl/$endpoint'),headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
      );
    return _handleresponse(response);
  }

  // delete request
  static Future<Map<String, dynamic>> delete(String endpoint) async{
    final response = await http.delete(Uri.parse('$baseUrl/$endpoint'));
    return _handleresponse(response);
  }


  // handle the http response
  static Map<String, dynamic> _handleresponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }else {
      throw Exception('Failed to load date: ${response.statusCode}');
    }
  }

  login(String username, String password) {}

}