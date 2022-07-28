import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/app_getit.dart';
import 'presenter/splash/splash_page.dart';

void main() {
  setupGetIt();
  runApp(
    const ProviderScope(
      child: MaterialApp(
        home: SplashPage(),
        title: 'Gear',
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}

