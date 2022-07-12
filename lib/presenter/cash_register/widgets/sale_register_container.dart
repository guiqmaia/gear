import 'package:flutter/material.dart';

class SaleRegisterContainer extends StatelessWidget {
  final String price;
  final dynamic quantity;
  final String product;

  const SaleRegisterContainer({
    Key? key,
    required this.price,
    required this.quantity,
    required this.product,
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
            children: [
              Text(
                price,
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 17,
                ),
              ),
              const Icon(
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
            children: [
              Text(
                '$quantity x $product',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
              const Icon(
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
