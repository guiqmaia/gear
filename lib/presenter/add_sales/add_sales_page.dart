import 'package:flutter/material.dart';

import '../../core/app_assets.dart';
import 'widgets/body_add_sales_page.dart';
import 'widgets/bottom_btn_add_sales.dart';

class AddSalesPage extends StatelessWidget {
  const AddSalesPage({Key? key}) : super(key: key);

  static const route = '/sales/add';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      body: const SingleChildScrollView(
        child: BodySalesPage(),
      ),
      bottomNavigationBar: const BottomBtnSales(),
    );
  }
}
