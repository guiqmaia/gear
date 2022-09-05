import 'dart:convert';

import 'base_model.dart';
import 'product_model.dart';

class SaleModel implements BaseModel {
  @override
  int? id;
  int productId;
  double price;
  int quantity;
  String pay;
  String date;
  int userId;
  ProductModel? product;

  SaleModel({
    this.id,
    required this.productId,
    required this.price,
    required this.quantity,
    required this.pay,
    required this.date,
    required this.userId,
    this.product,
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
    result.addAll({'date': date});
    result.addAll({'userId': userId});
  
    return result;
  }

  factory SaleModel.fromMap(Map<String, dynamic> map) {
    return SaleModel(
      id: map['id']?.toInt(),
      productId: map['productId']?.toInt() ?? 0,
      price: map['price']?.toDouble() ?? 0.0,
      quantity: map['quantity']?.toInt() ?? 0,
      pay: map['payment'] ?? '',
      date: map['date'] ?? '',
      userId: map['userId']?.toInt() ?? 0,
      product: map['product'] != null ? ProductModel.fromMap(map['product']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SaleModel.fromJson(String source) => SaleModel.fromMap(json.decode(source));
}
