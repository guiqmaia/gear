import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/user_model.dart';

UserModel logedUser = UserModel(
  name: 'name',
  birthday: 'hoje',
  cpf: 'cpf',
  company: 'company',
  cnpj: 'cnpj',
  telephone: 'telephone',
  mobileNumber: 'mobileNumber',
  email: 'email',
  password: 'password',
  image: 'image',
);

final userModelProvider = StateProvider<UserModel>((ref) => logedUser);

final loginControllerProvider = StateProvider<TextEditingController>((ref) => TextEditingController());

final passwordControllerProvider = StateProvider<TextEditingController>((ref) => TextEditingController());

final nameControllerProvider = StateProvider<TextEditingController>((ref) => TextEditingController());

final birthdayControllerProvider = StateProvider<TextEditingController>((ref) => TextEditingController());

final businessNameControllerProvider = StateProvider<TextEditingController>((ref) => TextEditingController());

final cnpjControllerProvider = StateProvider<TextEditingController>((ref) => TextEditingController());

final cpfControllerProvider = StateProvider<TextEditingController>((ref) => TextEditingController());

final telephoneControllerProvider = StateProvider<TextEditingController>((ref) => TextEditingController());

final mobileControllerProvider = StateProvider<TextEditingController>((ref) => TextEditingController());

final cepControllerProvider = StateProvider<TextEditingController>((ref) => TextEditingController());

final streetControllerProvider = StateProvider<TextEditingController>((ref) => TextEditingController());

final numberControllerProvider = StateProvider<TextEditingController>((ref) => TextEditingController());

final cityControllerProvider = StateProvider<TextEditingController>((ref) => TextEditingController());

final stateControllerProvider = StateProvider<TextEditingController>((ref) => TextEditingController());

final photoProfileProvider = StateProvider<File>((ref) => File(''));

ByteData? bytes;
Uint8List? photo;

Future<void> pickImageAsset(path) async {
  try {
    bytes = await rootBundle.load(path);
    photo = bytes!.buffer.asUint8List();
  } catch (e) {
    debugPrint('Falha em buscar a imagem: $e');
  }
}
