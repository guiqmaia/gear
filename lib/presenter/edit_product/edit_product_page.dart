import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../core/app_assets.dart';
import 'widgets/body_edit_product.dart';

class EditProductPage extends StatelessWidget {
  final int productCode;
  final String categoryTitle;

  const EditProductPage({
    Key? key,
    required this.productCode,
    required this.categoryTitle,
  }) : super(key: key);

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
