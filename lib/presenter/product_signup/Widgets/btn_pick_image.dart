import 'package:flutter/material.dart';

class BtnPickImage extends StatelessWidget {
  const BtnPickImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.purple.shade300,
            Colors.blue.shade800,
          ],
        ),
      ),
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.symmetric(
        vertical: 3,
      ),
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Selecionar Imagem',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
