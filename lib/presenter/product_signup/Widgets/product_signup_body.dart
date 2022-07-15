import 'package:flutter/material.dart';
import 'package:gear/presenter/home/home_page.dart';
import 'package:gear/presenter/shared/widgets/btn_standard_app.dart';
import 'package:gear/presenter/shared/widgets/text_field_app.dart';

import '../../shared/widgets/top_bar_app.dart';

class SignupPageBody extends StatelessWidget {
  const SignupPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopBarApp(
          title: 'Cadastrar Produto',
          pageRoute: HomePage(),
          isProfile: true,
        ),
        Expanded(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: const [
                TextFieldApp(
                  labelItem: 'Nome',
                  iconInput: Icons.format_color_text_sharp,
                  typeController: null,
                  isObscured: false,
                ),
                TextFieldApp(
                  labelItem: 'Preço',
                  iconInput: Icons.attach_money,
                  typeController: null,
                  isObscured: false,
                ),
                TextFieldApp(
                  labelItem: 'Categoria',
                  iconInput: Icons.tag,
                  typeController: null,
                  isObscured: false,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
