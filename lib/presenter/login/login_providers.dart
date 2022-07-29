import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../infra/models/user_model.dart';

UserModel logedUser = UserModel(
    name: 'name',
    birthday: 'birthday',
    cpf: 'cpf',
    company: 'company',
    cnpj: 'cnpj',
    telephone: 'telephone',
    mobileNumber: 'mobileNumber',
    cep: 'cep',
    adress: 'adress',
    email: 'email',
    password: 'password');

final userModelProvider = StateProvider<UserModel>((ref) => logedUser);

final loginControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());

final passwordControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());

final nameControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());

final birthdayControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());

final businessNameControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());

final cnpjControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());

final cpfControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());

final telephoneControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());

final mobileControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());

final cepControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());

final adressControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());
