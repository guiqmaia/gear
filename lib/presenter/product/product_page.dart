import 'package:flutter/material.dart';

import '../../core/app_assets.dart';
import '../../infra/models/category_model.dart';
import '../../shared/widgets/btn_standard_app.dart';
import '../product_signup/product_signup_page.dart';
import 'widgets/body_product_page.dart';

class ProductPage extends StatelessWidget {
  final CategoryModel category;

  const ProductPage({
    Key? key,
    required this.category,
  }) : super(key: key);

  static const route = '/product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      body: SingleChildScrollView(
        child: BodyProductPage(
          category: category,
        ),
      ),
      bottomNavigationBar: BtnStandardApp(
        title: 'Novo produto',
        pageRoute: ProductSignupPage.route,
        widthBtn: MediaQuery.of(context).size.width * 0.8,
      ),
    );
  }
}
