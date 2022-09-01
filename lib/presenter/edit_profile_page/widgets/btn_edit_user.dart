import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/app_assets.dart';
import '../../../infra/providers/login_providers.dart';
import '../../../infra/repository/user_repository.dart';
import '../../home/home_page.dart';

class BtnEditUser extends StatefulHookConsumerWidget {
  const BtnEditUser({Key? key}) : super(key: key);

  @override
  ConsumerState<BtnEditUser> createState() => _BtnEditUserState();
}

class _BtnEditUserState extends ConsumerState<BtnEditUser> {
  @override
  Widget build(BuildContext context) {
    final telephoneController = ref.watch(telephoneControllerProvider.state).state;
    final cellphoneController = ref.watch(mobileControllerProvider.state).state;
    final cepController = ref.watch(cepControllerProvider.state).state;
    final streetController = ref.watch(streetControllerProvider.state).state;
    final numberController = ref.watch(numberControllerProvider.state).state;
    final cityController = ref.watch(cityControllerProvider.state).state;
    final stateController = ref.watch(stateControllerProvider.state).state;
    final userModel = ref.watch(userModelProvider.state).state;
    final photoProfile = ref.watch(photoProfileProvider.state);

    void updateUser() async {
      if (telephoneController.text != '') {
        userModel.telephone = telephoneController.text;
        telephoneController.clear();
      }
      if (cellphoneController.text != '') {
        userModel.mobileNumber = cellphoneController.text;
        cellphoneController.clear();
      }
      if (cepController.text != '') {
        userModel.addressModel![0].cep = cepController.text;
        cepController.clear();
      }
      if (streetController.text != '') {
        userModel.addressModel![0].street = streetController.text;
        streetController.clear();
      }
      if (numberController.text != '') {
        userModel.addressModel![0].number = int.parse(numberController.text);
        numberController.clear();
      }
      if (cityController.text != '') {
        userModel.addressModel![0].city = cityController.text;
        cityController.clear();
      }
      if (stateController.text != '') {
        userModel.addressModel![0].state = stateController.text;
        stateController.clear();
      }
      if (photoProfile.state.path != '') {
        userModel.image = base64Encode(photoProfile.state.readAsBytesSync());
        photoProfile.state = File('');
      }
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: greenNeon,
      ),
      margin: const EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.symmetric(
        vertical: 3,
      ),
      child: TextButton(
        onPressed: () {
          updateUser();
          UserRepository userRepository = UserRepository();
          userRepository.put('http://192.168.0.43:81/api/User', userModel);

          Navigator.of(context).pushNamed(HomePage.route);
        },
        child: const Text(
          'Editar',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
