import 'package:flutter/material.dart';

import '../../home/home_page.dart';
import '../../shared/widgets/text_field_app.dart';
import '../../shared/widgets/top_bar_app.dart';
import 'wrap_container_category.dart';

class BodyCategoryPage extends StatelessWidget {
  const BodyCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopBarApp(
          title: 'Estoque',
          pageRoute: HomePage(),
          isProfile: true,
        ),
        TextFieldApp(
          labelItem: 'Pesquisar',
          iconInput: Icons.search,
          typeController: null,
        ),
        const SizedBox(height: 10),
        const WrapContainerCategory(),
      ],
    );
  }
}