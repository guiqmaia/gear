import 'package:flutter/material.dart';
import 'package:gear/presenter/login/widgets/focus_node_login_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/widgets/text_field_app.dart';
import '../login_providers.dart';
import 'column_user_login_with.dart';
import 'container_text.dart';
import 'container_user_options.dart';

class BodyLoginPage extends HookConsumerWidget {
  bool isVisible = false;

  BodyLoginPage({
    Key? key,
    required this.isVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginController = ref.watch(loginControllerProvider.state);
    final passwordController = ref.watch(passwordControllerProvider.state);

    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ContainerText(),
            TextFieldApp(
              labelItem: 'Email',
              typeController: loginController.state,
              isObscured: false,
              focus: focusEmailLoginPage,
              nextFocus: focusPasswordLoginPage,
            ),
            TextFieldApp(
              labelItem: 'Senha',
              typeController: passwordController.state,
              isObscured: true,
              focus: focusPasswordLoginPage,
            ),
            const ContainerUserOptions(),
            const ColumnUserLoginWith(),
          ],
        ),
      ),
    );
  }
}
