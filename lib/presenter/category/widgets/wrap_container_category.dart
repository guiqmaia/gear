import 'package:flutter/material.dart';

import '../../../core/app_assets.dart';
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
          categoryImg: imgSodas,
          categoryTitle: 'Refrigerante',
        ),
        ContainerCategoryInventory(
          categoryImg: imgSodas,
          categoryTitle: 'Cerveja',
        ),
        ContainerCategoryInventory(
          categoryImg: imgSodas,
          categoryTitle: 'Vinho',
        ),
        ContainerCategoryInventory(
          categoryImg: imgSodas,
          categoryTitle: 'Destilado',
        ),
        ContainerCategoryInventory(
          categoryImg: imgSodas,
          categoryTitle: 'Energético',
        ),
        ContainerCategoryInventory(
          categoryImg: imgSodas,
          categoryTitle: 'Água',
        ),
      ],
    );
  }
}
