import 'package:flutter/material.dart';
import 'package:gear/presenter/profile/profile_page.dart';
import 'package:gear/shared/widgets/text_field_app.dart';
import 'package:gear/shared/widgets/top_bar_app.dart';


class EditProfileBody extends StatefulWidget {
  const EditProfileBody({Key? key}) : super(key: key);

  @override
  State<EditProfileBody> createState() => _EditProfileBodyState();
}

class _EditProfileBodyState extends State<EditProfileBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopBarApp(isProfile: true, pageRoute: ProfilePage(), title: 'Editar Perfil' ),
          TextFieldApp(labelItem: 'Nome', typeController: '', isObscured: false),
        ],
      ),
      
 
    );
  }
}
