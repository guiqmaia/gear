import 'package:flutter/material.dart';

import 'Widgets/product_signup_body.dart';

class ProductSignupPage extends StatelessWidget {
  const ProductSignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignupPageBody(),
    );
  }
}
