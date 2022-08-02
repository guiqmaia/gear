import 'package:flutter/material.dart';
import 'package:gear/presenter/splash/splash_page.dart';

import 'core/app_routes.dart';
import 'presenter/home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashPage.route,
      title: 'Gear',
      debugShowCheckedModeBanner: false,
      routes: appRoutes,
      onUnknownRoute: (context) {
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      },
    );
  }
}
