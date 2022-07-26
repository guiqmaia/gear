import 'dart:convert';
import 'dart:typed_data';

import 'package:gear/infra/models/default_model.dart';

class CategoryModel implements DefaultModel {
  @override
  int? id;
  String name;
  Uint8List image;

  CategoryModel({
    this.id,
    required this.name,
    required this.image,
  });

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as Uint8List,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
