import 'package:flutter/material.dart';

import 'wrap_container_home.dart';
import 'container_top_home.dart';

class BodyHomePage extends StatefulWidget {
  const BodyHomePage({Key? key}) : super(key: key);

  @override
  State<BodyHomePage> createState() => _BodyHomePageState();
}

class _BodyHomePageState extends State<BodyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ContainerTopHome(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          const WrapContainerHome(),
        ],
      ),
    );
  }
}
