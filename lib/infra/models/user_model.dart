// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String name;
  String birthday;
  String company;
  String cnpj;
  String telephone;
  String cellPhone;
  String cep;
  String adress;
  String login;
  String password;

  UserModel({
    required this.name,
    required this.birthday,
    required this.company,
    required this.cnpj,
    required this.telephone,
    required this.cellPhone,
    required this.cep,
    required this.adress,
    required this.login,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'birthday': birthday,
      'company': company,
      'cnpj': cnpj,
      'telephone': telephone,
      'mobileNumber': cellPhone,
      'cep': cep,
      'adress': adress,
      'email': login,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      birthday: map['birthday'] as String,
      company: map['company'] as String,
      cnpj: map['cnpj'] as String,
      telephone: map['telephone'] as String,
      cellPhone: map['mobileNumber'] as String,
      cep: map['cep'] as String,
      adress: map['adress'] as String,
      login: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
