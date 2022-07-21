import 'package:flutter/material.dart';

import 'core/app_getit.dart';
import 'presenter/splash/splash_page.dart';

void main() {
  setupGetIt();
  runApp(
    const MaterialApp(
      home: SplashPage(),
      title: 'Gear',
      debugShowCheckedModeBanner: false,
    ),
  );
}
