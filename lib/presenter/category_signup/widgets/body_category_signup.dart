import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gear/presenter/shared/widgets/text_field_app.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/app_assets.dart';
import '../../category/category_page.dart';
import '../../product_signup/Widgets/default_image_container.dart';
import '../../shared/widgets/top_bar_app.dart';

class BodyCategorySignup extends StatefulWidget {
  const BodyCategorySignup({Key? key}) : super(key: key);

  @override
  State<BodyCategorySignup> createState() => _BodyCategorySignupState();
}

class _BodyCategorySignupState extends State<BodyCategorySignup> {
  File? fileImg;
  Uint8List? imgCategory;
  Future pickImage() async {
    try {
      final fileImg =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (fileImg == null) return;
      final imageTemp = File(fileImg.path);
      // ignore: avoid_print
      print(imageTemp.readAsBytesSync());
      setState(() {
        this.fileImg = imageTemp;
        imgCategory = imageTemp.readAsBytesSync();
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Falha em baixar imagem: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const TopBarApp(
            title: 'Cadastrar categoria',
            pageRoute: CategoryPage(),
            isProfile: false,
          ),
          const SizedBox(height: 20),
          TextFieldApp(
            labelItem: 'Nome',
            iconInput: Icons.tag_rounded,
            typeController: null,
            isObscured: false,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: greenNeon,
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 30,
            ),
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(
              vertical: 3,
            ),
            child: TextButton(
              onPressed: () {
                pickImage();
              },
              child: const Text(
                'Selecionar imagem',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width,
            child: fileImg != null
                ? Image.memory(imgCategory!)
                : const DefaulImageContainer(),
          ),
        ],
      ),
    );
  }
}
