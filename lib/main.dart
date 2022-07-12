import 'package:flutter/material.dart';

import 'presenter/home/home_page.dart';

void main(List<String> args) {
  runApp(
    const MaterialApp(
      home: HomePage(),
      title: 'Gear',
      debugShowCheckedModeBanner: false,
    ),
  );
}
