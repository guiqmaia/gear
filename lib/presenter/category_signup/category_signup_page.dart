import 'package:flutter/material.dart';

import '../../core/app_assets.dart';
import '../category/category_page.dart';
import '../../shared/widgets/btn_standard_app.dart';
import 'widgets/body_category_signup.dart';

class categoriesignupPage extends StatelessWidget {
  const categoriesignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      body: const Bodycategoriesignup(),
      bottomNavigationBar: BtnStandardApp(
        title: 'Cadastrar',
        pageRoute: const CategoryPage(),
        widthBtn: MediaQuery.of(context).size.width,
        onPressed: () {},
      ),
    );
  }
}
