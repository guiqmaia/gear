// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../core/app_assets.dart';

class ProductLeader extends StatelessWidget {
  final String product;
  final String value;
  const ProductLeader({
    Key? key,
    required this.product,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [        
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.fromLTRB(50, 10, 50, 0)),
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
          crossAxisAlignment: CrossAxisAlignment.end,  
          children: [
            const Padding(padding: const EdgeInsets.fromLTRB(50, 10, 50, 0)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: greenNeon,
              ),
              child: Text(
                value,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
                
              ),
            ),
          ],
        ),
      ],
    );
  }
}
