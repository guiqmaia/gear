import 'package:flutter/material.dart';
import 'package:gear/infra/database/gear_database.dart';
import 'package:gear/infra/models/category_model.dart';

import '../../../core/app_assets.dart';
import 'container_category_inventory.dart';

class WrapContainerCategory extends StatefulWidget {
  const WrapContainerCategory({Key? key}) : super(key: key);

  @override
  State<WrapContainerCategory> createState() => _WrapContainerCategoryState();
}

class _WrapContainerCategoryState extends State<WrapContainerCategory> {
  List<CategoryModel> categories = [];

  bool isLoading = false;

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    refreshProducts();
  }

  Future refreshProducts() async {
    setState(() => isLoading = true);
    categories = await GearDatabase.instance.selectCategories();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          semanticChildCount: 2,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            CategoryModel category = categories[index];
            return ContainerCategoryInventory(
              categoryModel: category,
            );
          },
        ),
      ],
    );
  }
}
