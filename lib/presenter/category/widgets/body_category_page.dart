import 'package:flutter/material.dart';

import '../../../shared/widgets/text_field_app.dart';
import '../../../shared/widgets/top_bar_app.dart';
import '../../home/home_page.dart';
import 'wrap_container_category.dart';

class BodyCategoryPage extends StatelessWidget {
  BodyCategoryPage({Key? key}) : super(key: key);

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopBarApp(
          title: 'Estoque',
          pageRoute: HomePage(),
          isProfile: false,
        ),
        const SizedBox(height: 10),
        TextFieldApp(
          labelItem: 'Pesquisar',
          typeController: searchController,
          isObscured: false,
        ),
        const WrapContainerCategory(),
      ],
    );
  }
}
