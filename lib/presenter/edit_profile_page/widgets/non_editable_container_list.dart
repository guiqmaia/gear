import 'package:flutter/material.dart';
import 'package:gear/presenter/edit_profile_page/widgets/non_changable_container.dart';

import '../../../core/app_getit.dart';

class NonEditableContainerList extends StatelessWidget {
  const NonEditableContainerList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NonChangableContainer(
          param: 'Nome',
          info: logedUser.name,
        ),
        NonChangableContainer(
          param: 'CPF',
          info: logedUser.cpf,
        ),
        NonChangableContainer(
          param: 'Data de Nascimento',
          info: logedUser.birthday,
        ),
        NonChangableContainer(
          param: 'Nome da Empresa',
          info: logedUser.company,
        ),
        NonChangableContainer(
          param: 'CNPJ',
          info: logedUser.cnpj,
        ),
      ],
    );
  }
}
