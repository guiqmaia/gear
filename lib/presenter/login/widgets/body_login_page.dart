import 'package:flutter/material.dart';
import 'package:gear/presenter/shared/widgets/text_field_app.dart';

import 'column_user_login_with.dart';
import 'container_text.dart';
import 'container_text_field_login.dart';
import 'container_user_options.dart';

class BodyLoginPage extends StatelessWidget {
  const BodyLoginPage({
    Key? key,
    required this.loginController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController loginController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ContainerText(),
          TextFieldApp(labelItem: 'Email', iconInput: Icons.email, typeController: loginController,),
          TextFieldApp(labelItem: 'Senha', iconInput: Icons.key, typeController: passwordController,),
          const ContainerUserOptions(),
          const ColumnUserLoginWith(),
        ],
      ),
    );
  }
}
