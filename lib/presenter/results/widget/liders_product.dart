import 'package:flutter/material.dart';

class ProductLeader extends StatelessWidget {
  final String amount;
  final String product;
  final String value;
  const ProductLeader({
    Key? key,
    required this.amount,
    required this.product,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children:  [
            Padding(
                padding: EdgeInsets.fromLTRB(50, 10, 50, 0)),
            Text(
              amount,
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Column(
          children:  [
            Padding(
                padding: EdgeInsets.fromLTRB(50, 10, 50, 0)),
            Text(
              product,
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Column(
          children:  [
            Padding(
                padding: EdgeInsets.fromLTRB(50, 10, 50, 0)),
            Text(
              value,
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}
