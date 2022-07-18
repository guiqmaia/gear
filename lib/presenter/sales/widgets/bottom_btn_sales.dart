import 'package:flutter/material.dart';
import 'package:gear/core/app_assets.dart';
import 'package:gear/presenter/cash_register/widgets/sale_register_container.dart';
import '../../cash_register/cash_register_page.dart';
import '../../shared/widgets/btn_standard_app.dart';

class BottomBtnSales extends StatefulWidget {
  BottomBtnSales({
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
    );
    setState(() {
      salesList.add(newSale);
      print(salesList.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BtnStandardApp(
          title: 'Finalizar venda',
          pageRoute: const CashRegisterPage(),
          widthBtn: MediaQuery.of(context).size.width * 0.45,
          onPressed: salesAdd(),
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
                  onPressed: salesAdd(),
                  icon: const Icon(
                    Icons.add,
                    color: Color.fromRGBO(202, 254, 72, 1),
                    size: 30,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: const Color.fromRGBO(202, 254, 72, 1),
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
