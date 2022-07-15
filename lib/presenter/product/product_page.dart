import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../core/app_assets.dart';
import '../../infra/models/product_model.dart';
import '../category/category_page.dart';
import '../shared/widgets/text_field_app.dart';
import '../shared/widgets/top_bar_app.dart';
import 'widgets/container_product_category.dart';

class ProductPage extends StatelessWidget {
  final String categoryTitle;
  final dynamic categoryImg;

  ProductPage({
    Key? key,
    required this.categoryTitle,
    required this.categoryImg,
  }) : super(key: key);

  Map<String, List<ProductModel>> products = {
    'Refrigerante': [
      ProductModel(
        productTitle: 'Coca Cola',
        productImg: Uint8List(1),
        productCode: 1001,
        productQuantity: 10,
        productPrice: 4.5,
      ),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TopBarApp(
              title: categoryTitle,
              pageRoute: const CategoryPage(),
              isProfile: true,
            ),
            TextFieldApp(
              labelItem: 'Pesquisar',
              iconInput: Icons.search,
              typeController: null,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: products[categoryTitle]!.length,
              itemBuilder: (context, index) {
                ProductModel product = products[categoryTitle]![index];
                return ContainerProductCategory(
                  productName: product.productTitle,
                  productPrice: product.productPrice.toString(),
                  productQuantity: product.productQuantity,
                  productCode: product.productCode,
                  productImg: product.productImg,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
