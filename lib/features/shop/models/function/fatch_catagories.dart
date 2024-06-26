import 'dart:convert';
import 'package:computer_store/data/services/shop/categories.dart';
import 'package:computer_store/features/shop/models/api/config.dart';
import 'package:http/http.dart' as http;


class CateService {
  
    Future<List<Categories>> fetchCategories() async {
    final response = await http.get(Uri.parse(cataurl));

     if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<Categories> categories = body.map((dynamic item) => Categories.fromJson(item)).toList();
      return categories;
    } else {
      throw Exception('Failed to load categories');
    }
  }
  void main() async {
  try {
    List<Categories> categories = await fetchCategories();
    // Use the products list here
    print(categories);
  } catch (e) {
    print('Error: $e');
  }
}
}



