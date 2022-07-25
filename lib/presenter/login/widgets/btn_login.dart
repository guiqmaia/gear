import 'package:flutter/material.dart';

import '../../../core/app_assets.dart';
import '../../../core/app_getit.dart';
import '../../../infra/database/create_database_products.dart';
import '../../../infra/database/gear_database.dart';
import '../../../infra/models/user_model.dart';
import '../../home/home_page.dart';

class BtnLogin extends StatefulWidget {
  final TextEditingController loginController;
  final TextEditingController passwordController;

  const BtnLogin({
    Key? key,
    required this.loginController,
    required this.passwordController,
  }) : super(key: key);

  @override
  State<BtnLogin> createState() => _BtnLoginState();
}

class _BtnLoginState extends State<BtnLogin> {
  Future<void> verifyLogin() async {
    await CreateDatabaseProducts().createCategories();
    UserModel user = await GearDatabase.instance.selectUser(
      widget.loginController.text,
      widget.passwordController.text,
    );

    if (user.email == widget.loginController.text) {
      setState(
        () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const HomePage()),
          );

          logedUser = user;
        },
      );
    }
    widget.loginController.clear();
    widget.passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: greenNeon,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.symmetric(
        vertical: 3,
      ),
      child: TextButton(
        onPressed: () {
          verifyLogin();
        },
        child: const Text(
          'Entrar',
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
