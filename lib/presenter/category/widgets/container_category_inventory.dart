import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/app_assets.dart';
import '../../../infra/models/category_model.dart';
import '../../../infra/providers/product_providers.dart';
import '../../product/product_page.dart';
import '../../product/widgets/body_product_page.dart';

class ContainerCategoryInventory extends HookConsumerWidget {
  final CategoryModel categoryModel;

  const ContainerCategoryInventory({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryModelController = ref.watch(categoryModelProvider.state);

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        ref.watch(productNotifier.notifier).getAllProducts(categoryModel);

        categoryModelController.state = categoryModel;

        Navigator.of(context).pushNamed(
          ProductPage.route,
          arguments: categoryModel,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.memory(
              base64Decode(categoryModel.image),
              height: MediaQuery.of(context).size.height * 0.13,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 3,
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
    );
  }
}
