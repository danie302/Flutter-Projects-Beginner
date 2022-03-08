import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:products_app/models/models.dart';

class ProductsRepo {
  static String baseUrl = 'flutterprojects-8a979-default-rtdb.firebaseio.com';
  static String imgUrl =
      'https://api.cloudinary.com/v1_1/ddazaj/image/upload?upload_preset=blugvga6';

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

  static Future<Product> createProduct(Product product) async {
    final url = Uri.https(baseUrl, 'products.json');
    final response = await http.post(url, body: product.toJson());
    product.id = json.decode(response.body)['name'];
    return product;
  }

  static Future<Product> updateProduct(Product product) async {
    final url = Uri.https(baseUrl, 'products/${product.id}.json');
    final response = await http.put(url, body: product.toJson());
    return Product.fromJson(response.body);
  }

  static Future<String?> uploadImg(File img, String id) async {
    final url = Uri.parse(imgUrl);
    final imageReq = http.MultipartRequest('POST', url);
    final file = await http.MultipartFile.fromPath('file', img.path);
    imageReq.files.add(file);
    final streamRes = await imageReq.send();
    final response = await http.Response.fromStream(streamRes);
    if (response.statusCode != 200) {
      return null;
    }
    final responseData = json.decode(response.body);
    return responseData['secure_url'];
  }
}
