import 'dart:convert';

import 'base_model.dart';


class AddressModel implements BaseModel {
  @override
  int? id;
  String cep;
  String street;
  int number;
  String city;
  String state;
  int userId;

  AddressModel({
    this.id,
    required this.cep,
    required this.street,
    required this.number,
    required this.city,
    required this.state,
    required this.userId,
  });

  @override
  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(id != null){
      result.addAll({'id': id});
    }
    result.addAll({'cep': cep});
    result.addAll({'street': street});
    result.addAll({'number': number});
    result.addAll({'city': city});
    result.addAll({'state': state});
    result.addAll({'userId': userId});
  
    return result;
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      id: map['id']?.toInt(),
      cep: map['cep'] ?? '',
      street: map['street'] ?? '',
      number: map['number']?.toInt() ?? 0,
      city: map['city'] ?? '',
      state: map['state'] ?? '',
      userId: map['userId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) => AddressModel.fromMap(json.decode(source));
}
