// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:gear/infra/models/product_model.dart';
import 'package:gear/infra/models/sale_model.dart';

class ProductSale {
  ProductModel produto;
  SaleModel venda;
  int quantidade;

  ProductSale({
    required this.produto,
    required this.venda,
    required this.quantidade,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'produto': produto.toMap(),
      'venda': venda.toMap(),
      'quantidade': quantidade,
    };
  }

  factory ProductSale.fromMap(Map<String, dynamic> map) {
    return ProductSale(
      produto: ProductModel.fromMap(map['produto'] as Map<String, dynamic>),
      venda: SaleModel.fromMap(map['venda'] as Map<String, dynamic>),
      quantidade: map['quantidade'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductSale.fromJson(String source) =>
      ProductSale.fromMap(json.decode(source) as Map<String, dynamic>);
}
