import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
          onTap: _launchUrlGoogle,
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
          onTap: _launchUrlFacebook,
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

final Uri _urlGoogle = Uri.parse('https://www.google.com.br/');

Future<void> _launchUrlGoogle() async {
  if (!await launchUrl(_urlGoogle)){
    throw 'Could not launch $_urlGoogle';
  }
}

final Uri _urlFacebook = Uri.parse('https://pt-br.facebook.com/');
Future<void> _launchUrlFacebook() async {
  if (!await launchUrl(_urlFacebook)) {
    throw 'Could not launch $_urlFacebook';
  }}

