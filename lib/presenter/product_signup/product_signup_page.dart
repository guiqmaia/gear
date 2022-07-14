import 'package:flutter/material.dart';
import '../home/home_page.dart';
import '../shared/widgets/top_bar_app.dart';

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
