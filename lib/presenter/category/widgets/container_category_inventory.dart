import 'package:flutter/material.dart';
import 'package:gear/infra/models/category_model.dart';

import '../../../core/app_assets.dart';
import '../../product/product_page.dart';

class ContainerCategoryInventory extends StatefulWidget {
  final CategoryModel categoryModel;

  const ContainerCategoryInventory({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);

  @override
  State<ContainerCategoryInventory> createState() =>
      _ContainerCategoryInventoryState();
}

class _ContainerCategoryInventoryState
    extends State<ContainerCategoryInventory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProductPage(category: widget.categoryModel),
            ),
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
                widget.categoryModel.image,
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              const SizedBox(height: 13),
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
                  widget.categoryModel.name,
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
