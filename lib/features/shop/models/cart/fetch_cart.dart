import 'dart:convert';
import 'package:computer_store/data/Token/token_model.dart';
import 'package:computer_store/features/authentication/models/loginmodel/fetch_login.dart';
import 'package:computer_store/features/shop/models/api/config.dart';
import 'package:computer_store/features/shop/models/cart/cart_model.dart';
import 'package:http/http.dart' as http;

class CartService {
  Future<CartModel> fetchCart() async {
    // Replace this with your actual API call logic
    String? tokenJson = await AuthService().getToken();
    Token token = Token.fromJson(json.decode(tokenJson!));
    final response = await http.get(
      Uri.parse(carturl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token.accessToken}'
      },
    );
    if (response.statusCode == 200) {
      return CartModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load cart');
    }
  }

  Future<bool?> addTocart(String productId, num quantity) async {
    String? tokenJson = await AuthService().getToken();
    Token token = Token.fromJson(json.decode(tokenJson!));
    final response = await http.post(
      Uri.parse(carturl),
      body: json.encode({'productId': productId, 'quantity': quantity}),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token.accessToken}'
      },
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      // Handle errors accordingly
      return false;
    }
  }
}
