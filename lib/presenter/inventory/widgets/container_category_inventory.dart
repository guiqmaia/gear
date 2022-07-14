import 'package:flutter/material.dart';

import '../../product/product_page.dart';

class ContainerCategoryInventory extends StatelessWidget {
  final String categoryTitle;
  final dynamic categoryImg;

  const ContainerCategoryInventory({
    Key? key,
    required this.categoryTitle,
    required this.categoryImg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ProductPage(),
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
              categoryImg,
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            const SizedBox(height: 13),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                categoryTitle,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
