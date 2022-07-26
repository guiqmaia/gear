import 'dart:convert';
import 'dart:typed_data';

import 'default_model.dart';

class SaleModel implements DefaultModel {
  @override
  int? id;
  int productId;
  double productPrice;
  int productQuantity;
  String pay;

  SaleModel({
    this.id,
    required this.productId,
    required this.productPrice,
    required this.productQuantity,
    required this.pay,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    result.addAll({'productId': productId});
    result.addAll({'productPrice': productPrice});
    result.addAll({'productQuantity': productQuantity});
    result.addAll({'pay': pay});

    return result;
  }

  factory SaleModel.fromMap(Map<String, dynamic> map) {
    return SaleModel(
      id: map['id']?.toInt(),
      productId: map['productId']?.toInt() ?? 0,
      productPrice: map['productPrice']?.toDouble() ?? 0.0,
      productQuantity: map['productQuantity']?.toInt() ?? 0,
      pay: map['pay'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SaleModel.fromJson(String source) =>
      SaleModel.fromMap(json.decode(source));
}
