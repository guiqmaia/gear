import 'package:flutter/material.dart';

class CashRegisterTitle extends StatelessWidget {
  const CashRegisterTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      child: const Center(
        child: Text(
          'Caixa Registradora',
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
          ),
        ),
      ),
    );
  }
}
