import 'package:flutter/material.dart';

import '../../core/app_assets.dart';
import 'widgets/body_profile_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      body: const BodyProfilePage(),
    );
  }
}

