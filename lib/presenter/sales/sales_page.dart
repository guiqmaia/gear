import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gear/presenter/cash_register/cash_register_page.dart';
import 'package:gear/presenter/cash_register/widgets/body_cash_register.dart';
import 'package:gear/presenter/cash_register/widgets/sale_register_container.dart';

import 'widgets/input_sale_items.dart';

class SalesPage extends StatelessWidget {
  final codeController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final descountController = TextEditingController();
  final quantityController = TextEditingController();
  final totalController = TextEditingController();

  SalesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.only(
                  bottom: 10, top: 20, right: 30, left: 10),
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CashRegisterPage(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const Text(
                    'Adicionar venda',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Wrap(
              children: [
                InputSaleItems(
                  labelItem: 'Código do produto',
                  iconInput: Icons.code_rounded,
                  typeController: codeController,
                ),
                InputSaleItems(
                  labelItem: 'Descrição do produto',
                  iconInput: Icons.description_rounded,
                  typeController: descountController,
                ),
                InputSaleItems(
                  labelItem: 'Preço do produto',
                  iconInput: Icons.price_check_rounded,
                  typeController: priceController,
                ),
                InputSaleItems(
                  labelItem: 'Desconto',
                  iconInput: Icons.price_change_rounded,
                  typeController: descountController,
                ),
                InputSaleItems(
                  labelItem: 'Quantidade',
                  iconInput: Icons.production_quantity_limits_rounded,
                  typeController: quantityController,
                ),
              ],
            ),
            const Divider(
              indent: 15,
              endIndent: 15,
              color: Colors.grey,
            ),
            InputSaleItems(
              labelItem: 'Total',
              iconInput: Icons.attach_money_rounded,
              typeController: totalController,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 20,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: () {
                createSale();
              },
              child: const Text(
                'Finalizar venda',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
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
                  backgroundColor: Colors.blue,
                  child: IconButton(
                    tooltip: 'Adicione',
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: Colors.white.withOpacity(0.8),
                      size: 30,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.blue,
                  child: IconButton(
                    tooltip: 'Limpar',
                    onPressed: () {
                      codeController.clear();
                      descriptionController.clear();
                      priceController.clear();
                      descountController.clear();
                      quantityController.clear();
                      totalController.clear();
                    },
                    icon: Icon(
                      Icons.clear_all_rounded,
                      color: Colors.white.withOpacity(0.8),
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void createSale(){
    SaleRegisterContainer(
      price: totalController.text,
      quantity: quantityController.value,
      product: descriptionController.text,      
    );
  }
}



// código produto, descrição, preço, quantidade, desconto, 
// botao +, fechar venda, total venda