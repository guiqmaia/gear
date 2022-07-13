import 'package:flutter/material.dart';

class ContainerText extends StatelessWidget {
  const ContainerText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 45, bottom: 20),
      child: const Text(
        'Seja bem vindo',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}