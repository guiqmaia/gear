import 'package:flutter/material.dart';

import '../../../core/app_assets.dart';

class SaleRegisterContainer extends StatelessWidget {
  final String price;
  final dynamic quantity;
  final String product;
  final dynamic productImg;
  final String payment;

  const SaleRegisterContainer({
    Key? key,
    required this.price,
    required this.quantity,
    required this.product,
    required this.productImg,
    required this.payment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
        vertical: MediaQuery.of(context).size.height * 0.01,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.04,
        vertical: MediaQuery.of(context).size.height * 0.02,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(8, 8),
            blurRadius: 10,
            spreadRadius: 0,
            color: Colors.grey.withOpacity(0.3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.memory(
                    productImg,
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.035),
                      Text(
                        payment,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: backgroundGrey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'R\$ $price',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Row(
                children: [
                  Text(
                    quantity > 1 ? 'unidades: ' : 'unidade: ',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: backgroundGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '$quantity',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
