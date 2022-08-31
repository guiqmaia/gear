import 'dart:convert';


class AddressModel {
  final int id;
  final String cep;
  final String street;
  final int number;
  final String city;
  final String state;
  final int userId;

  AddressModel({
    required this.id,
    required this.cep,
    required this.street,
    required this.number,
    required this.city,
    required this.state,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
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
      id: map['id']?.toInt() ?? 0,
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
