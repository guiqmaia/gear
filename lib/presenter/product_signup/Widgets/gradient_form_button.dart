import 'package:flutter/material.dart';

class GradientFormButton extends StatelessWidget {
  const GradientFormButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black26,
            spreadRadius: 1,
            offset: Offset(3, 3),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.purple.shade300,
            Colors.blue.shade800,
          ],
        ),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.transparent,
          onSurface: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: () {},
        child: const Text(
          'Concluir',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
