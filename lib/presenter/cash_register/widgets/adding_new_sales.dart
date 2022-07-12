import 'package:flutter/material.dart';
import 'package:gear/presenter/sales/sales_page.dart';

class AddingNewSales extends StatelessWidget {
  const AddingNewSales({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const SalesPage(),
            ),
          );
        },
        child: const Text(
          'Adicionar Venda',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
