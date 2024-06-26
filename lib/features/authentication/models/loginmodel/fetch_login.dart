import 'dart:convert';
import 'package:computer_store/data/Token/token_model.dart';
import 'package:computer_store/features/personalization/setting/model/profile-model.dart';
import 'package:computer_store/features/shop/models/api/config.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http; // import the Token class

class AuthService {
  final storage = FlutterSecureStorage();

  Future<Token?> login(String email, String password) async {
    final url = Uri.parse(loginurl);
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      Token token = Token.fromJson(json.decode(response.body));
      await storeToken(token); // Store the token upon successful login
      return token;
    } else {
      // Handle errors accordingly
      return null;
    }
  }

  Future<void> storeToken(Token token) async {
    String tokenJson = jsonEncode(token.toJson());
    await storage.write(key: 'accessToken', value: tokenJson);
  }

  Future<String?> getToken() async {
    return await storage.read(key: 'accessToken');
  }

  Future<User?> fetchUserProfile() async {
    String? tokenJson = await getToken();
    if (tokenJson == null) return null;

    Token token = Token.fromJson(json.decode(tokenJson));
    final url = Uri.parse(userurl);
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token.accessToken}',
      },
    );

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
}
