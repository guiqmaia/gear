import 'package:flutter/material.dart';

import 'value_day.dart';

class ContainerDailySales extends StatelessWidget {
  const ContainerDailySales({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(22),
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 10,
            offset: const Offset(12, 12),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Faturamento Diário',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              const ValueDay(value: "R\$ 3738,59", day: "Segunda"),
              Divider(
                height: 20,
                color: Colors.grey.shade300,
                thickness: 1,
                indent: 35,
                endIndent: 35,
              ),
              const ValueDay(value: "R\$ 2884,32", day: "Terça"),
              Divider(
                height: 20,
                color: Colors.grey.shade300,
                thickness: 1,
                indent: 35,
                endIndent: 35,
              ),
              const ValueDay(value: "R\$ 4247,21", day: "Quarta"),
              Divider(
                height: 20,
                color: Colors.grey.shade300,
                thickness: 1,
                indent: 35,
                endIndent: 35,
              ),
              const ValueDay(value: "R\$ 1987,56", day: "Quinta"),
              Divider(
                height: 20,
                color: Colors.grey.shade300,
                thickness: 1,
                indent: 35,
                endIndent: 35,
              ),
              const ValueDay(value: "R\$ 6875,04", day: "Sexta"),
              Divider(
                height: 20,
                color: Colors.grey.shade300,
                thickness: 1,
                indent: 35,
                endIndent: 35,
              ),
              const ValueDay(value: "R\$ 1745,51", day: "Sábado"),
              Divider(
                height: 20,
                color: Colors.grey.shade300,
                thickness: 1,
                indent: 35,
                endIndent: 35,
              ),
              const ValueDay(value: "R\$ 2154,52", day: "Domingo"),
            ],
          ),
        ],
      ),
    );
  }
}
