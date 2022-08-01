import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../login/login_providers.dart';
import 'non_changable_container.dart';

class NonEditableContainerList extends HookConsumerWidget {
  const NonEditableContainerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userModel = ref.watch(userModelProvider.state);

    return Column(
      children: [
        NonChangableContainer(
          param: 'Nome',
          info: userModel.state.name,
        ),
        NonChangableContainer(
          param: 'CPF',
          info: userModel.state.cpf,
        ),
        NonChangableContainer(
          param: 'Data de Nascimento',
          info: userModel.state.birthday,
        ),
        NonChangableContainer(
          param: 'Nome da Empresa',
          info: userModel.state.company,
        ),
        NonChangableContainer(
          param: 'CNPJ',
          info: userModel.state.cnpj,
        ),
      ],
    );
  }
}
