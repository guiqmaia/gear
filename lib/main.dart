import 'package:flutter/material.dart';
import 'package:gear/presenter/home/home_page.dart';
import 'package:gear/presenter/login/login_page.dart';
import 'package:gear/presenter/product_signup/product_signup_page.dart';

import 'presenter/splash/splash_page.dart';

void main(List<String> args) {
  runApp(
    const MaterialApp(
      home: LoginPage(),
      title: 'Gear',
      debugShowCheckedModeBanner: false,
    ),
  );
}
