import 'package:flutter/material.dart';

class SaleRegisterContainer extends StatelessWidget {
  const SaleRegisterContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
        vertical: MediaQuery.of(context).size.height * 0.015,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.07,
        vertical: MediaQuery.of(context).size.height * 0.02,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'R\$ 150,00',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 17,
                ),
              ),
              Icon(
                Icons.credit_card,
                color: Colors.black,
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '1x Tênis',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
              Icon(
                Icons.shopping_bag_outlined,
                color: Colors.black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}