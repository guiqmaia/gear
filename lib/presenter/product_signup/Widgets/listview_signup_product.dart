import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/app_assets.dart';
import '../../../infra/models/product_model.dart';
import '../../../infra/providers/product_providers.dart';
import '../../../shared/widgets/dropdown_input.dart';
import '../../../shared/widgets/text_field_app.dart';
import '../../category/widgets/wrap_container_category.dart';
import '../../product/widgets/body_product_page.dart';
import '../Widgets/focus_node_product_signup.dart';
import 'default_image_container.dart';

class ListViewSingupProduct extends StatefulHookConsumerWidget {
  const ListViewSingupProduct({Key? key}) : super(key: key);

  @override
  ConsumerState<ListViewSingupProduct> createState() => _ListViewSingupProductState();
}

class _ListViewSingupProductState extends ConsumerState<ListViewSingupProduct> {
  String? dropdownValue;

  Uint8List? photo;
  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        this.image = imageTemp;
        photo = imageTemp.readAsBytesSync();
      });
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final nameProductController = ref.watch(nameProductControllerProvider.state);
    final priceController = ref.watch(priceControllerProvider.state);
    final categoryController = ref.watch(categoryControllerProvider.state);
    final quantityController = ref.watch(quantityControllerProvider.state);

    final listCategories = ref.watch(categoryNotifier);

    void clearController() {
      nameProductController.state.clear();
      priceController.state.clear();
      quantityController.state.clear();
    }

    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        TextFieldApp(
          labelItem: 'Nome',
          typeController: nameProductController.state,
          isObscured: false,
          focus: focusNameProductSignUpPage,
          nextFocus: focusPriceProductSignUpPage,
        ),
        TextFieldApp(
          labelItem: 'Preço',
          typeController: priceController.state,
          isObscured: false,
          focus: focusPriceProductSignUpPage,
          nextFocus: focusQuantityProductSignUpPage,
        ),
        DropDownInput(
          dropdownList: listCategories.map(
            (category) {
              return DropdownMenuItem<String>(
                value: category.id.toString(),
                child: Text(category.name),
              );
            },
          ).toList(),
          labelDropdown: 'Escolha a Categoria',
          iconDropdown: Icons.tag,
          selectedValue: dropdownValue,
          selectedValueController: categoryController.state,
        ),
        TextFieldApp(
          labelItem: 'Quantidade',
          typeController: quantityController.state,
          isObscured: false,
          focus: focusQuantityProductSignUpPage,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: greenNeon,
          ),
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.symmetric(
            vertical: 3,
          ),
          width: MediaQuery.of(context).size.width * 0.8,
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
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          width: MediaQuery.of(context).size.width,
          child: image != null ? Image.memory(photo!) : const DefaulImageContainer(),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: greenNeon,
          ),
          margin: const EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.symmetric(
            vertical: 3,
          ),
          child: TextButton(
            onPressed: () async {
              if (int.parse(quantityController.state.text) < 0) {
                return;
              }

              if (double.parse(priceController.state.text) < 0) {
                return;
              }

              final categoryModel = ref.watch(categoryModelProvider.notifier).state;

              ProductModel productModel = ProductModel(
                name: nameProductController.state.text,
                price: double.parse(priceController.state.text),
                categoryId: int.parse(categoryController.state.value.text),
                quantity: int.parse(quantityController.state.text),
                image: base64Encode(photo!.buffer.asUint8List()),
              );

              ref.watch(productNotifier.notifier).addProduct(productModel, categoryModel);

              if (!mounted) return;

              Navigator.of(context).pop();

              clearController();
            },
            child: const Text(
              'Cadastrar',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
