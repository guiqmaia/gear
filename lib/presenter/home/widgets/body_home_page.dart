import 'package:flutter/material.dart';

import 'column_btn_home.dart';
import 'stack_top_home.dart';

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
        children: const [
          StackTopHome(),
          SizedBox(height: 30),
          ColumnBtnHome(),
        ],
      ),
    );
  }
}
