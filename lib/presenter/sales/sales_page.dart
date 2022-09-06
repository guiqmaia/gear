import 'package:flutter/material.dart';

import '../../core/app_assets.dart';
import '../../shared/widgets/btn_standard_app.dart';
import '../add_sales/add_sales_page.dart';
import 'widgets/body_sales_page.dart';

class SalesPage extends StatelessWidget {
  const SalesPage({Key? key}) : super(key: key);

  static const route = '/sales';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      body: const SingleChildScrollView(
        child: BodySalesPage(),
      ),
      bottomNavigationBar: BtnStandardApp(
        title: 'Adicionar venda',
        pageRoute: AddSalesPage.route,
        widthBtn: MediaQuery.of(context).size.width,
      ),
    );
  }
}
