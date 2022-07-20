import 'package:flutter/material.dart';

class ValueDay extends StatelessWidget {
  final String value;
  final String day;
  const ValueDay({
    Key? key,
    required this.value,
    required this.day,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children:  [
            const Padding(
                padding: EdgeInsets.fromLTRB(50, 10, 50, 0)),
            Text(
              value,
              style: const TextStyle(
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
            const Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 0)),
            Text(
              day,
              style: const TextStyle(
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