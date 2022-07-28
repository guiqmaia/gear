import 'package:flutter/material.dart';

import '../../../core/app_assets.dart';
import '../../../infra/database/gear_database.dart';

class BtnEditProduct extends StatefulWidget {
  const BtnEditProduct({
    Key? key,
    required this.newNameController,
    required this.newPriceController,
    required this.newQuantityController,
    required this.productCode,
  }) : super(key: key);

  final TextEditingController newNameController;
  final TextEditingController newPriceController;
  final TextEditingController newQuantityController;
  final int productCode;

  @override
  State<BtnEditProduct> createState() => _BtnEditProductState();
}

class _BtnEditProductState extends State<BtnEditProduct> {
  Future updateProduct(
    table,
    column,
    change,
    id,
  ) async {
    if (change != '') {
      await GearDatabase.instance.update(
        table,
        id,
        column,
        change,
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
          updateProduct(
            'product',
            widget.productCode,
            'name',
            '"${widget.newNameController.text}"',
          );
          updateProduct(
            'product',
            widget.productCode,
            'price',
            double.parse(widget.newPriceController.text),
          );
          updateProduct(
            'product',
            widget.productCode,
            'quantity',
            int.parse(widget.newQuantityController.text),
          );

          Navigator.of(context).pop();
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => ProductPage(
          //       category: widget.categoryTitle,
          //     ),
          //   ),
          // );
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
