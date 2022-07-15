import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gear/presenter/home/home_page.dart';

import '../../login/login_page.dart';
import 'info_profile.dart';

class ContainerInfo extends StatelessWidget {
  const ContainerInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 450,
      decoration: BoxDecoration(
        color: Colors.black87,
        boxShadow: [
          BoxShadow(
              color: Colors.blueGrey.shade50,
              blurRadius: 20,
              offset: const Offset(6, 6)),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          InfoContainerProfile(
            titleInfo: "Telefone:",
            info: "(47) 3732 - 0010",
            iconInfo: Icons.local_phone_outlined,
          ),
          InfoContainerProfile(
            titleInfo: "CEP:",
            info: "90035-190",
            iconInfo: Icons.location_searching,
          ),
          InfoContainerProfile(
            titleInfo: "Endereço:",
            info: "Av. Osvaldo Aranha, 720 ",
            iconInfo: Icons.location_on_outlined,
          ),
          InfoContainerProfile(
              titleInfo: "Email:",
              info: "bebidinhas@gmail.com.br",
              iconInfo: Icons.email_outlined),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
