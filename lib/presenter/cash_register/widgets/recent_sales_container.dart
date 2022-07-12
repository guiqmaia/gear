import 'package:flutter/material.dart';

class RecentSalesContainer extends StatelessWidget {
  const RecentSalesContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.shade300,
      ),
      child: const Text(
        'Vendas Recentes',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 18,
        ),
      ),
    );
  }
}
