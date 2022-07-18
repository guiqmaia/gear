import 'package:flutter/material.dart';
import 'package:gear/core/app_assets.dart';

import 'Widgets/product_signup_body.dart';

class ProductSignupPage extends StatelessWidget {
  const ProductSignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      body: const SignupPageBody(),
    );
  }
}
