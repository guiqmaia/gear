import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gear/infra/models/product_model.dart';

import '../../core/app_assets.dart';
import '../inventory/inventory_page.dart';
import '../shared/widgets/text_field_app.dart';
import '../shared/widgets/top_bar_app.dart';
import 'widgets/container_product_category.dart';

class CategoryPage extends StatelessWidget {
  final String categoryTitle;
  final dynamic categoryImg;

  CategoryPage({
    Key? key,
    required this.categoryTitle,
    required this.categoryImg,
  }) : super(key: key);

  Map<String, List<ProductModel>> products = {
    'Tênis': [
      ProductModel(
        title: 'Tênis branco',
        imgPath: imgWhiteSneakers,
        productCode: 123,
        productQuantity: 12,
        productPrice: 10.5,
      ),
      ProductModel(
        title: 'Tênis branco',
        imgPath: imgWhiteSneakers,
        productCode: 123,
        productQuantity: 12,
        productPrice: 10.5,
      ),
    ],
    'Camiseta': <ProductModel>[
      ProductModel(
        title: 'Camisas',
        imgPath: imgWhiteSneakers,
        productCode: 123,
        productQuantity: 12,
        productPrice: 10.5,
      ),
      ProductModel(
        title: 'Camisas',
        imgPath: imgWhiteSneakers,
        productCode: 123,
        productQuantity: 12,
        productPrice: 10.5,
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
              pageRoute: const InventoryPage(),
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
                  productName: product.title,
                  productPrice: product.productPrice.toString(),
                  productQuantity: product.productQuantity,
                  productCode: product.productCode,
                  productImg: product.imgPath,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
