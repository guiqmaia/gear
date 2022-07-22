import 'package:flutter/material.dart';

import '../../home/home_page.dart';
import '../../../shared/widgets/top_bar_app.dart';
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
          isProfile: false,
        ),
        const RecentSalesContainer(),
        Wrap(
          direction: Axis.vertical,
          children: salesList,
        ),
      ],
    );
  }
}