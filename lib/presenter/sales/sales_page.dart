import 'package:flutter/material.dart';

import 'widgets/body_sales_page.dart';

class SalesPage extends StatelessWidget {
  const SalesPage({Key? key}) : super(key: key);

  static const route = '/sales';

  @override
  Widget build(BuildContext context) {
    return const BodyCashRegister();
  }
}
