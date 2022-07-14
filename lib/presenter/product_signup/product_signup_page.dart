import 'package:flutter/material.dart';
import 'package:gear/presenter/home/home_page.dart';
import 'package:gear/presenter/shared/widgets/btn_standard_app.dart';

import 'Widgets/product_signup_body.dart';

class ProductSignupPage extends StatelessWidget {
  const ProductSignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SignupPageBody(),
      bottomNavigationBar: BtnStandardApp(
        title: 'Concluir',
        pageRoute: const HomePage(),
        widthBtn: MediaQuery.of(context).size.width,
      ),
    );
  }
}
