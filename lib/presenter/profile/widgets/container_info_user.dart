import 'package:flutter/material.dart';

import '../../../core/app_getit.dart';
import 'info_container_profile.dart';

class ContainerInfoUser extends StatelessWidget {
  const ContainerInfoUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Wrap(
        children: [
          InfoContainerProfile(
              titleInfo: "Nome:",
              info: logedUser.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
              iconInfo: Icons.person_outline),
          InfoContainerProfile(
              titleInfo: "Data de Nascimento:",
              info: logedUser.birthday,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
              iconInfo: Icons.date_range_rounded),
          InfoContainerProfile(
            titleInfo: "CPF:",
            info: logedUser.cpf,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
            iconInfo: Icons.location_on_outlined,
          ),
        ],
      ),
    );
  }
}
