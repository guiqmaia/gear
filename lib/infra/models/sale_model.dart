// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'base_model.dart';

class SaleModel implements BaseModel {
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
    final result = <String, dynamic>{};
  
    if(id != null){
      result.addAll({'id': id});
    }
    result.addAll({'productId': productId});
    result.addAll({'price': price});
    result.addAll({'quantity': quantity});
    result.addAll({'payment': pay});
    result.addAll({'date': date.millisecondsSinceEpoch});
  
    return result;
  }

  factory SaleModel.fromMap(Map<String, dynamic> map) {
    return SaleModel(
      id: map['id']?.toInt(),
      productId: map['productId']?.toInt() ?? 0,
      price: map['price']?.toDouble() ?? 0.0,
      quantity: map['quantity']?.toInt() ?? 0,
      pay: map['payment'] ?? '',
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SaleModel.fromJson(String source) => SaleModel.fromMap(json.decode(source));
}
