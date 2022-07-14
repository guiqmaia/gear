import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../home/home_page.dart';
import '../shared/widgets/top_bar_app.dart';

class ProfilePge extends StatelessWidget {
  const ProfilePge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade600,
      body: const BodyProfilePage(),
    );
  }
}

class BodyProfilePage extends StatelessWidget {
  const BodyProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopBarApp(
          title: "Perfil",
          pageRoute: HomePage(),
          isProfile: false,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 30),
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          "Roberto Silva dos Santos",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 390,
          height: 100,
          color: Colors.white60,
        )
      ],
    );
  }
}
