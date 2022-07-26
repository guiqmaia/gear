import 'package:flutter/material.dart';
import '../../../infra/database/gear_database.dart';
import '../../../infra/models/category_model.dart';

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
    refreshCategories();
  }

  Future refreshCategories() async {
    setState(() => isLoading = true);
    categories = await GearDatabase.instance.selectCategories();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: isLoading
          ? const CircularProgressIndicator()
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
              ),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                CategoryModel category = categories[index];
                return ContainerCategoryInventory(
                  categoryModel: category,
                );
              },
            ),
    );
  }
}
