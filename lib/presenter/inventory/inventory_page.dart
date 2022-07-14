import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../product_signup/product_signup_page.dart';
import '../shared/widgets/btn_standard_app.dart';
import 'widgets/body_inventory_page.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SingleChildScrollView(
        child: BodyInventoryPage(),
      ),
      bottomNavigationBar: BtnStandardApp(
        title: 'Novo produto',
        pageRoute: const ProductSignupPage(),
        widthBtn: MediaQuery.of(context).size.width,
      ),
    );
  }
}

