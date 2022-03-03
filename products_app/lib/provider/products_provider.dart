import 'package:flutter/material.dart';

import 'package:products_app/models/models.dart';
import 'package:products_app/repositories/repositories.dart';

class ProductsProvider extends ChangeNotifier {
  bool isLoading = false;
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
}
