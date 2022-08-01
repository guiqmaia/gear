import 'package:flutter/material.dart';
import '../../product/product_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/widgets/text_field_app.dart';

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
        ),
        TextFieldApp(
          labelItem: 'Preço',
          typeController: newPriceController.state,
          isObscured: false,
        ),
        TextFieldApp(
          labelItem: 'Quantidade',
          typeController: newQuantityController.state,
          isObscured: false,
        ),
      ],
    );
  }
}
