import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

import 'package:gear/presenter/category/category_page.dart';
import 'package:gear/presenter/product/product_page.dart';

import '../../core/app_assets.dart';
import '../../infra/database/gear_database.dart';
import '../../shared/widgets/text_field_app.dart';
import '../../shared/widgets/top_bar_app.dart';
import '../product_signup/Widgets/default_image_container.dart';

class EditProductPage extends StatefulWidget {
  final int productCode;
  final String categoryTitle;

  const EditProductPage({
    Key? key,
    required this.productCode,
    required this.categoryTitle,
  }) : super(key: key);

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  TextEditingController newNameController = TextEditingController();
  TextEditingController newPriceController = TextEditingController();
  TextEditingController newQuantityController = TextEditingController();

  Uint8List? photo;
  File? img;

  Future pickImage() async {
    try {
      final img = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (img == null) return;
      final imageTemp = File(img.path);
      setState(() {
        this.img = imageTemp;
        photo = imageTemp.readAsBytesSync();
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to pick image: $e');
    }
  }

  Future updateProduct() async {
    if (newNameController.text != '') {
      await GearDatabase.instance.updateProduct(
        widget.productCode,
        'name',
        '"${newNameController.text}"',
      );
    }

    if (newPriceController.text != '') {
      await GearDatabase.instance.updateProduct(
        widget.productCode,
        'price',
        newPriceController.text,
      );
    }

    if (newQuantityController.text != '') {
      await GearDatabase.instance.updateProduct(
        widget.productCode,
        'quantity',
        newQuantityController.text,
      );
    }

    if (photo != null) {
      await GearDatabase.instance.updateProduct(
        widget.productCode,
        'image',
        photo,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopBarApp(
              title: 'Editar produto',
              pageRoute: null,
              isProfile: false,
            ),
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
            Container(
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
                  'Alterar imagem',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: img != null
                  ? Image.memory(photo!)
                  : const DefaulImageContainer(),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: greenNeon,
              ),
              margin: const EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.symmetric(
                vertical: 3,
              ),
              child: TextButton(
                onPressed: () async {
                  updateProduct();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductPage(
                        categoryTitle: widget.categoryTitle,
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Editar',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
