import 'package:flutter/material.dart';

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
        ),
        TextFieldApp(
          labelItem: 'Preço',
          typeController: newPriceController,
          isObscured: false,
        ),
        TextFieldApp(
          labelItem: 'Quantidade',
          typeController: newQuantityController,
          isObscured: false,
        ),
      ],
    );
  }
}
