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
        Wrap(
          children: const [
            SaleRegisterContainer(
              price: 'R\$ 150,00',
              quantity: 1,
              product: 'Tênis',
            ),
            SaleRegisterContainer(
              price: 'R\$ 500,00',
              quantity: 2,
              product: 'Bolsa',
            ),
            SaleRegisterContainer(
              price: 'R\$ 1000,00',
              quantity: 10,
              product: 'Camiseta',
            ),
          ],
        ),
      ],
    );
  }
}
