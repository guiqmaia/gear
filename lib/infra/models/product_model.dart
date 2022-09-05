import 'dart:convert';

import 'base_model.dart';

class ProductModel implements BaseModel {
  @override
  int? id;
  String name;
  double price;
  int categoryId;
  int quantity;
  String image;

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
    final result = <String, dynamic>{};
  
    if(id != null){
      result.addAll({'id': id});
    }
    result.addAll({'name': name});
    result.addAll({'price': price});
    result.addAll({'categoryId': categoryId});
    result.addAll({'quantity': quantity});
    result.addAll({'image': image});
  
    return result;
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id']?.toInt(),
      name: map['name'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      categoryId: map['categoryId']?.toInt() ?? 0,
      quantity: map['quantity']?.toInt() ?? 0,
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source));
}
