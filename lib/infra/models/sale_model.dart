// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'default_model.dart';

class SaleModel implements DefaultModel {
  @override
  int? id;
  int productId;
  double price;
  int quantity;
  String pay;
  DateTime date;

  SaleModel({
    this.id,
    required this.productId,
    required this.price,
    required this.quantity,
    required this.pay,
    required this.date,
  });

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'productId': productId,
      'price': price,
      'quantity': quantity,
      'pay': pay,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory SaleModel.fromMap(Map<String, dynamic> map) {
    return SaleModel(
      id: map['id'] != null ? map['id'] as int : null,
      productId: map['productId'] as int,
      price: map['price'] as double,
      quantity: map['quantity'] as int,
      pay: map['pay'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory SaleModel.fromJson(String source) =>
      SaleModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
