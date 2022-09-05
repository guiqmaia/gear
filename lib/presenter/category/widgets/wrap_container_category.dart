import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../infra/models/category_model.dart';
import '../../../infra/providers/product_providers.dart';
import 'container_category_inventory.dart';

final categoryNotifier = StateNotifierProvider<CategoryNotifier, List<CategoryModel>>(
  (ref) => CategoryNotifier(),
);

class WrapContainerCategory extends HookConsumerWidget {
  WrapContainerCategory({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoryNotifier);

    return Visibility(
      visible: categories.isNotEmpty,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
        ),
        padding: const EdgeInsets.only(
          bottom: 25,
          top: 10,
          left: 15,
          right: 15,
        ),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ContainerCategoryInventory(
            categoryModel: categories[index],
          );
        },
      ),
    );
  }
}
