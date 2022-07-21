import 'dart:convert';
import 'dart:typed_data';

class ProductModel {
  int? id;
  String name;
  double price;
  String category;
  int quantity;
  Uint8List image;

  ProductModel({
    this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.quantity,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'category': category,
      'quantity': quantity,
      'image': image,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      name: map['name'] as String,
      price: map['price'] as double,
      category: map['category'] as String,
      quantity: map['quantity'] as int,
      image: map['image'] as Uint8List,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
