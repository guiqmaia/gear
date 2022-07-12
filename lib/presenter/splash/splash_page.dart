import 'package:flutter/material.dart';

import '../home/home_page.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
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
        child: Image.asset(''),
      ),
    );
  }
}