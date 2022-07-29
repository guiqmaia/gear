import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared/widgets/top_bar_app.dart';
import 'listview_signup.dart';

class BodySignUp extends StatefulWidget {
  const BodySignUp({
    Key? key,
    required this.nameController,
    required this.bithdayDateController,
    required this.bussinessNameController,
    required this.cnpjController,
    required this.cpfController,
    required this.phoneController,
    required this.cellphoneController,
    required this.cepController,
    required this.adressController,
    required this.loginController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController nameController;
  final TextEditingController bithdayDateController;
  final TextEditingController bussinessNameController;
  final TextEditingController cnpjController;
  final TextEditingController cpfController;
  final TextEditingController phoneController;
  final TextEditingController cellphoneController;
  final TextEditingController cepController;
  final TextEditingController adressController;
  final TextEditingController loginController;
  final TextEditingController passwordController;

  @override
  State<BodySignUp> createState() => _BodySignUpState();
}

class _BodySignUpState extends State<BodySignUp> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const TopBarApp(
            title: 'Cadastre-se',
            isProfile: true,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.85,
            child: ListViewSignUp(
              nameController: widget.nameController,
              bithdayDateController: widget.bithdayDateController,
              bussinessNameController: widget.bussinessNameController,
              cnpjController: widget.cnpjController,
              cpfController: widget.cpfController,
              phoneController: widget.phoneController,
              cellphoneController: widget.cellphoneController,
              cepController: widget.cepController,
              adressController: widget.adressController,
              loginController: widget.loginController,
              passwordController: widget.passwordController,
            ),
          ),
        ],
      ),
    );
  }
}
