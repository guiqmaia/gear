import 'package:flutter/material.dart';

import '../../../infra/database/gear_database.dart';
import '../../../infra/models/product_model.dart';
import '../../category/category_page.dart';
import '../../shared/widgets/text_field_app.dart';
import '../../shared/widgets/top_bar_app.dart';
import 'container_product_category.dart';

class BodyProductPage extends StatefulWidget {
  final String categoryTitle;

  const BodyProductPage({
    Key? key,
    required this.categoryTitle,
  }) : super(key: key);

  @override
  State<BodyProductPage> createState() => _BodyProductPageState();
}

class _BodyProductPageState extends State<BodyProductPage> {
  List<ProductModel> products = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshProducts();
  }

  Future refreshProducts() async {
    setState(() => isLoading = true);
    products = await GearDatabase.instance.select(widget.categoryTitle);
    setState(() => isLoading = false);
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
        isLoading
            ? const CircularProgressIndicator()
            : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  ProductModel product = products[index];
                  return ContainerProductCategory(
                    productName: product.name,
                    productPrice: product.price.toString(),
                    productQuantity: product.quantity,
                    productCode: product.id!,
                    productImg: product.image, 
                    products: products,
                  );
                },
              ),
      ],
    );
  }
}
