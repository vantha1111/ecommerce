import 'dart:convert';
import 'package:computer_store/features/authentication/models/signupmodel/verify_email_model.dart';
import 'package:computer_store/features/shop/models/api/config.dart';
import 'package:http/http.dart' as http;

Future<void> submitVerificationCode(VerifyEmailModel verifyEmailModel) async {
  try {
    var response = await http.post(
      Uri.parse(verifyurl), // Replace with your actual URL
      body: jsonEncode(verifyEmailModel.toJson()),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      // Successful response handling
      print('Success: ${response.body}');
    } else {
      // Handle error response
      print('Error: ${response.statusCode}, Response: ${response.body}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
