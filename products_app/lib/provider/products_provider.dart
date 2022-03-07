import 'dart:io';
import 'package:flutter/material.dart';

import 'package:products_app/models/models.dart';
import 'package:products_app/repositories/repositories.dart';

class ProductsProvider extends ChangeNotifier {
  bool isLoading = false;
  late File _image;
  late Product selectedProduct;
  late List<Product> _products = [];

  List<Product> get products => _products;

  ProductsProvider() {
    _fetchProducts();
  }

  _fetchProducts() async {
    isLoading = true;
    notifyListeners();
    _products = await ProductsRepo.getProducts();
    isLoading = false;
    notifyListeners();
  }

  Future saveOrCreateProduct(Product product) async {
    if (product.id == null) {
      return await createProduct(product);
    } else {
      return await updateProduct(product);
    }
  }

  Future createProduct(Product product) async {
    isLoading = true;
    notifyListeners();
    final newProd = await ProductsRepo.createProduct(product);

    _products.add(newProd);

    isLoading = false;
    notifyListeners();
  }

  Future updateProduct(Product product) async {
    isLoading = true;
    notifyListeners();
    await ProductsRepo.updateProduct(product);

    final index = _products.indexWhere((element) => element.id == product.id);
    _products[index] = product;

    isLoading = false;
    notifyListeners();
  }

  void updateProductImg(String path) async {
    isLoading = true;
    notifyListeners();
    _image = File.fromUri(Uri(path: path));
    if (_image != null) {
      final String? imgUrl =
          await ProductsRepo.uploadImg(_image, selectedProduct.id!);
      if (imgUrl != null) {
        selectedProduct.picture = imgUrl;
      }
    }
    isLoading = false;
    notifyListeners();
  }
}
