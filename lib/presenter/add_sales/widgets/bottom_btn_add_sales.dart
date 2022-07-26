import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gear/presenter/statistics/widget/product_leaders.dart';

import '../../../core/app_assets.dart';
import '../../../infra/database/gear_database.dart';
import '../../../infra/models/sale_model.dart';
import '../../../shared/widgets/btn_standard_app.dart';
import '../../sales/sales_page.dart';
import '../../sales/widgets/sale_register_container.dart';

class BottomBtnSales extends StatefulWidget {
  const BottomBtnSales({
    Key? key,
    required this.categoryController,
    required this.codeController,
    required this.productController,
    required this.priceController,
    required this.descountController,
    required this.quantityController,
    required this.payController,
    required this.totalController,
  }) : super(key: key);

  final TextEditingController categoryController;
  final TextEditingController codeController;
  final TextEditingController productController;
  final TextEditingController priceController;
  final TextEditingController descountController;
  final TextEditingController quantityController;
  final TextEditingController payController;
  final TextEditingController totalController;

  @override
  State<BottomBtnSales> createState() => _BottomBtnSalesState();
}

class _BottomBtnSalesState extends State<BottomBtnSales> {
  salesAdd() {
    var newSale = SaleRegisterContainer(
      price: widget.priceController.toString(),
      quantity: widget.quantityController.toString(),
      product: widget.productController.toString(),
      productImg: imgSodas,
      payment: widget.payController.toString(),
    );
    setState(
      () {
        //salesList.add(newSale);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BtnStandardApp(
          title: 'Finalizar venda',
          pageRoute: const SalesPage(),
          widthBtn: MediaQuery.of(context).size.width * 0.45,
          onPressed: () async {
            SaleModel saleModel = SaleModel(
              productId: int.parse(widget.codeController.text),
              productPrice: double.parse(widget.priceController.text),
              productQuantity: int.parse(widget.categoryController.text),
              pay: widget.payController.text,
            );
            await GearDatabase.instance.insert('sale', saleModel);
            //if (!widget.mounted) return;
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.black,
                child: IconButton(
                  tooltip: 'Adicione',
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: greenNeon,
                    size: 30,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: greenNeon,
                child: IconButton(
                  tooltip: 'Limpar',
                  onPressed: () {
                    widget.categoryController.clear();
                    widget.codeController.clear();
                    widget.productController.clear();
                    widget.priceController.clear();
                    widget.descountController.clear();
                    widget.quantityController.clear();
                    widget.totalController.clear();
                  },
                  icon: const Icon(
                    Icons.clear_all_rounded,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
