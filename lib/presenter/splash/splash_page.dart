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

  bool _myFirs = true;

  final double _myFontSize = 60;
  final Color _myColor = Colors.blue;
  final FontWeight _myFontWeight = FontWeight.bold;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then(
      (value) => {
        setState(
          () {
            _myFirs = false;
          },
        )
      },
    );
    super.initState();

    Future.delayed(const Duration(seconds: 2)).then(
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
            Center(
              child: Text(
                "TENHAM UM OTIMO FINAL DE SEMANA",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
