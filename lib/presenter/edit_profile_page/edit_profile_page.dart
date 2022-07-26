import 'package:flutter/material.dart';
import '../../core/app_assets.dart';

import 'widgets/body_edit_profile.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      body: const BodyEditProfile(),
    );
  }
}
