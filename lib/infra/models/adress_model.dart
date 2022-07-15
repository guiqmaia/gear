import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AdressModel {
  String street;
  String district;
  String city;
  String cep;

  AdressModel({
    required this.street,
    required this.district,
    required this.city,
    required this.cep,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'street': street,
      'district': district,
      'city': city,
      'cep': cep,
    };
  }

  factory AdressModel.fromMap(Map<String, dynamic> map) {
    return AdressModel(
      street: map['street'] as String,
      district: map['district'] as String,
      city: map['city'] as String,
      cep: map['cep'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AdressModel.fromJson(String source) =>
      AdressModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
