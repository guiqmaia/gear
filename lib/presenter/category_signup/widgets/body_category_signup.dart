import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gear/presenter/category_signup/widgets/focus_node_category_signup_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/app_assets.dart';
import '../../../infra/models/category_model.dart';
import '../../../shared/widgets/text_field_app.dart';
import '../../../shared/widgets/top_bar_app.dart';
import '../../category/widgets/wrap_container_category.dart';
import '../../product_signup/Widgets/default_image_container.dart';

class BodyCategorySignup extends StatefulHookConsumerWidget {
  const BodyCategorySignup({Key? key}) : super(key: key);

  @override
  ConsumerState<BodyCategorySignup> createState() => _BodyCategoriySignupState();
}

class _BodyCategoriySignupState extends ConsumerState<BodyCategorySignup> {
  TextEditingController nameController = TextEditingController();
  File? fileImg;
  Uint8List? imgCategory;

  Future pickImage() async {
    try {
      final fileImg = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (fileImg == null) return;
      final imageTemp = File(fileImg.path);
      setState(
        () {
          this.fileImg = imageTemp;
          imgCategory = imageTemp.readAsBytesSync();
        },
      );
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
            isProfile: false,
          ),
          const SizedBox(height: 20),
          TextFieldApp(
            labelItem: 'Nome',
            typeController: nameController,
            isObscured: false,
            focus: focusNameCategorySignUpPage,
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
              onPressed: () => pickImage(),
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
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            child: fileImg != null ? Image.memory(imgCategory!) : const DefaulImageContainer(),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: greenNeon,
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            padding: const EdgeInsets.symmetric(
              vertical: 3,
            ),
            child: TextButton(
              onPressed: () async {
                CategoryModel categoryModel = CategoryModel(
                  name: nameController.text,
                  image: base64Encode(imgCategory!),
                );

                ref.watch(categoryNotifier.notifier).addCategory(categoryModel);

                if (!mounted) return;
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
      ),
    );
  }
}
