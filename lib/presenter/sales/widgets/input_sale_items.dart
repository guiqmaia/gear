import 'package:flutter/material.dart';

class InputSaleItems extends StatelessWidget {
  final String labelItem;
  final IconData iconInput;
  final dynamic typeController;

  const InputSaleItems({
    Key? key,
    required this.labelItem,
    required this.iconInput,
    required this.typeController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: typeController,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          labelText: labelItem,
          prefixIcon: Icon(
            iconInput,
            color: Colors.black,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

// const Color.fromRGBO(0, 102, 204, 0.1)