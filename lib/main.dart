import 'package:flutter/material.dart';
import 'package:gear/core/app_getit.dart';
import 'package:gear/presenter/home/home_page.dart';
import 'package:gear/presenter/splash/splash_page.dart';

void main(List<String> args) {
  setupGetIT();
  runApp(
    const MaterialApp(
      home: SplashPage(),
      title: 'Gear',
      debugShowCheckedModeBanner: false,
    ),
  );
}
