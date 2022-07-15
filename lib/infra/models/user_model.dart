// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:gear/infra/models/company_model.dart';

class UserModel {
  String name;
  String cpf;
  String phone;
  String email;
  CompanyModel company;

  UserModel({
    required this.name,
    required this.cpf,
    required this.phone,
    required this.email,
    required this.company,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'cpf': cpf,
      'phone': phone,
      'email': email,
      'company': company.toMap(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      cpf: map['cpf'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
      company: CompanyModel.fromMap(map['company'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
