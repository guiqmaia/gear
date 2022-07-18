import 'package:flutter/material.dart';
import 'package:gear/presenter/login/login_page.dart';

import '../../core/app_assets.dart';
import '../home/home_page.dart';
import '../shared/widgets/btn_standard_app.dart';
import '../shared/widgets/top_bar_app.dart';
import 'widgets/button_exit.dart';
import 'widgets/container_info_page.dart';
import 'widgets/name_photo_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyProfilePage(),
    );
  }
}

class BodyProfilePage extends StatelessWidget {
  const BodyProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopBarApp(
              title: "Perfil",
              pageRoute: HomePage(),
              isProfile: false,
            ),
            const NamePhotoProfile(),
            const SizedBox(height: 15),
            const ContainerInfo(),
            const SizedBox(height: 10),
            BtnStandardApp(
              title: "Sair",
              widthBtn: MediaQuery.of(context).size.width * 0.8,
            ),
          ],
        ),
      ),
    );
  }
}
