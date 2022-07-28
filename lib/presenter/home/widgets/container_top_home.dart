import 'package:flutter/material.dart';

import '../../../core/app_assets.dart';
import '../../../core/app_getit.dart';

class ContainerTopHome extends StatelessWidget {
  const ContainerTopHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.06,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Olá,',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.black26,
                ),
              ),
              Text(
                logedUser.name,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
          CircleAvatar(
            radius: 34,
            backgroundColor: Colors.white,
            backgroundImage: Image.asset(
              iconUserAnon,
              fit: BoxFit.cover,
            ).image,
          ),
        ],
      ),
    );
  }
}
