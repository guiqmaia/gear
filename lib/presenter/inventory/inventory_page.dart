import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../home/home_page.dart';
import '../shared/widgets/btn_standard_app.dart';
import '../shared/widgets/text_field_app.dart';
import '../shared/widgets/top_bar_app.dart';

import '../product_signup/product_signup_page.dart';
import 'widgets/container_category_inventory.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
        ),
      ),
      bottomNavigationBar: BtnStandardApp(
        title: 'Novo produto',
        pageRoute: const ProductSignupPage(),
        widthBtn: MediaQuery.of(context).size.width,
      ),
    );
  }
}

