import 'package:flutter/material.dart';
import 'package:gear/core/app_assets.dart';

import '../../home/home_page.dart';
import '../../shared/widgets/top_bar_app.dart';
import 'recent_sales_container.dart';
import 'sale_register_container.dart';

class BodyCashRegister extends StatelessWidget {
  const BodyCashRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopBarApp(
          title: 'Caixa',
          pageRoute: HomePage(),
          isProfile: true,
        ),
        const RecentSalesContainer(),
        Wrap(
          children: [
            SaleRegisterContainer(
              price: 'R\$ 150,00',
              quantity: 1,
              product: 'Tênis',
              productImg: imgSneakers,
            ),
            SaleRegisterContainer(
              price: 'R\$ 300,00',
              quantity: 3,
              product: 'Camiseta',
              productImg: imgTshirt,
            ),
          ],
        ),
      ],
    );
  }
}
