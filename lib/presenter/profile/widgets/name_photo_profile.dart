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
            radius: 80,
            backgroundImage: Image.asset(
              "assets/images/fotoConveniencia.png",
              fit: BoxFit.cover,
            ).image,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Distribuidora Bebidinhas",
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const Text(
            "27.042.017/0001-22",
            style: TextStyle(
                color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
