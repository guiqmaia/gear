import 'package:flutter/material.dart';
import '../../../core/app_assets.dart';
import '../../../core/app_getit.dart';
import '../../../infra/models/user_model.dart';


import '../../../core/app_assets.dart';
import '../../../infra/database/gear_database.dart';


import '../../home/home_page.dart';
import '../../signup/signup.dart';

class ColumnUserLoginWith extends StatefulWidget {
  final TextEditingController loginController;
  final TextEditingController passwordController;

  const ColumnUserLoginWith({
    Key? key,
    required this.loginController,
    required this.passwordController,
  }) : super(key: key);

  @override
  State<ColumnUserLoginWith> createState() => _ColumnUserLoginWithState();
}

class _ColumnUserLoginWithState extends State<ColumnUserLoginWith> {
  bool loginCorrect = false;

  Future<void> verifyLogin() async {
    UserModel user = await GearDatabase.instance.selectUser(
      widget.loginController.text,
      widget.passwordController.text,
    );
    if (user.email == widget.loginController.text) {
      setState(() {
        loginCorrect = true;
        logedUser = user;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 20,
          children: [
            InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              onTap: () {},
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                child: Image.asset(
                  iconGoogle,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              onTap: () {},
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                child: Image.asset(
                  iconFacebook,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 10, top: 10),
          child: Text('Entrar com'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
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
                  loginCorrect
                      ? Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                        )
                      : print('object');
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
            ),
          ],
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Signup()),
              );
            },
            child: const Text('Cadastre-se'))
      ],
    );
  }
}
