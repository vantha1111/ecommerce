import 'dart:convert';
import 'package:computer_store/features/shop/models/api/config.dart';
import 'package:computer_store/features/shop/models/shop/brand_model.dart';
import 'package:http/http.dart' as http;



class BrandService {

 Future<List<BrandModel>> fetchBrand() async {   
    final response = await http.get(Uri.parse(brandurl));

   if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => BrandModel.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load brands');
  }
  }
  void main() async {
  try {
    List<BrandModel> brand = await fetchBrand();
    // Use the products list here
    print(brand);
  } catch (e) {
    print('Error: $e');
  }
}
}
