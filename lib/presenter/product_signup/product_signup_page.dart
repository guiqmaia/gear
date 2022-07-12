import 'package:flutter/material.dart';

import 'Widgets/gradient_form_button.dart';
import 'Widgets/text_form_signup.dart';

class ProductSignupPage extends StatelessWidget {
  const ProductSignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 60),
            child: Text(
              'Cadastrar Produto',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    color: Colors.white,
                  ),
                ),
                Center(
                  child: SizedBox(
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
