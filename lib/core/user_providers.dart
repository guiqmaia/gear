import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_getit.dart';

final userId = Provider<int>((ref) => logedUser.id!);
final userName = Provider<String>((ref) => logedUser.name);
final userCpf = Provider<String>((ref)=> logedUser.cpf);
final userBirthday = Provider<String>((ref)=> logedUser.birthday);
final userCompany = Provider<String>((ref)=> logedUser.company);
final userCnpj = Provider<String>((ref)=> logedUser.cnpj);
final userTelephone = StateProvider<String>((ref)=> logedUser.telephone);
final userMobileNumber = StateProvider<String>((ref)=> logedUser.mobileNumber);
final userCep = StateProvider<String>((ref)=> logedUser.cep);
final userAdress = StateProvider<String>((ref)=> logedUser.adress);
final userEmail = Provider<String>((ref)=> logedUser.email);