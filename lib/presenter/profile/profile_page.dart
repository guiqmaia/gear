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
    return const Scaffold(
      body: BodyProfilePage(),
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
              color: Colors.black,
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: 390,
            height: 500,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(15),
            ),
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
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
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
