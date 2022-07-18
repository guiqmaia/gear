import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gear/presenter/shared/widgets/top_bar_app.dart';

import '../category/category_page.dart';
import '../shared/widgets/btn_standard_app.dart';

class CategorySignupPage extends StatelessWidget {
  const CategorySignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          TopBarApp(
            title: 'Cadastrar categoria',
            pageRoute: CategoryPage(),
            isProfile: true,
          ),
        ],
      ),
      bottomNavigationBar: BtnStandardApp(
        title: 'Concluir',
        pageRoute: const CategoryPage(),
        widthBtn: MediaQuery.of(context).size.width,
      ),
    );
  }
}
