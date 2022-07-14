import 'package:flutter/material.dart';

import 'my_checked_box.dart';

class ContainerUserOptions extends StatefulWidget {
  const ContainerUserOptions({
    Key? key,
  }) : super(key: key);

  @override
  State<ContainerUserOptions> createState() => _ContainerUserOptionsState();
}

class _ContainerUserOptionsState extends State<ContainerUserOptions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              MyCheckedBox(),
              SizedBox(width: 2),
              Text(
                'Lembrar',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          const SizedBox(width: 1),
          const Text(
            'Esqueceu a senha?',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}