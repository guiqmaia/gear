import 'package:flutter/material.dart';

class TopBarHome extends StatelessWidget {
  const TopBarHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.only(
          bottom: 20, top: 20, right: 30, left: 10),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: const Center(
        child: Text(
          'Gear',
          style: TextStyle(
            color: Color.fromRGBO(202, 254, 72, 1),
            fontSize: 29,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}