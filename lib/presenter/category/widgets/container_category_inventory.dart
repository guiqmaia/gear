import 'package:flutter/material.dart';
import '../../../infra/models/category_model.dart';
import '../../product/widgets/body_product_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/app_assets.dart';
import '../../product/product_page.dart';

class ContainerCategoryInventory extends HookConsumerWidget {
  final CategoryModel categoryModel;

  const ContainerCategoryInventory({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          ref.watch(productNotifier.notifier).getAllProducts(categoryModel);
          Navigator.of(context).pushNamed(
            ProductPage.route,
            arguments: categoryModel,
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 18,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                offset: const Offset(10, 12),
                blurRadius: 10,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(0.3),
              ),
            ],
          ),
          child: Column(
            children: [
              Image.memory(
                categoryModel.image,
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  categoryModel.name,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: backgroundGrey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
