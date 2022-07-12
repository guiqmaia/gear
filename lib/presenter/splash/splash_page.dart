import 'dart:ui';

import 'package:flutter/material.dart';

import '../home/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _myFirs = true;

  double _myFontSize = 60;
  Color _myColor = Colors.blue;
  FontWeight _myFontWeight = FontWeight.bold;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) => {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const HomePage()),
          ),
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            height: 120,
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              style: TextStyle(
                fontSize: _myFontSize,
                color: _myColor,
                fontWeight: _myFontWeight,
              ),
              child: const Text("GEAR"),              
            ),
          ),
        ]),
      ),
    );
  }
}
