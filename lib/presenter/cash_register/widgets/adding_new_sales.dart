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
      height: MediaQuery.of(context).size.height * 0.09,
      width: MediaQuery.of(context).size.width * 0.85,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SalesPage(),
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
