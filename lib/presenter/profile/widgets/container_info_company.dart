import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../login/login_providers.dart';
import 'info_container_profile.dart';

class ContainerInfoCompany extends HookConsumerWidget {
  const ContainerInfoCompany({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userModel = ref.watch(userModelProvider.state);

    return Wrap(
      children: [
        InfoContainerProfile(
          titleInfo: "Telefone",
          info: userModel.state.telephone,
          iconInfo: Icons.local_phone_outlined,
        ),
        InfoContainerProfile(
          titleInfo: "CEP",
          info: userModel.state.cep,
          iconInfo: Icons.location_searching,
        ),
        InfoContainerProfile(
          titleInfo: "Endereço",
          info: userModel.state.adress,
          iconInfo: Icons.location_on_outlined,
        ),
        InfoContainerProfile(
          titleInfo: "Email",
          info: userModel.state.email,
          iconInfo: Icons.email_outlined,
        ),
      ],
    );
  }
}
