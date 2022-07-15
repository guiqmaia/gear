import 'dart:ui';

import 'package:flutter/cupertino.dart';
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: Image.asset(
                    "assets/images/empresario.jpeg",
                    fit: BoxFit.cover,
                  ).image,
                ),
                SizedBox(height: 30,),
                const Text(
                  "Roberto Silva dos Santos",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(            
            width: 390,
            height: 400 ,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 35),
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(
                        CupertinoIcons.building_2_fill,
                        size: 30,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Empresa",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 35),
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(
                        CupertinoIcons.graph_square,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Balanço",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 35),
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(
                        CupertinoIcons.settings,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Ajustes",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
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
