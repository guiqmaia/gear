import 'package:flutter/material.dart';

import '../../../core/app_getit.dart';
import 'info_container_profile.dart';

class ContainerInfoCompany extends StatelessWidget {
  const ContainerInfoCompany({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        InfoContainerProfile(
          titleInfo: "Telefone",
          info: logedUser.telephone,
          iconInfo: Icons.local_phone_outlined,
        ),
        InfoContainerProfile(
          titleInfo: "CEP",
          info: logedUser.cep,
          iconInfo: Icons.location_searching,
        ),
        InfoContainerProfile(
          titleInfo: "Endereço",
          info: logedUser.adress,
          iconInfo: Icons.location_on_outlined,
        ),
        InfoContainerProfile(
          titleInfo: "Email",
          info: logedUser.email,
          iconInfo: Icons.email_outlined,
        ),
      ],
    );
  }
}
