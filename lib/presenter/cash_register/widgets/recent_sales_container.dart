import 'package:flutter/material.dart';

class RecentSalesContainer extends StatelessWidget {
  const RecentSalesContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.03,
      ),
      height: MediaQuery.of(context).size.height * 0.085,
      width: MediaQuery.of(context).size.width * 0.85,
      child: const Center(
        child: Text(
          'Vendas Recentes',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}