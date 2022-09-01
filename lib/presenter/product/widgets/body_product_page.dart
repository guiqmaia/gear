import 'package:flutter/material.dart';
import 'package:gear/presenter/product/widgets/focus_node_product_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../infra/models/category_model.dart';
import '../../../infra/models/product_model.dart';
import '../../../shared/widgets/text_field_app.dart';
import '../../../shared/widgets/top_bar_app.dart';
import '../../../infra/providers/product_providers.dart';
import 'container_product_category.dart';

final productNotifier =
    StateNotifierProvider<ProductNotifier, List<ProductModel>>(
  (ref) => ProductNotifier(),
);

class BodyProductPage extends HookConsumerWidget {
  final CategoryModel category;

  const BodyProductPage({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productNotifier);
    final searchController = ref.watch(searchControllerProvider.state);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TopBarApp(
          title: category.name,
          isProfile: false,
        ),
        const SizedBox(height: 10),
        TextFieldApp(
          labelItem: 'Pesquisar',
          typeController: searchController.state,
          isObscured: false,
          focus: focusSerchProductPage,
        ),
        Visibility(
          visible: products.isNotEmpty,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ContainerProductCategory(
                category: category,
                productModel: products[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
