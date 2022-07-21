import 'package:flutter/material.dart';
import 'package:gear/core/app_getit.dart';

import '../../../core/app_getit.dart';
import 'info_container_profile.dart';

class ContainerInfo extends StatelessWidget {
  const ContainerInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoContainerProfile(
                titleInfo: "Telefone:",
                info: logedUser.telephone,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
                iconInfo: Icons.local_phone_outlined,
              ),
              InfoContainerProfile(
                titleInfo: "CEP:",
                info: logedUser.cep,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
                iconInfo: Icons.location_searching,
              ),
              InfoContainerProfile(
                titleInfo: "Endereço:",
                info: logedUser.adress,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
                iconInfo: Icons.location_on_outlined,
              ),
              InfoContainerProfile(
                  titleInfo: "Email:",
                  info: logedUser.email,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  iconInfo: Icons.email_outlined),
            ],
          ),
        ),
        Container(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
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
        ),
      ],
    );
  }
}
