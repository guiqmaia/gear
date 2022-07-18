import 'package:flutter/material.dart';
import 'package:gear/core/app_assets.dart';

import '../../login/login_page.dart';

class ButtonExit extends StatelessWidget {
  const ButtonExit({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      },
      color: greenNeon,
      child: const Text(
        "Sair",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
    );
  }
}
