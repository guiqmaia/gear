import 'package:flutter/material.dart';

class RecentSalesContainer extends StatelessWidget {
  const RecentSalesContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.only(
        top: 20,
        bottom: 10,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        border: Border.all(
          color: Colors.blue.shade600,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        'Vendas Recentes',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.blue.shade600,
          fontSize: 18,
        ),
      ),
    );
  }
}
