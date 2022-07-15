import 'package:flutter/material.dart';
import '../../core/app_assets.dart';

import '../product_signup/product_signup_page.dart';
import '../shared/widgets/btn_standard_app.dart';
import 'widgets/body_category_page.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      body: const SingleChildScrollView(
        child: BodyCategoryPage(),
      ),
      bottomNavigationBar: BtnStandardApp(
        title: 'Novo produto',
        pageRoute: const ProductSignupPage(),
        widthBtn: MediaQuery.of(context).size.width,
      ),
    );
  }
}

