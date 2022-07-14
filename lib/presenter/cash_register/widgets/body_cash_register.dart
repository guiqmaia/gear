import 'package:flutter/material.dart';

import 'recent_sales_container.dart';
import 'sale_register_container.dart';

class BodyCashRegister extends StatelessWidget {
  const BodyCashRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const RecentSalesContainer(),
        SaleRegisterContainer(
          price: 'R\$ 150,00',
          quantity: 1,
          product: 'Tênis',
          date: DateTime.now(),
        ),
        SaleRegisterContainer(
          price: 'R\$ 250,00',
          quantity: 2,
          product: 'Tênis',
          date: DateTime.now(),
        ),
      ],
    );
  }
}
