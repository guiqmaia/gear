// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  int? id;
  String name;
  String cpf;
  String birthday;
  String company;
  String cnpj;
  String telephone;
  String mobileNumber;
  String cep;
  String adress;
  String email;
  String password;
  UserModel({
    this.id,
    required this.name,
    required this.cpf,
    required this.birthday,
    required this.company,
    required this.cnpj,
    required this.telephone,
    required this.mobileNumber,
    required this.cep,
    required this.adress,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'cpf': cpf,
      'birthday': birthday,
      'company': company,
      'cnpj': cnpj,
      'telephone': telephone,
      'mobileNumber': mobileNumber,
      'cep': cep,
      'adress': adress,
      'email': email,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      cpf: map['cpf'] as String,
      birthday: map['birthday'] as String,
      company: map['company'] as String,
      cnpj: map['cnpj'] as String,
      telephone: map['telephone'] as String,
      mobileNumber: map['mobileNumber'] as String,
      cep: map['cep'] as String,
      adress: map['adress'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
