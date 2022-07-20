import 'package:flutter/material.dart';
<<<<<<< HEAD
import '../../core/app_assets.dart';
=======
>>>>>>> da68da98b0312d07bf1cba333c5b8593f146acc2

import '../../core/app_assets.dart';
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
