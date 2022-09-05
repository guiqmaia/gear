import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/app_assets.dart';
import '../../edit_profile_page/edit_profile_page.dart';
import '../../../infra/providers/login_providers.dart';

class NamePhotoProfile extends HookConsumerWidget {
  const NamePhotoProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userModel = ref.watch(userModelProvider.state);

    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 75,
              backgroundColor: blue,
              child: CircleAvatar(
                radius: 70,
                backgroundColor: backgroundGrey,
                child: CircleAvatar(
                  radius: 65,
                  backgroundColor: backgroundGrey,
                  backgroundImage: Image.memory(
                    base64Decode(userModel.state.image),
                    fit: BoxFit.cover,
                  ).image,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: blue,
                child: IconButton(
                  icon: Icon(
                    Icons.create_sharp,
                    color: greenNeon,
                    size: 20,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(EditProfilePage.route);
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
          userModel.state.company,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          userModel.state.cnpj,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 17.5,
          ),
        ),
      ],
    );
  }
}
