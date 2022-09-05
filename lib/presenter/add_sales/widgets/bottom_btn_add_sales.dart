import 'package:flutter/material.dart';
import 'package:gear/infra/providers/login_providers.dart';
import 'package:gear/presenter/sales/widgets/body_sales_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/app_assets.dart';
import '../../../infra/models/sale_model.dart';
import '../../../infra/providers/sale_providers.dart';

class BottomBtnSales extends StatefulHookConsumerWidget {
  const BottomBtnSales({Key? key}) : super(key: key);

  @override
  ConsumerState<BottomBtnSales> createState() => _BottomBtnSalesState();
}

class _BottomBtnSalesState extends ConsumerState<BottomBtnSales> {
  @override
  Widget build(BuildContext context) {
    final codeController = ref.watch(productCodeControllerProvider.state);
    final quantityController = ref.watch(quantityControllerProvider.state);
    final paymentController = ref.watch(paymentControllerProvider.state);
    final priceController = ref.watch(priceControllerProvider.state);
    final discountController = ref.watch(discountControllerProvider.state);
    final totalController = ref.watch(totalControllerProvider.state);

    void cleanController() {
      codeController.state.clear();
      priceController.state.clear();
      discountController.state.clear();
      quantityController.state.clear();
      paymentController.state.clear();
      totalController.state.clear();
      setState(() {});
    }

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
              if (codeController.state.text.isNotEmpty) {
                SaleModel saleModel = SaleModel(
                  userId: logedUser.id!,
                  productId: int.parse(codeController.state.text),
                  price: double.parse(totalController.state.text),
                  quantity: int.parse(quantityController.state.text),
                  pay: paymentController.state.text,
                  date: DateTime.now().toString(),
                );

                ref.watch(saleNotifier.notifier).addSalesContainer(saleModel);

                if (!mounted) return;

                Navigator.of(context).pop();
              } else {
                Navigator.of(context).pop();
              }
              cleanController();
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
                      userId: logedUser.id!,
                      productId: int.parse(codeController.state.text),
                      price: double.parse(totalController.state.text),
                      quantity: int.parse(quantityController.state.text),
                      pay: paymentController.state.text,
                      date: DateTime.now().toString(),
                    );

                    ref.watch(saleNotifier.notifier).addSalesContainer(saleModel);

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
