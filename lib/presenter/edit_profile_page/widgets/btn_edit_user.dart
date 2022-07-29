import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../infra/database/gear_database.dart';
import '../../../core/app_assets.dart';
import '../../home/home_page.dart';
import '../../login/login_providers.dart';

class BtnEditUser extends StatefulHookConsumerWidget {
  const BtnEditUser({Key? key}) : super(key: key);

  @override
  ConsumerState<BtnEditUser> createState() => _BtnEditUserState();
}

class _BtnEditUserState extends ConsumerState<BtnEditUser> {
  Future updateTelephoneUser(
      TextEditingController telephoneControllerProvider) async {
    final userModel = ref.watch(userModelProvider.state);

    if (telephoneControllerProvider.text != '') {
      await GearDatabase.instance.update(
        'user',
        userModel.state.id,
        'telephone',
        '"${telephoneControllerProvider.text}"',
      );
      setState(() {
        userModel.state.telephone = telephoneControllerProvider.text;
        telephoneControllerProvider.clear();
      });
    }
  }

  Future updateMobileNumberUser(
      TextEditingController mobileControllerProvider) async {
    final userModel = ref.watch(userModelProvider.state);

    if (mobileControllerProvider.text != '') {
      await GearDatabase.instance.update(
        'user',
        userModel.state.id,
        'mobileNumber',
        '"${mobileControllerProvider.text}"',
      );
      setState(() {
        userModel.state.mobileNumber = mobileControllerProvider.text;
        mobileControllerProvider.clear();
      });
    }
  }

  Future updateAdressUser(
      TextEditingController adressControllerProvider) async {
    final userModel = ref.watch(userModelProvider.state);

    if (adressControllerProvider.text != '') {
      await GearDatabase.instance.update(
        'user',
        userModel.state.id,
        'adress',
        '"${adressControllerProvider.text}"',
      );
      setState(() {
        userModel.state.adress = adressControllerProvider.text;
        adressControllerProvider.clear();
      });
    }
  }

  Future updateCepUser(TextEditingController cepControllerProvider) async {
    final userModel = ref.watch(userModelProvider.state);

    if (cepControllerProvider.text != '') {
      await GearDatabase.instance.update(
        'user',
        userModel.state.id,
        'cep',
        '"${cepControllerProvider.text}"',
      );
      setState(() {
        userModel.state.cep = cepControllerProvider.text;
        cepControllerProvider.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final telephoneController = ref.watch(telephoneControllerProvider.state);
    final mobileNumberController = ref.watch(mobileControllerProvider.state);
    final cepController = ref.watch(cepControllerProvider.state);
    final adressController = ref.watch(adressControllerProvider.state);

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
          updateCepUser(cepController.state);
          updateAdressUser(adressController.state);
          updateTelephoneUser(telephoneController.state);
          updateMobileNumberUser(mobileNumberController.state);
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
