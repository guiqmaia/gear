import 'package:flutter/material.dart';

import '../../../shared/widgets/btn_standard_app.dart';
import '../../../shared/widgets/top_bar_app.dart';
import '../../home/home_page.dart';
import '../../login/login_page.dart';
import 'container_info_page.dart';
import 'name_photo_profile.dart';

class BodyProfilePage extends StatelessWidget {
  const BodyProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const TopBarApp(
            title: "Perfil",
            pageRoute: HomePage(),
            isProfile: true,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          const NamePhotoProfile(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          const ContainerInfo(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          BtnStandardApp(
            title: "Sair",
            pageRoute: const LoginPage(),
            widthBtn: MediaQuery.of(context).size.width * 0.9,
          ),
        ],
      ),
    );
  }
}
