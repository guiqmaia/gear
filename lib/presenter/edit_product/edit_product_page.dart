import 'package:flutter/material.dart';

import '../../core/app_assets.dart';
import 'widgets/body_edit_product.dart';

class EditProductPage extends StatelessWidget {
  final String categoryTitle;
  final int productCode;

  const EditProductPage({
    Key? key,
    required this.categoryTitle,
    required this.productCode,
  }) : super(key: key);

  static const route = '/product/edit';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      body: SingleChildScrollView(
        child: BodyEditProduct(
          categoryTitle: categoryTitle,
          productCode: productCode,
        ),
      ),
    );
  }
}
