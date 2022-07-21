import 'package:flutter/material.dart';
import 'package:gear/presenter/shared/widgets/text_field_app.dart';

import '../../home/home_page.dart';
import '../../shared/widgets/top_bar_app.dart';
import 'wrap_container_category.dart';

class BodyCategoryPage extends StatelessWidget {
  BodyCategoryPage({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopBarApp(
          title: 'Estoque',
          pageRoute: HomePage(),
          isProfile: false,
        ),
        TextFieldApp(
          labelItem: 'Pesquisar',
          iconInput: Icons.search,
          typeController: searchController,
          isObscured: false,
        ),
        const SizedBox(height: 10),
        const WrapContainerCategory(),
      ],
    );
  }
}
