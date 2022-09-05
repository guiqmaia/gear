import 'package:flutter/material.dart';

import '../../infra/models/product_model.dart';

import '../../core/app_assets.dart';
import '../../infra/models/category_model.dart';
import 'widgets/body_edit_product.dart';

class EditProductPage extends StatelessWidget {
  final CategoryModel category;
  final ProductModel product;

  const EditProductPage({
    Key? key,
    required this.category,
    required this.product,
  }) : super(key: key);

  static const route = '/product/edit';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      body: SingleChildScrollView(
        child: BodyEditProduct(
          category: category,
          product: product,
        ),
      ),
    );
  }
}
