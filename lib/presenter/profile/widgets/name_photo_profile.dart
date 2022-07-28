import 'package:flutter/material.dart';

import '../../../core/app_assets.dart';
import '../../../core/app_getit.dart';
import '../../edit_profile_page/edit_profile_page.dart';

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
                radius: 59,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    backgroundImage: Image.asset(
                      imgUser,
                      fit: BoxFit.cover,
                    ).image,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 12,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: IconButton(
                    icon: Icon(
                      Icons.create_sharp,
                      color: greenNeon,
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) => const EditProfilePage()),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
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
