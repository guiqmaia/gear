import 'package:flutter/material.dart';
import 'package:gear/presenter/product_signup/product_signup_page.dart';

import 'presenter/splash/splash_page.dart';

void main(List<String> args) {
  runApp(
    const MaterialApp(
      home: ProductSignupPage(),
      title: 'Gear',
      debugShowCheckedModeBanner: false,
    ),
  );
}
