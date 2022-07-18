import 'package:flutter/material.dart';
import 'package:gear/infra/database/gear_database.dart';

import '../../../core/app_assets.dart';
import '../../../infra/models/product_model.dart';
import '../../category/category_page.dart';
import '../../shared/widgets/text_field_app.dart';
import '../../shared/widgets/top_bar_app.dart';
import 'container_product_category.dart';

class BodyProductPage extends StatefulWidget {
  BodyProductPage({
    Key? key,
    required this.categoryTitle,
  }) : super(key: key);

  final String categoryTitle;

  @override
  State<BodyProductPage> createState() => _BodyProductPageState();
}

class _BodyProductPageState extends State<BodyProductPage> {
  Map<String, List<ProductModel>> productsList = {};

  @override
  void didChangeDependencies() {
    GearDatabase gearDatabase = GearDatabase();
  
    List<ProductModel> products = [];
    gearDatabase.select().then((value) => productsList);

    productsList.addAll({
      'Refrigerante': products,
    });
    // Provider.of<>(context)
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TopBarApp(
          title: widget.categoryTitle,
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
          itemCount: productsList['Refrigerante']!.length,
          itemBuilder: (context, index) {
            ProductModel product = productsList['Refrigerante']![index];
            return ContainerProductCategory(
              productName: product.name,
              productPrice: product.price.toString(),
              productQuantity: product.quantity,
              productCode: product.id!,
              productImg: product.image,
            );
          },
        ),
      ],
    );
  }
}
