import 'dart:convert';

import 'adress_model.dart';

import 'base_model.dart';

class UserModel implements BaseModel {
  @override
  int? id;
  String name;
  String cpf;
  String birthday;
  String company;
  String cnpj;
  String telephone;
  String mobileNumber;
  String email;
  String password;
  String image;
  List<AddressModel>? addressModel;

  UserModel({
    this.id,
    required this.name,
    required this.cpf,
    required this.birthday,
    required this.company,
    required this.cnpj,
    required this.telephone,
    required this.mobileNumber,
    required this.email,
    required this.password,
    required this.image,
    this.addressModel,
  });

  @override
  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(id != null){
      result.addAll({'id': id});
    }
    result.addAll({'name': name});
    result.addAll({'cpf': cpf});
    result.addAll({'birthday': birthday});
    result.addAll({'company': company});
    result.addAll({'cnpj': cnpj});
    result.addAll({'telephone': telephone});
    result.addAll({'cellphone': mobileNumber});
    result.addAll({'email': email});
    result.addAll({'password': password});
    result.addAll({'image': image});
  
    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id']?.toInt(),
      name: map['name'] ?? '',
      cpf: map['cpf'] ?? '',
      birthday: map['birthday'] ?? '',
      company: map['company'] ?? '',
      cnpj: map['cnpj'] ?? '',
      telephone: map['telephone'] ?? '',
      mobileNumber: map['cellphone'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      image: map['image'] ?? '',
      addressModel: map['address'] != null ? List<AddressModel>.from(map['address']?.map((x) => AddressModel.fromMap(x))) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
