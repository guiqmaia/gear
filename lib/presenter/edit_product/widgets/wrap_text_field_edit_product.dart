import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../infra/providers/product_providers.dart';
import '../../../shared/widgets/text_field_app.dart';
import 'focus_node_edit_product_page.dart';

class WrapTextFieldEditProduct extends HookConsumerWidget {
  const WrapTextFieldEditProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newNameController = ref.watch(nameProductControllerProvider.state);
    final newPriceController = ref.watch(priceControllerProvider.state);
    final newQuantityController = ref.watch(quantityControllerProvider.state);

    return Wrap(
      children: [
        TextFieldApp(
          labelItem: 'Nome',
          typeController: newNameController.state,
          isObscured: false,
          focus: focusNameEditProductPage,
          nextFocus: focusPriceEditProductPage,
        ),
        TextFieldApp(
          labelItem: 'Preço',
          typeController: newPriceController.state,
          isObscured: false,
          focus: focusPriceEditProductPage,
          nextFocus: focusQuantityEditProductPage,
        ),
        TextFieldApp(
          labelItem: 'Quantidade',
          typeController: newQuantityController.state,
          isObscured: false,
          focus: focusQuantityEditProductPage,
        ),
      ],
    );
  }
}
