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
    return SingleChildScrollView(
      child: Column(
        children: [
          const TopBarApp(
            title: "Perfil",
            pageRoute: HomePage(),
            isProfile: false,
          ),
          CircleAvatar(
            radius: 85,
            backgroundImage: Image.asset(
              "assets/images/empresario.jpeg",
              fit: BoxFit.cover,
            ).image,
          ),
          const SizedBox(
            height: 50,
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
            height: 500,
            color: Colors.white60,
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Empresa:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      height: 50,
                      width: double.infinity,
                      decoration: const BoxDecoration(color: Colors.white30),
                      child: const Center(
                        child: Text(
                          "Loja dos Lojistas",
                          style: TextStyle(                          
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 30)
        ],
      ),
    );
  }
}
