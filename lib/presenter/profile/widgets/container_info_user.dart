import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../infra/providers/login_providers.dart';
import 'info_container_profile.dart';

class ContainerInfoUser extends HookConsumerWidget {
  const ContainerInfoUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userModel = ref.watch(userModelProvider.state);

    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        const Divider(
          indent: 25,
          endIndent: 25,
          thickness: 1,
          height: 10,
        ),
        InfoContainerProfile(
          titleInfo: "Nome",
          info: userModel.state.name,
          iconInfo: Icons.person_outline,
        ),
        InfoContainerProfile(
          titleInfo: "Data de Nascimento",
          info: userModel.state.birthday,
          iconInfo: Icons.date_range_rounded,
        ),
        InfoContainerProfile(
          titleInfo: "CPF",
          info: userModel.state.cpf,
          iconInfo: Icons.location_on_outlined,
        ),
      ],
    );
  }
}
