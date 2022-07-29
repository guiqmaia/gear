import 'package:flutter/material.dart';

import '../../../core/app_getit.dart';
import 'info_container_profile.dart';

class ContainerInfoUser extends StatelessWidget {
  const ContainerInfoUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          info: logedUser.name,
          iconInfo: Icons.person_outline,
        ),
        InfoContainerProfile(
          titleInfo: "Data de Nascimento",
          info: logedUser.birthday,
          iconInfo: Icons.date_range_rounded,
        ),
        InfoContainerProfile(
          titleInfo: "CPF",
          info: logedUser.cpf,
          iconInfo: Icons.location_on_outlined,
        ),
      ],
    );
  }
}
