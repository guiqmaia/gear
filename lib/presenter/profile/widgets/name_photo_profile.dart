import 'package:flutter/material.dart';
import 'package:gear/core/app_getit.dart';

import '../../../core/app_assets.dart';

class NamePhotoProfile extends StatelessWidget {
  const NamePhotoProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: Image.asset(
                  imgStore,
                  fit: BoxFit.cover,
                ).image,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: IconButton(
                    icon: Icon(
                      Icons.create_sharp,
                      color: greenNeon,
                      size: 20,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            logedUser.company,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            logedUser.cnpj,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 17.5,
            ),
          ),
        ],
      ),
    );
  }
}
