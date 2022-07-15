import 'package:flutter/material.dart';

import '../../../core/app_assets.dart';

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
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: greenNeon,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text(
        'Vendas Recentes',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
    );
  }
}
