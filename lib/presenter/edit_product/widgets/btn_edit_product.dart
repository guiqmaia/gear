import 'package:flutter/material.dart';

import '../../../core/app_assets.dart';
import '../../../infra/database/gear_database.dart';
import '../../product/product_page.dart';

class BtnEditProduct extends StatefulWidget {
  const BtnEditProduct({
    Key? key,
    required this.newNameController,
    required this.newPriceController,
    required this.newQuantityController,
    required this.productCode,
    required this.categoryTitle,
  }) : super(key: key);

  final TextEditingController newNameController;
  final TextEditingController newPriceController;
  final TextEditingController newQuantityController;
  final int productCode;
  final String categoryTitle;

  @override
  State<BtnEditProduct> createState() => _BtnEditProductState();
}

class _BtnEditProductState extends State<BtnEditProduct> {
  Future updateNameProduct() async {
    if (widget.newNameController.text != '') {
      await GearDatabase.instance.updateProduct(
        widget.productCode,
        'name',
        '"${widget.newNameController.text}"',
      );
    }
  }

  Future updatePriceProduct() async {
    if (widget.newPriceController.text != '') {
      await GearDatabase.instance.updateProduct(
        widget.productCode,
        'price',
        double.parse(widget.newPriceController.text),
      );
    }
  }

  Future updateQuantityProduct() async {
    if (widget.newQuantityController.text != '') {
      await GearDatabase.instance.updateProduct(
        widget.productCode,
        'quantity',
        int.parse(widget.newQuantityController.text),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
        onPressed: () {
          updateNameProduct();
          updatePriceProduct();
          updateQuantityProduct();

          Navigator.of(context).pop();
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
    );
  }
}
