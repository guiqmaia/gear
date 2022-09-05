import 'package:flutter/material.dart';

import '../../../infra/models/category_model.dart';
import '../../../infra/models/product_model.dart';
import '../../../shared/widgets/top_bar_app.dart';
import 'btn_edit_product.dart';
import 'wrap_text_field_edit_product.dart';

class BodyEditProduct extends StatelessWidget {
  final ProductModel product;
  final CategoryModel category;

  const BodyEditProduct({
    Key? key,
    required this.product,
    required this.category,
  }) : super(key: key);

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
          product: product,
          category: category,
        ),
      ],
    );
  }
}
