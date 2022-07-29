import 'package:flutter/material.dart';

import '../../core/app_assets.dart';
import '../../shared/widgets/btn_standard_app.dart';
import '../category_signup/category_signup_page.dart';
import 'widgets/body_category_page.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  static const route = '/category';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      body: SingleChildScrollView(
        child: BodyCategoryPage(),
      ),
      bottomNavigationBar: BtnStandardApp(
        title: 'Nova categoria',
        pageRoute: CategorySignupPage.route,
        widthBtn: MediaQuery.of(context).size.width,
      ),
    );
  }
}
