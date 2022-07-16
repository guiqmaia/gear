import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../home/home_page.dart';
import '../../shared/widgets/text_field_app.dart';
import '../../shared/widgets/top_bar_app.dart';
import 'default_image_container.dart';


class SignupPageBody extends StatefulWidget {
  const SignupPageBody({
    Key? key,
  }) : super(key: key);

  @override
  State<SignupPageBody> createState() => _SignupPageBodyState();
}

class _SignupPageBodyState extends State<SignupPageBody> {
  File? image;
  Uint8List? photo;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      // ignore: avoid_print
      print(imageTemp.readAsBytesSync());
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
    return Column(
      children: [
        const TopBarApp(
          title: 'Cadastrar Produto',
          pageRoute: HomePage(),
          isProfile: true,
        ),
        Expanded(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                TextFieldApp(
                  labelItem: 'Nome',
                  iconInput: Icons.format_color_text_sharp,
                  typeController: null,
                ),
                TextFieldApp(
                  labelItem: 'Preço',
                  iconInput: Icons.attach_money,
                  typeController: null,
                ),
                TextFieldApp(
                  labelItem: 'Categoria',
                  iconInput: Icons.tag,
                  typeController: null,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.purple.shade300,
                        Colors.blue.shade800,
                      ],
                    ),
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
                        color: Colors.white,
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
