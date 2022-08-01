import 'package:flutter/material.dart';

import '../../../shared/widgets/top_bar_app.dart';
import 'listview_signup_product.dart';

class BodySignupPage extends StatelessWidget {
  const BodySignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopBarApp(
          title: 'Cadastrar Produto',
          isProfile: false,
        ),
        Expanded(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const ListViewSingupProduct(),
          ),
        ),
      ],
    );
  }
}
