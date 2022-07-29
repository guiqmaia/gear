import 'package:flutter/material.dart';

import '../../../shared/widgets/top_bar_app.dart';
import 'btn_edit_user.dart';
import 'non_editable_container_list.dart';
import 'wrap_textfield_edit_user.dart';

class BodyEditProfile extends StatelessWidget {
  const BodyEditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          TopBarApp(
            title: 'Editar Perfil',
            isProfile: true,
          ),
          NonEditableContainerList(),
          WrapTextFieldEditUser(),
          BtnEditUser(),
        ],
      ),
    );
  }
}
