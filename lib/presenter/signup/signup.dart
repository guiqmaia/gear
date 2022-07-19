import 'package:flutter/material.dart';

import '../../core/app_assets.dart';
import 'widgets/body_sign_up.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final nameController = TextEditingController();
  final cpfController = TextEditingController();
  final bithdayDateController = TextEditingController();
  final bussinessNameController = TextEditingController();
  final cnpjController = TextEditingController();
  final cepController = TextEditingController();
  final phoneController = TextEditingController();
  final cellphoneController = TextEditingController();
  final adressController = TextEditingController();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      body: BodySignUp(
          nameController: nameController,
          bithdayDateController: bithdayDateController,
          bussinessNameController: bussinessNameController,
          cnpjController: cnpjController,
          phoneController: phoneController,
          cellphoneController: cellphoneController,
          cepController: cepController,
          adressController: adressController,
          loginController: loginController,
          passwordController: passwordController),
    );
  }
}