import 'package:flutter/material.dart';
import 'package:gear/presenter/edit_product/widgets/focus_node_edit_product_page.dart';

import '../../../shared/widgets/text_field_app.dart';

class WrapTextFieldEditProduct extends StatelessWidget {
  const WrapTextFieldEditProduct({
    Key? key,
    required this.newNameController,
    required this.newPriceController,
    required this.newQuantityController,
  }) : super(key: key);

  final TextEditingController newNameController;
  final TextEditingController newPriceController;
  final TextEditingController newQuantityController;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        TextFieldApp(
          labelItem: 'Nome',
          typeController: newNameController,
          isObscured: false,
          focus: focusNameEditProductPage,
          nextFocus: focusPriceEditProductPage,
        ),
        TextFieldApp(
          labelItem: 'Preço',
          typeController: newPriceController,
          isObscured: false,
          focus: focusPriceEditProductPage,
          nextFocus: focusQuantityEditProductPage,
        ),
        TextFieldApp(
          labelItem: 'Quantidade',
          typeController: newQuantityController,
          isObscured: false,
          focus: focusQuantityEditProductPage,
        ),
      ],
    );
  }
}
