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
    Future.delayed(const Duration(milliseconds: 600)).then(
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
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimationSplash(
              myFirs: _myFirs,
              myFontSize: _myFontSize,
              myColor: _myColor,
              myFontWeight: _myFontWeight,
            ),
          ],
        ),
      ),
    );
  }
}
