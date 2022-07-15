import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../core/app_assets.dart';
import '../inventory/inventory_page.dart';
import '../shared/widgets/text_field_app.dart';
import '../shared/widgets/top_bar_app.dart';
import 'widgets/container_product_category.dart';

class CategoryPage extends StatelessWidget {
  final String categoryTitle;
  final dynamic categoryImg;

  const CategoryPage({
    Key? key,
    required this.categoryTitle,
    required this.categoryImg,
  }) : super(key: key);

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
            ContainerProductCategory(
              productName: 'Tênis branco',
              productPrice: 'R\$ 200,00',
              productCode: 1001,
              productQuantity: 4,
              productImg: imgWhiteSneakers,
            ),
            Divider(
              thickness: 1,
              indent: 20,
              endIndent: 20,
              color: Colors.purple.shade100,
            ),
            ContainerProductCategory(
              productName: 'Tênis vermelho com azul',
              productPrice: 'R\$ 250,00',
              productCode: 1002,
              productQuantity: 2,
              productImg: imgRedBlueSneakers,
            ),
            Divider(
              thickness: 1,
              indent: 20,
              endIndent: 20,
              color: Colors.purple.shade100,
            ),
          ],
        ),
      ),
    );
  }
}
