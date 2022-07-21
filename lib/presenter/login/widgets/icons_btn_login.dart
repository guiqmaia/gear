import 'package:flutter/material.dart';

import '../../../core/app_assets.dart';

class IconsBtnLogin extends StatelessWidget {
  const IconsBtnLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
    );
  }
}
