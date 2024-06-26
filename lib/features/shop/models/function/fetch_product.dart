import 'dart:convert';
import 'package:computer_store/data/services/shop/products.dart';
import 'package:computer_store/features/shop/models/api/config.dart';
import 'package:http/http.dart' as http;

class ProductService {

  Future<List<Data>> fetchProducts() async {
    final response = await http.get(Uri.parse(urlData));

    if (response.statusCode == 200) {
      // Print the response body for debugging
      // print('Response body: ${response.body}');

      // Decode the JSON response
      Map<String, dynamic> jsonData = json.decode(response.body);

      // Access the 'data' key
      List<dynamic> productsJson = jsonData['data'];

      // Map the list of products to the Data class
      List<Data> products = productsJson.map((product) => Data.fromJson(product)).toList();
      return products;
    } else {
      throw Exception('Failed to load products: ${response.reasonPhrase}');
    }
  }

  searchProducts(String searchText) {}
}
