import 'package:flutter/material.dart';

import '../../../infra/models/product_model.dart';
import '../../category/category_page.dart';
import '../../shared/widgets/text_field_app.dart';
import '../../shared/widgets/top_bar_app.dart';
import 'container_product_category.dart';

class BodyProductPage extends StatelessWidget {
  const BodyProductPage({
    Key? key,
    required this.categoryTitle,
    required this.productsList,
  }) : super(key: key);

  final String categoryTitle;
  final Map<String, List<ProductModel>> productsList;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TopBarApp(
          title: categoryTitle,
          pageRoute: const CategoryPage(),
          isProfile: true,
        ),
        const SizedBox(height: 10),
        TextFieldApp(
          labelItem: 'Pesquisar',
          iconInput: Icons.search,
          typeController: null,
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: productsList[categoryTitle]!.length,
          itemBuilder: (context, index) {
            ProductModel product = productsList[categoryTitle]![index];
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
    );
  }
}