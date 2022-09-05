import 'dart:convert';

import 'product_model.dart';

import 'base_model.dart';

class CategoryModel implements BaseModel {
  @override
  int? id;
  String name;
  String image;
  int userId;
  List<ProductModel>? products;

  CategoryModel({
    this.id,
    required this.name,
    required this.image,
    required this.userId,
    this.products,
  });

  @override
  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(id != null){
      result.addAll({'id': id});
    }
    result.addAll({'name': name});
    result.addAll({'image': image});
    result.addAll({'userId': userId});
  
    return result;
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id']?.toInt(),
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      userId: map['userId']?.toInt() ?? 0,
      products: map['products'] != null ? List<ProductModel>.from(map['products']?.map((x) => ProductModel.fromMap(x))) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) => CategoryModel.fromMap(json.decode(source));
}
