import 'package:flutter/material.dart';

import 'container_info_company.dart';
import 'container_info_user.dart';

class ContainerInfo extends StatelessWidget {
  const ContainerInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        ContainerInfoCompany(),
        ContainerInfoUser(),
      ],
    );
  }
}



