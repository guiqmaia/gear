import 'package:flutter/material.dart';

import 'liders_product.dart';

class ContainerRankingSales extends StatelessWidget {
  const ContainerRankingSales({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(22),
      padding: const EdgeInsets.symmetric(vertical: 15),
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
            'Mais Vendidos',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          Column(
            children: [
              const ProductLeader(
                product: "1. Mary Wells",
                value: "R\$ 4198,41",
              ),
              Divider(
                height: 20,
                color: Colors.grey.shade300,
                thickness: 1,
                indent: 35,
                endIndent: 35,
              ),
              const ProductLeader(
                product: "2. Coca-Cola",
                value: "R\$ 5704,55",
              ),
              Divider(
                height: 20,
                color: Colors.grey.shade300,
                thickness: 1,
                indent: 35,
                endIndent: 35,
              ),
              const ProductLeader(
                product: "3. Perini-Malbec",
                value: "R\$ 1567,00",
              ),
              Divider(
                height: 20,
                color: Colors.grey.shade300,
                thickness: 1,
                indent: 35,
                endIndent: 35,
              ),
              const ProductLeader(
                product: "4. White Horse",
                value: "R\$ 10015,31",
              ),
              Divider(
                height: 20,
                color: Colors.grey.shade300,
                thickness: 1,
                indent: 35,
                endIndent: 35,
              ),
              const ProductLeader(
                product: "5. RedBull",
                value: "R\$ 1651,45",
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
