import 'package:flutter/material.dart';

import '../../core/app_assets.dart';
import 'widgets/body_category_signup.dart';

class CategorySignupPage extends StatelessWidget {
  const CategorySignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      body: const BodyCategorySignup(),
    );
  }
}
