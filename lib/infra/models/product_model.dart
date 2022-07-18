import 'dart:convert';
import 'dart:typed_data';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  String productTitle;
  dynamic productImg;
  int productCode;
  int productQuantity;
  double productPrice;

  ProductModel({
    required this.productTitle,
    required this.productImg,
    required this.productCode,
    required this.productQuantity,
    required this.productPrice,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': productTitle,
      'imgPath': productImg,
      'productCode': productCode,
      'productQuantity': productQuantity,
      'productPrice': productPrice,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      productTitle: map['title'] as String,
      productImg: map['imgPath'] as dynamic,
      productCode: map['productCode'] as int,
      productQuantity: map['productQuantity'] as int,
      productPrice: map['productPrice'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
