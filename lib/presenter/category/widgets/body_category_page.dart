import 'package:flutter/material.dart';
import 'package:gear/presenter/category/widgets/focus_node_category_page.dart';

import '../../../shared/widgets/text_field_app.dart';
import '../../../shared/widgets/top_bar_app.dart';
import 'wrap_container_category.dart';

class BodyCategoryPage extends StatelessWidget {
  BodyCategoryPage({Key? key}) : super(key: key);

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopBarApp(
          title: 'Estoque',
          isProfile: false,
        ),
        const SizedBox(height: 10),
        TextFieldApp(
          labelItem: 'Pesquisar',
          typeController: searchController,
          isObscured: false,
          focus: focusSearchCategoryPage,
        ),
        WrapContainerCategory(),
      ],
    );
  }
}
