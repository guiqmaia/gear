import 'package:flutter/material.dart';

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
          width: 390,
          height: 530,
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
                info: "(47) 3732 - 0010",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
                iconInfo: Icons.local_phone_outlined,
              ),
              InfoContainerProfile(
                titleInfo: "CEP:",
                info: "90035-190",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
                iconInfo: Icons.location_searching,
              ),
              InfoContainerProfile(
                titleInfo: "Endereço:",
                info: "Av. Osvaldo Aranha, 720 ",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
                iconInfo: Icons.location_on_outlined,
              ),
              InfoContainerProfile(
                  titleInfo: "Email:",
                  info: "bebidinhas@gmail.com.br",
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
          width: 390,
          height: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              InfoContainerProfile(
                  titleInfo: "Nome:",
                  info: "Douglas Costa da Silva",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  iconInfo: Icons.person_outline),
              InfoContainerProfile(
                titleInfo: "Data de Nascimento:",
                info: "27/04/2017",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
                iconInfo: Icons.location_searching,
              ),
              InfoContainerProfile(
                titleInfo: "CPF:",
                info: "109.504.364-60",
                style: TextStyle(
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
