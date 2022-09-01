import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../infra/providers/login_providers.dart';
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
          info: userModel.state.company,
          iconInfo: Icons.location_searching,
        ),
        InfoContainerProfile(
          titleInfo: "Endereço",
          info: '${userModel.state.addressModel![0].street}, ${userModel.state.addressModel![0].number} - ${userModel.state.addressModel![0].city} (${userModel.state.addressModel![0].state})',
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
