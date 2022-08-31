import 'dart:convert';


class UserDto {
  String email; 
  String password;
  
  UserDto({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'email': email});
    result.addAll({'password': password});
  
    return result;
  }

  factory UserDto.fromMap(Map<String, dynamic> map) {
    return UserDto(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDto.fromJson(String source) => UserDto.fromMap(json.decode(source));
}
