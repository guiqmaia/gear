import 'package:flutter/material.dart';

import 'adding_new_sales.dart';
import 'cash_register_title.dart';
import 'recent_sales_container.dart';
import 'sale_register_container.dart';

class BodyCashRegister extends StatelessWidget {
  const BodyCashRegister({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CashRegisterTitle(),
        const RecentSalesContainer(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: const [
              SaleRegisterContainer(),
              SaleRegisterContainer(),
              SaleRegisterContainer(),
              SaleRegisterContainer(),
              SaleRegisterContainer(),
            ],
          ),
        ),
        const AddingNewSales(),
      ],
    );
  }
}
