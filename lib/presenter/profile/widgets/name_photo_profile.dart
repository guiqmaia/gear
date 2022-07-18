import 'package:flutter/material.dart';

import '../../edit_profile/widgets/edit_profile_page.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: Image.asset(
                  "assets/images/fotoConveniencia.png",
                  fit: BoxFit.cover,
                ).image,
              ),
              IconButton(
                icon: const Icon(
                  Icons.create_sharp,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const EditProfilePage(),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Distribuidora Bebidinhas",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "27.042.017/0001-22",
            style: TextStyle(
              color: Colors.black,
              fontSize: 17.5,
            ),
          ),          
        ],
      ),
    );
  }
}
