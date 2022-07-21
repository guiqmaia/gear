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
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'cpf': cpf});
    result.addAll({'birthday': birthday});
    result.addAll({'company': company});
    result.addAll({'cnpj': cnpj});
    result.addAll({'telephone': telephone});
    result.addAll({'mobileNumber': mobileNumber});
    result.addAll({'cep': cep});
    result.addAll({'adress': adress});
    result.addAll({'email': email});
    result.addAll({'password': password});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      cpf: map['cpf'] ?? '',
      birthday: map['birthday'] ?? '',
      company: map['company'] ?? '',
      cnpj: map['cnpj'] ?? '',
      telephone: map['telephone'] ?? '',
      mobileNumber: map['mobileNumber'] ?? '',
      cep: map['cep'] ?? '',
      adress: map['adress'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
