import 'package:flutter/material.dart';

import '../../home/home_page.dart';
import '../../shared/widgets/btn_standard_app.dart';

class ColumnUserLoginWith extends StatelessWidget {
  const ColumnUserLoginWith({
    Key? key,
  }) : super(key: key);

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
                  'assets/icons/google.png',
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
                  'assets/icons/facebook.png',
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
            BtnStandardApp(
                title: 'Entrar',
                pageRoute: const HomePage(),
                widthBtn: MediaQuery.of(context).size.width * 0.9),
          ],
        ),
        TextButton(onPressed: () {}, child: const Text('Cadastre-se'))
      ],
    );
  }
}
