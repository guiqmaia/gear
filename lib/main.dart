import 'package:flutter/material.dart';
import 'package:gear/presenter/splash/splash_page.dart';

import 'presenter/login/login_page.dart';

void main(List<String> args) {
  runApp(
    const MaterialApp(
      home: SplashPage(),
      title: 'Gear',
      debugShowCheckedModeBanner: false,
    ),
  );
}
