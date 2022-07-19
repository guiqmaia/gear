import 'package:flutter/material.dart';

import '../login/login_page.dart';
import 'widgets/animation.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double opacityLevel = 0.5;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5)).then(
      (value) => {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        ),
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            AnimationSplash(),           
          ],
        ),
      ),
    );
  }
}
