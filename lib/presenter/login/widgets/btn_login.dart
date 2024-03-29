import 'package:flutter/material.dart';
import '../../../infra/dto/user_dto.dart';
import '../../../infra/repository/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/app_assets.dart';
import '../../../infra/models/user_model.dart';
import '../../home/home_page.dart';
import '../../../infra/providers/login_providers.dart';

class BtnLoginPage extends StatefulHookConsumerWidget {
  const BtnLoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<BtnLoginPage> createState() => _BtnLoginPageState();
}

class _BtnLoginPageState extends ConsumerState<BtnLoginPage> {

  Future<void> verifyLogin(
    TextEditingController loginControllerProvider,
    TextEditingController passwordControllerProvider,
  ) async {
    final userModel = ref.watch(userModelProvider.state);

    UserRepository userRepository = UserRepository();

    UserDto dto = UserDto(email: loginControllerProvider.text, password: passwordControllerProvider.text);

    UserModel user = await userRepository.logon(dto);
    
    setState(
      () {
        if (user.id != null) {
          Navigator.of(context).pushReplacementNamed(HomePage.route);
          userModel.state = user;
        }
      },
    );

    loginControllerProvider.clear();
    passwordControllerProvider.clear();
  }

  @override
  Widget build(BuildContext context) {
    final loginController = ref.watch(loginControllerProvider.state);
    final passwordController = ref.watch(passwordControllerProvider.state);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: greenNeon,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.symmetric(
        vertical: 3,
      ),
      child: TextButton(
        onPressed: () {
          verifyLogin(
            loginController.state,
            passwordController.state,
          );
        },
        child: const Text(
          'Entrar',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
