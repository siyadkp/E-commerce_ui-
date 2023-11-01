import 'dart:convert';
import '../../model/product_model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductApi {
  static Future<List<ProductModel>> fetchProductsFromApi() async {
    try {
      final response = await http
          .get(Uri.parse('https://fakestoreapi.com/products?limit=10'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);

        List<ProductModel> products =
            jsonData.map((json) => ProductModel.fromJson(json)).toList();

        return products;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      return [];
    }
  }
}
