
import 'package:flutter/material.dart';
import 'package:gear/core/app_assets.dart';

import 'container_category_inventory.dart';

class WrapContainerCategory extends StatelessWidget {
  const WrapContainerCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: [
        ContainerCategoryInventory(
          categoryImg: imgSneakers,
          categoryTitle: 'Tênis',
        ),
        ContainerCategoryInventory(
          categoryImg: imgTshirt,
          categoryTitle: 'Camiseta',
        ),
        ContainerCategoryInventory(
          categoryImg: imgCoat,
          categoryTitle: 'Casaco',
        ),
        ContainerCategoryInventory(
          categoryImg: imgPants,
          categoryTitle: 'Calça',
        ),
      ],
    );
  }
}
