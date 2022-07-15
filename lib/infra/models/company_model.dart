// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:gear/infra/models/adress_model.dart';

import 'user_model.dart';

class CompanyModel {
  String name;
  String cnpj;
  UserModel boss;
  AdressModel adress;

  CompanyModel({
    required this.name,
    required this.cnpj,
    required this.boss,
    required this.adress,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'cnpj': cnpj,
      'boss': boss.toMap(),
      'adress': adress.toMap(),
    };
  }

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
      name: map['name'] as String,
      cnpj: map['cnpj'] as String,
      boss: UserModel.fromMap(map['boss'] as Map<String, dynamic>),
      adress: AdressModel.fromMap(map['adress'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyModel.fromJson(String source) =>
      CompanyModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
