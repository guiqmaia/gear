import 'dart:convert';
import 'dart:typed_data';

import 'package:gear/infra/models/default_model.dart';

class ProductModel implements DefaultModel {
  @override
  int? id;
  String name;
  double price;
  int categoryId;
  int quantity;
  Uint8List image;

  ProductModel({
    this.id,
    required this.name,
    required this.price,
    required this.categoryId,
    required this.quantity,
    required this.image,
  });

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'categoryId': categoryId,
      'quantity': quantity,
      'image': image,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      name: map['name'] as String,
      price: map['price'] as double,
      categoryId: map['categoryId'] as int,
      quantity: map['quantity'] as int,
      image: map['image'] as Uint8List,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
