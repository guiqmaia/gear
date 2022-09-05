import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/app_assets.dart';
import '../../../infra/providers/login_providers.dart';
import '../../../infra/providers/product_providers.dart';
import '../../../shared/widgets/text_field_app.dart';
import '../../product_signup/Widgets/default_image_container.dart';
import 'focus_node_edit_product_page.dart';

class WrapTextFieldEditProduct extends StatefulHookConsumerWidget {
  const WrapTextFieldEditProduct({Key? key}) : super(key: key);

  @override
  ConsumerState<WrapTextFieldEditProduct> createState() => _WrapTextFieldEditProductState();
}

class _WrapTextFieldEditProductState extends ConsumerState<WrapTextFieldEditProduct> {
  @override
  Widget build(BuildContext context) {
    final newNameController = ref.watch(nameProductControllerProvider.state);
    final newPriceController = ref.watch(priceControllerProvider.state);
    final newQuantityController = ref.watch(quantityControllerProvider.state);
    final photoProduct = ref.watch(photoProductProvider.state);

    Future pickImage() async {
      try {
        final image = await ImagePicker().pickImage(source: ImageSource.gallery);

        if (image == null) return;

        final imageTemp = File(image.path);

        setState(
          () {
            photoProduct.state = imageTemp;
            photo = imageTemp.readAsBytesSync();
          },
        );
      } on PlatformException catch (e) {
        debugPrint('Failed to pick image: $e');
      }
    }

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
        Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: greenNeon,
            ),
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.symmetric(
              vertical: 3,
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextButton(
              onPressed: (() => pickImage()),
              child: const Text(
                'Selecionar Imagem',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          width: MediaQuery.of(context).size.width,
          child: photoProduct.state.path != '' ? Image.memory(photo!) : const DefaulImageContainer(),
        ),
      ],
    );
  }
}
