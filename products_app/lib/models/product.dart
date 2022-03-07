// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

class Product {
  Product({
    this.id,
    this.picture,
    required this.name,
    required this.price,
    required this.available,
  });

  String? id;
  String name;
  double price;
  bool available;
  String? picture;

  factory Product.empty() => Product(
        id: null,
        name: '',
        price: 0,
        available: false,
      );

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        available: json["available"],
        name: json["name"],
        picture: json["picture"],
        price: json["price"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "name": name,
        "picture": picture,
        "price": price,
      };

  Product copy() => Product(
        id: id,
        name: name,
        price: price,
        available: available,
        picture: picture,
      );
}
