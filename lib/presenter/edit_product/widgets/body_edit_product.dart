import 'package:flutter/material.dart';

import '../../../shared/widgets/top_bar_app.dart';
import 'btn_edit_product.dart';
import 'wrap_text_field_edit_product.dart';

class BodyEditProduct extends StatefulWidget {
  const BodyEditProduct({
    Key? key,
    required this.productCode,
    required this.categoryTitle,
  }) : super(key: key);

  final int productCode;
  final String categoryTitle;

  @override
  State<BodyEditProduct> createState() => _BodyEditProductState();
}

class _BodyEditProductState extends State<BodyEditProduct> {
  TextEditingController newNameController = TextEditingController();
  TextEditingController newPriceController = TextEditingController();
  TextEditingController newQuantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopBarApp(
          title: 'Editar produto',
          isProfile: false,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        WrapTextFieldEditProduct(
          newNameController: newNameController,
          newPriceController: newPriceController,
          newQuantityController: newQuantityController,
        ),
        BtnEditProduct(
          productCode: widget.productCode,
          newNameController: newNameController,
          newPriceController: newPriceController,
          newQuantityController: newQuantityController,
          //photo: widget.photo,
        ),
      ],
    );
  }
}
