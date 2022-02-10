// To parse this JSON data, do
//
//     final scanModel = scanModelFromJson(jsonString);

import 'dart:convert';

class ScanModel {
  ScanModel({
    this.id,
    this.type,
    required this.value,
  }) {
    if (value.contains('http')) {
      type = 'http';
    } else {
      type = 'geo';
    }
  }

  int? id;
  String? type;
  String value;

  factory ScanModel.fromRawJson(String str) =>
      ScanModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        type: json["type"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "value": value,
      };
}
