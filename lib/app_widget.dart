import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'core/app_routes.dart';
import 'presenter/home/home_page.dart';
import 'presenter/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
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
