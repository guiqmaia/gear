import 'package:flutter/material.dart';
import 'package:gear/infra/database/create_database_products.dart';
import 'package:gear/infra/database/gear_database.dart';

import '../../../core/app_assets.dart';
import '../../product/product_page.dart';

class ContainerCategoryInventory extends StatefulWidget {
  final String categoryTitle;
  final dynamic categoryImg;

  const ContainerCategoryInventory({
    Key? key,
    required this.categoryTitle,
    required this.categoryImg,
  }) : super(key: key);

  @override
  State<ContainerCategoryInventory> createState() =>
      _ContainerCategoryInventoryState();
}

class _ContainerCategoryInventoryState
    extends State<ContainerCategoryInventory> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                ProductPage(categoryTitle: widget.categoryTitle),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
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
            Image.asset(
              widget.categoryImg,
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
                widget.categoryTitle,
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
