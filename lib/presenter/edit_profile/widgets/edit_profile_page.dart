import 'package:flutter/material.dart';
import 'package:gear/presenter/profile/profile_page.dart';

import '../../shared/widgets/top_bar_app.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            TopBarApp(
              title: "Edição Perfil",
              pageRoute: ProfilePage(),
              isProfile: false,
            ),
          ],
        ),
      ),
    );
  }
}
