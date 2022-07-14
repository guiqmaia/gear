import 'package:flutter/material.dart';

import '../../home/home_page.dart';
import '../../shared/widgets/text_field_app.dart';
import '../../shared/widgets/top_bar_app.dart';
import 'container_category_inventory.dart';

class BodyInventoryPage extends StatelessWidget {
  const BodyInventoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopBarApp(
          title: 'Estoque',
          pageRoute: HomePage(),
          isProfile: true,
        ),
        const TextFieldApp(
          labelItem: 'Pesquisar',
          iconInput: Icons.search,
          typeController: null,
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: const [
            ContainerCategoryInventory(
              categoryImg: 'assets/images/sneakers.png',
              categoryTitle: 'Tênis',
            ),
            ContainerCategoryInventory(
              categoryImg: 'assets/images/tshirt.png',
              categoryTitle: 'Camiseta',
            ),
            ContainerCategoryInventory(
              categoryImg: 'assets/images/coat.png',
              categoryTitle: 'Casaco',
            ),
            ContainerCategoryInventory(
              categoryImg: 'assets/images/pants.png',
              categoryTitle: 'Calça',
            ),
          ],
        ),
      ],
    );
  }
}
