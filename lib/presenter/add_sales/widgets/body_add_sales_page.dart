import 'package:flutter/material.dart';

import '../../../shared/widgets/top_bar_app.dart';
import 'wrap_textfield_add_sale.dart';

class BodySalesPage extends StatelessWidget {
  const BodySalesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: const [
        TopBarApp(
          title: 'Adicionar venda',
          isProfile: false,
        ),
        WrapTextFieldSale(),
      ],
    );
  }
}
