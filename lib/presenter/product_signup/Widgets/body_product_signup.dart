import 'package:flutter/material.dart';

import '../../../shared/widgets/top_bar_app.dart';
import '../../home/home_page.dart';
import 'listview_signup_product.dart';

class BodySignupPage extends StatefulWidget {
  const BodySignupPage({Key? key}) : super(key: key);

  @override
  State<BodySignupPage> createState() => _BodySignupPageState();
}

class _BodySignupPageState extends State<BodySignupPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopBarApp(
          title: 'Cadastrar Produto',
          pageRoute: HomePage(),
          isProfile: false,
        ),
        Expanded(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ListViewSingupProduct(
              nameController: nameController,
              priceController: priceController,
              categoryController: categoryController,
              quantityController: quantityController,
              mounted: mounted,
            ),
          ),
        ),
      ],
    );
  }
}
