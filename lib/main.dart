import 'package:flutter/material.dart';

import 'presenter/login/login_page.dart';

void main(List<String> args) {
  runApp(
    const MaterialApp(
      home: LoginPage(),
      title: 'Gear',
      debugShowCheckedModeBanner: false,
    ),
  );
}
