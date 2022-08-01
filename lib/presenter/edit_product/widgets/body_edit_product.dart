import 'package:flutter/material.dart';

import '../../../infra/models/category_model.dart';

import '../../../shared/widgets/top_bar_app.dart';
import 'btn_edit_product.dart';
import 'wrap_text_field_edit_product.dart';

class BodyEditProduct extends StatelessWidget {
  const BodyEditProduct({
    Key? key,
    required this.productCode,
    required this.category,
  }) : super(key: key);

  final int productCode;
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopBarApp(
          title: 'Editar produto',
          isProfile: false,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        const WrapTextFieldEditProduct(),
        BtnEditProduct(
          productCode: productCode,
          category: category,
        ),
      ],
    );
  }
}
