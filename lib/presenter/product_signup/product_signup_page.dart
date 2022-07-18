import 'package:flutter/material.dart';
import 'package:gear/core/app_assets.dart';
import '../home/home_page.dart';
import '../shared/widgets/btn_standard_app.dart';

import 'Widgets/product_signup_body.dart';

class ProductSignupPage extends StatelessWidget {
  const ProductSignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      body: const SignupPageBody(),
      bottomNavigationBar: BtnStandardApp(
        title: 'Cadastrar',
        pageRoute: const HomePage(),
        widthBtn: MediaQuery.of(context).size.width,
      ),
    );
  }
}
