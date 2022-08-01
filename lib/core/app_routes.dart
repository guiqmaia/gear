import 'package:flutter/material.dart';
import '../infra/models/category_model.dart';

import '../presenter/add_sales/add_sales_page.dart';
import '../presenter/category/category_page.dart';
import '../presenter/category_signup/category_signup_page.dart';
import '../presenter/edit_product/edit_product_page.dart';
import '../presenter/edit_profile_page/edit_profile_page.dart';
import '../presenter/home/home_page.dart';
import '../presenter/login/login_page.dart';
import '../presenter/product/product_page.dart';
import '../presenter/product_signup/product_signup_page.dart';
import '../presenter/profile/profile_page.dart';
import '../presenter/reset_password/reset_password_page.dart';
import '../presenter/sales/sales_page.dart';
import '../presenter/signup/signup_page.dart';
import '../presenter/splash/splash_page.dart';
import '../presenter/statistics/statistics_page.dart';

Map<String, WidgetBuilder> appRoutes = {
  SplashPage.route: (context) => const SplashPage(),
  LoginPage.route: (context) => const LoginPage(),
  ResetPasswordPage.route: (context) => ResetPasswordPage(),
  SignupPage.route: (context) => const SignupPage(),
  HomePage.route: (context) => const HomePage(),
  StatisticsPage.route: (context) => const StatisticsPage(),
  ProfilePage.route: (context) => const ProfilePage(),
  EditProfilePage.route: (context) => const EditProfilePage(),
  SalesPage.route: (context) => const SalesPage(),
  AddSalesPage.route: (context) => const AddSalesPage(),
  CategoryPage.route: (context) => const CategoryPage(),
  CategorySignupPage.route: (context) => const CategorySignupPage(),
  ProductPage.route: (context) {
    final parametersProduct =
        ModalRoute.of(context)!.settings.arguments as CategoryModel;
    return ProductPage(category: parametersProduct);
  },
  ProductSignupPage.route: (context) => const ProductSignupPage(),
  EditProductPage.route: (context) {
    final parametersEditProduct =
        ModalRoute.of(context)!.settings.arguments as Map;

    return EditProductPage(
      categoryTitle: parametersEditProduct['category'],
      productCode: parametersEditProduct['code'],
    );
  }
};
