import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  String title;
  String imgPath;
  int productCode;
  int productQuantity;
  double productPrice;

  ProductModel({
    required this.title,
    required this.imgPath,
    required this.productCode,
    required this.productQuantity,
    required this.productPrice,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'imgPath': imgPath,
      'productCode': productCode,
      'productQuantity': productQuantity,
      'productPrice': productPrice,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      title: map['title'] as String,
      imgPath: map['imgPath'] as String,
      productCode: map['productCode'] as int,
      productQuantity: map['productQuantity'] as int,
      productPrice: map['productPrice'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
