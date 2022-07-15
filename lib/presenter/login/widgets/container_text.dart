import 'package:flutter/material.dart';
import 'package:gear/presenter/shared/widgets/big_text_app.dart';

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


