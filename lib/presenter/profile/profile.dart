import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../home/home_page.dart';
import '../shared/widgets/top_bar_app.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:  [
          const TopBarApp(
            title: "Perfil",
            pageRoute: HomePage(),
            isProfile: false,
          ),
          Container(
            color: Colors.black,
            height: 175,
            width: 175,
          )
        ],
      ),
    );
  }
}
