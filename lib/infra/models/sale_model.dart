import 'dart:convert';

class SaleModel {
  double value;
  DateTime date;

  SaleModel({
    required this.value,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'value': value,
      'date': date,
    };
  }

  factory SaleModel.fromMap(Map<String, dynamic> map) {
    return SaleModel(
      value: map['value'] as double,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory SaleModel.fromJson(String source) =>
      SaleModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
