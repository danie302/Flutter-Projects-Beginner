import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:products_app/models/models.dart';

class ProductsRepo {
  static String baseUrl = 'flutter-chat-310320-default-rtdb.firebaseio.com';

  static getProducts() async {
    final url = Uri.https(baseUrl, 'products.json');
    final response = await http.get(url);
    final Map<String, dynamic> decodedData = json.decode(response.body);
    final List<Product> products = [];
    decodedData.forEach((key, value) {
      final tmpProduct = Product.fromMap(value);
      tmpProduct.id = key;
      products.add(tmpProduct);
    });
    return products;
  }
}
