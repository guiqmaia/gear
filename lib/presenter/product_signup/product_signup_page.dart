import 'package:flutter/material.dart';
import '../home/home_page.dart';
import '../shared/widgets/top_bar_app.dart';

import 'Widgets/gradient_form_button.dart';
import 'Widgets/text_form_signup.dart';

class ProductSignupPage extends StatelessWidget {
  const ProductSignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          const TopBarApp(
            title: 'Cadastrar Produto',
            pageRoute: HomePage(),
            isProfile: true,
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  color: Colors.white,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(
                      bottom: 30,
                      right: 50,
                      left: 50,
                    ),
                    children: const [
                      TextFormSignup(label: 'Nome'),
                      TextFormSignup(label: 'Preço'),
                      TextFormSignup(label: 'Categoria'),
                      GradientFormButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
