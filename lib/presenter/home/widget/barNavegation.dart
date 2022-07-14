import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../profile/profile_page.dart';
import '../../results/results_page.dart';
import '../home_page.dart';

BottomAppBar BarNavegation(BuildContext context) {
  return BottomAppBar(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const HomePage();
                  },
                ),
              );
            },
            icon: const Icon(Icons.home)),
        IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => const ResultsPage()),
                ),
              );
            },
            icon: const Icon(Icons.bar_chart)),
        IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => const ProfilePge()),
                ),
              );
            },
            icon: const Icon(Icons.person)),
      ],
    ),
  );
}
