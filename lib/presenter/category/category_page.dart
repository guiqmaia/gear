import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../inventory/inventory_page.dart';
import '../shared/widgets/top_bar_app.dart';

class CategoryPage extends StatelessWidget {
  final String categoryTitle;
  final dynamic categoryImg;

  const CategoryPage({
    Key? key,
    required this.categoryTitle,
    required this.categoryImg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBarApp(
              title: categoryTitle,
              pageRoute: const InventoryPage(),
              isProfile: true,
            ),
          ],
        ),
      ),
    );
  }
}
