import 'dart:convert'; // Add this import
import 'package:http/http.dart' as http;
import 'package:computer_store/data/services/authentication/register.dart';
import 'package:computer_store/features/shop/models/api/config.dart';

Future<void> submitData(Register registerData) async {
  try {
    print(registerData);
    // Convert registerData to JSON
    Map<String, dynamic> jsonData = registerData.toJson();
    var response = await http.post(
      Uri.parse(signaurl),
      body: jsonEncode(jsonData), // Use jsonEncode
      headers: {
        'Content-Type': 'application/json', // Add appropriate headers
      },
    );

    // Handle response here (e.g., check status codes, etc.)
    if (response.statusCode == 200) {
      // Successful response handling
      print('Success: ${response.body}');
    } else {
      // Handle error response
      print('Error: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions
    print('Error: $e');
  }
}
