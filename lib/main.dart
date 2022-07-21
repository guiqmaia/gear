import 'package:flutter/material.dart';
import 'package:gear/presenter/profile/profile_page.dart';

import 'package:gear/presenter/splash/splash_page.dart';

import 'core/app_getit.dart';

void main(List<String> args) {
  setupGetIT();
  runApp(
    const MaterialApp(
      home: ProfilePage(),
      title: 'Gear',
      debugShowCheckedModeBanner: false,
    ),
  );
}
