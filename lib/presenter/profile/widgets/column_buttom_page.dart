import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gear/presenter/home/home_page.dart';

import '../../login/login_page.dart';

class ColumnButtom extends StatelessWidget {
  const ColumnButtom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 400,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MaterialButton(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 35),
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
            onPressed: () {
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              );
            },
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
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 35),
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
    );
  }
}
