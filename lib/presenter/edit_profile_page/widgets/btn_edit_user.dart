import 'package:flutter/material.dart';

import '../../../../core/app_getit.dart';
import '../../../../infra/database/gear_database.dart';
import '../../../core/app_assets.dart';
import '../../home/home_page.dart';

class BtnEditUser extends StatefulWidget {
  final TextEditingController telephoneController;
  final TextEditingController mobileNumberController;
  final TextEditingController cepController;
  final TextEditingController adressController;
  final int userId;

  const BtnEditUser({
    Key? key,
    required this.telephoneController,
    required this.mobileNumberController,
    required this.cepController,
    required this.adressController,
    required this.userId,
  }) : super(key: key);

  @override
  State<BtnEditUser> createState() => _BtnEditUserState();
}

class _BtnEditUserState extends State<BtnEditUser> {
  Future updateUser(table, column, change, id, logedUser) async {
    if (change != '') {
      await GearDatabase.instance.update(
        table,
        id,
        column,
        change,
      );
      setState(() {
        logedUser = change;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
          updateUser(
            'user',
            widget.userId,
            'telephone',
            '"${widget.telephoneController.text}"',
            logedUser.telephone,
          );
          updateUser(
            'user',
            widget.userId,
            'mobileNumber',
            '"${widget.mobileNumberController.text}"',
            logedUser.mobileNumber,
          );
          updateUser(
            'user',
            widget.userId,
            'cep',
            '"${widget.cepController.text}"',
            logedUser.cep,
          );
          updateUser(
            'user',
            widget.userId,
            'adress',
            '"${widget.adressController.text}"',
            logedUser.adress,
          );
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => const HomePage()),
            ),
          );
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
