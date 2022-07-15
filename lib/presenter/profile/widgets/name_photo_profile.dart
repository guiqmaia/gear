import 'package:flutter/material.dart';

class NamePhotoProfile extends StatelessWidget {
  const NamePhotoProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: Image.asset(
              "assets/images/empresario.jpeg",
              fit: BoxFit.cover,
            ).image,
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Roberto Silva dos Santos",
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
