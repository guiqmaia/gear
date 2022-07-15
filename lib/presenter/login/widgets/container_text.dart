import 'package:flutter/material.dart';
import '../../shared/widgets/big_text_app.dart';

// ignore: must_be_immutable
class ContainerText extends StatelessWidget {
  ContainerText({
    Key? key,
  }) : super(key: key);

  TextStyle bigText = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 45, bottom: 20),
      child: BigTextApp(text: 'Seja bem vindo'),
    );
  }
}


