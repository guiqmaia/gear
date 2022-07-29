import 'package:flutter/material.dart';

import '../../core/app_assets.dart';
import 'Widgets/body_product_signup.dart';

class ProductSignupPage extends StatelessWidget {
  const ProductSignupPage({Key? key}) : super(key: key);

  static const route = '/product/signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      body: const BodySignupPage(),
    );
  }
}
