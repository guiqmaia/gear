import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/app_assets.dart';
import '../../../infra/database/gear_database.dart';
import '../../../infra/models/product_model.dart';
import '../../product/product_page.dart';
import '../../../shared/widgets/dropdown_input.dart';
import '../../../shared/widgets/text_field_app.dart';
import 'default_image_container.dart';

class ListViewSingupProduct extends StatefulWidget {
  const ListViewSingupProduct({
    Key? key,
    required this.nameController,
    required this.priceController,
    required this.categoryController,
    required this.quantityController,
    required this.mounted,
  }) : super(key: key);

  final TextEditingController nameController;
  final TextEditingController priceController;
  final TextEditingController categoryController;
  final TextEditingController quantityController;
  final bool mounted;

  @override
  State<ListViewSingupProduct> createState() => _ListViewSingupProductState();
}

class _ListViewSingupProductState extends State<ListViewSingupProduct> {
  String? dropdownValue;

  List<DropdownMenuItem<String>> list = const [
    DropdownMenuItem(value: 'Refrigerante', child: Text('Refrigerante')),
    DropdownMenuItem(value: 'Cerveja', child: Text('Cerveja')),
    DropdownMenuItem(value: 'Vinho', child: Text('Vinho')),
    DropdownMenuItem(value: 'Destilado', child: Text('Destilado')),
    DropdownMenuItem(value: 'Energético', child: Text('Energético')),
    DropdownMenuItem(value: 'Água', child: Text('Água')),
  ];

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
      // ignore: avoid_print
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        TextFieldApp(
          labelItem: 'Nome',
          typeController: widget.nameController,
          isObscured: false,
        ),
        TextFieldApp(
          labelItem: 'Preço',
          typeController: widget.priceController,
          isObscured: false,
        ),
        DropDownInput(
          dropdownList: list,
          labelDropdown: 'Escolha a Categoria',
          iconDropdown: Icons.tag,
          selectedValue: dropdownValue,
          selectedValueController: widget.categoryController,
        ),
        TextFieldApp(
          labelItem: 'Quantidade',
          typeController: widget.quantityController,
          isObscured: false,
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
          child: image != null
              ? Image.memory(photo!)
              : const DefaulImageContainer(),
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
              if (int.parse(widget.quantityController.text) < 0) {
                return;
              }

              if (double.parse(widget.priceController.text) < 0) {
                return;
              }

              ProductModel productModel = ProductModel(
                name: widget.nameController.text,
                price: double.parse(widget.priceController.text),
                categoryId: int.parse(widget.categoryController.text),
                quantity: int.parse(widget.quantityController.text),
                image: photo!,
              );
              await GearDatabase.instance.insert('product', productModel);
              if (!widget.mounted) return;
              Navigator.of(context).pop();
              Navigator.of(context).pop();
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
