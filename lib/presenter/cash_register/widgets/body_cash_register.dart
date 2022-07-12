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
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: const [
              SaleRegisterContainer(
                price: 'R\$150,00',
                quantity: 1,
                product: 'Tênis',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
