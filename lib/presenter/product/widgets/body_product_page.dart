import 'dart:async';

import 'package:flutter/material.dart';

import '../../../infra/database/gear_database.dart';
import '../../../infra/models/category_model.dart';
import '../../../infra/models/product_model.dart';
import '../../../shared/widgets/text_field_app.dart';
import '../../../shared/widgets/top_bar_app.dart';
import '../../category/category_page.dart';
import 'container_product_category.dart';

class BodyProductPage extends StatefulWidget {
  final CategoryModel category;

  const BodyProductPage({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<BodyProductPage> createState() => _BodyProductPageState();
}

class _BodyProductPageState extends State<BodyProductPage> {
  List<ProductModel> products = [];
  bool isLoading = false;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    refreshProducts();
  }

  Future refreshProducts() async {
    setState(() => isLoading = true);
    products = await GearDatabase.instance
        .selectProductsByCategory(widget.category.id!);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TopBarApp(
          title: widget.category.name,
          pageRoute: const CategoryPage(),
          isProfile: false,
        ),
        const SizedBox(height: 10),
        TextFieldApp(
          labelItem: 'Pesquisar',
          typeController: searchController,
          isObscured: false,
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
                    categoryTitle: widget.category.name,
                  );
                },
              ),
      ],
    );
  }
}
