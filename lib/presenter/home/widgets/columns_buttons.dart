import 'package:flutter/material.dart';

import '../../cash_register/cash_register_page.dart';
import '../../category/category_page.dart';
import '../../shared/widgets/btn_standard_app.dart';

class ColumnButtons extends StatelessWidget {
  const ColumnButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        BtnStandardApp(
          title: "Caixa",
          widthBtn: MediaQuery.of(context).size.width * 0.7,
          pageRoute: const CashRegisterPage(),
        ),
        BtnStandardApp(
          title: "Estoque",
          widthBtn: MediaQuery.of(context).size.width * 0.7,
          pageRoute: const CategoryPage(),
        ),
      ],
    );
  }
}