import 'package:flutter/material.dart';

import '../../reset_password/reset_password.dart';
import 'my_checked_box.dart';

class ContainerUserOptions extends StatefulWidget {
  const ContainerUserOptions({Key? key}) : super(key: key);

  @override
  State<ContainerUserOptions> createState() => _ContainerUserOptionsState();
}

class _ContainerUserOptionsState extends State<ContainerUserOptions> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              MyCheckedBox(),
              Text(
                'Lembrar',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ResetPassword(),
                ),
              );
            },
            child: const Text('Esqueci minha senha'),
          ),
        ],
      ),
    );
  }
}
