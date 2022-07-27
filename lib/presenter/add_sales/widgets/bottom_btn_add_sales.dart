import 'package:flutter/material.dart';

import '../../../core/app_assets.dart';
import '../../../infra/database/gear_database.dart';
import '../../../infra/models/sale_model.dart';
import '../../../shared/widgets/btn_standard_app.dart';
import '../../sales/sales_page.dart';

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
  void cleanController() {
    widget.categoryController.clear();
    widget.codeController.clear();
    widget.productController.clear();
    widget.priceController.clear();
    widget.descountController.clear();
    widget.quantityController.clear();
    widget.totalController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: greenNeon,
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          width: MediaQuery.of(context).size.width * 0.45,
          padding: const EdgeInsets.symmetric(
            vertical: 3,
          ),
          child: TextButton(
            onPressed: () async {
              if (widget.codeController.text.isNotEmpty) {
                SaleModel saleModel = SaleModel(
                  productId: int.parse(widget.codeController.text),
                  price: double.parse(widget.totalController.text),
                  quantity: int.parse(widget.quantityController.text),
                  pay: widget.payController.text,
                );
                await GearDatabase.instance.insert('sale', saleModel);

                if (!mounted) return;
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SalesPage(),
                  ),
                );
              } else {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SalesPage(),
                  ),
                );
              }
            },
            child: const Text(
              'Finalizar venda',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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
                  onPressed: () async {
                    SaleModel saleModel = SaleModel(
                      productId: int.parse(widget.codeController.text),
                      price: double.parse(widget.totalController.text),
                      quantity: int.parse(widget.quantityController.text),
                      pay: widget.payController.text,
                    );
                    await GearDatabase.instance.insert('sale', saleModel);
                    if (!mounted) return;
                    cleanController();
                  },
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
                    cleanController();
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
