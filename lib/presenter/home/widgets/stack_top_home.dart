import 'package:flutter/material.dart';

import '../../../core/app_assets.dart';
import '../../../core/app_getit.dart';

class StackTopHome extends StatelessWidget {
  const StackTopHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.57,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 35),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(150),
              bottomRight: Radius.circular(150),
            ),
          ),
          child: Column(
            children: [
              const Text(
                'GEAR',
                style: TextStyle(
                  color: Color.fromRGBO(202, 254, 72, 1),
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.06),
              CircleAvatar(
                radius: 70,
                backgroundImage: Image.asset(
                  imgStore,
                  fit: BoxFit.cover,
                ).image,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 57,
          child: Container(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(25),
              color: greenNeon,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Text(
                    logedUser.company,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  logedUser.cnpj,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                Text(
                  logedUser.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
