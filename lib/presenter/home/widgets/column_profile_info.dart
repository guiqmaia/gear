import 'package:flutter/material.dart';
import '../../../core/app_assets.dart';

class ColumnProfileInfo extends StatelessWidget {
  const ColumnProfileInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: Image.asset(
                imgStore,
                fit: BoxFit.cover,
              ).image,
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.black,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  'Distribuidora Bebidinhas',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                '27.042.017/00001-22',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              Text('Douglas Costa da Silva',
                  style: TextStyle(color: Colors.white, fontSize: 15)),
            ],
          ),
        ),
      ],
    );
  }
}