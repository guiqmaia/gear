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
          categoryImg: imgBeer,
          categoryTitle: 'Cerveja',
        ),
        ContainerCategoryInventory(
          categoryImg: imgWines,
          categoryTitle: 'Vinho',
        ),
        ContainerCategoryInventory(
          categoryImg: imgDistilled,
          categoryTitle: 'Destilado',
        ),
        ContainerCategoryInventory(
          categoryImg: imgEnergyDrink,
          categoryTitle: 'Energético',
        ),
        ContainerCategoryInventory(
          categoryImg: imgWaterBottle,
          categoryTitle: 'Água',
        ),
      ],
    );
  }
}
