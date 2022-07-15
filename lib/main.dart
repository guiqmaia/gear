import 'package:flutter/material.dart';

import 'presenter/cash_register/cash_register_page.dart';
import 'presenter/results/results_page.dart';
import 'presenter/splash/splash_page.dart';

void main(List<String> args) {
  runApp(
    const MaterialApp(
      home: SplashPage(),
      title: 'Gear',
      debugShowCheckedModeBanner: false,
    ),
  );
}