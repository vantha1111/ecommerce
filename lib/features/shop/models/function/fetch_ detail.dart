import 'dart:convert';
import 'package:computer_store/features/shop/models/shop/details_model.dart';
import 'package:http/http.dart' as http;

class DetailService {
  static const String detailUrl = 'https://findtech-ecommerce-api-3d6838e17183.herokuapp.com/product/d8b5b4bf-3314-46e9-9ae6-cec15013faf3';

  Future<DetailModel> fetchProductDetails(String productId) async {
    final response = await http.get(Uri.parse('$detailUrl/products/$productId'));

    print(response.body);

    if (response.statusCode == 200) {
      return DetailModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load product details');
    }
  }
}
