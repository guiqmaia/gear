import 'package:flutter/material.dart';

import '../../core/app_assets.dart';
import 'widgets/body_sign_up.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  static const route = '/signup';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
        cpfController: cpfController,
        phoneController: phoneController,
        cellphoneController: cellphoneController,
        cepController: cepController,
        adressController: adressController,
        loginController: loginController,
        passwordController: passwordController,
      ),
    );
  }
}