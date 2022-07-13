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
        vertical: MediaQuery.of(context).size.height * 0.01,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.06,
        vertical: MediaQuery.of(context).size.height * 0.02,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  price,
                  style: TextStyle(
                    color: Colors.green.shade600,
                    fontSize: 17,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '$quantity',
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Text(
                    quantity > 1 ? 'unidades' : 'unidade',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              product,
              style: TextStyle(
                color: Colors.blue.shade600,
                fontSize: 25,
              ),
            ),
          ),
          Column(
            children: const [
              Icon(
                Icons.credit_card,
                color: Colors.black,
              ),
              SizedBox(height: 15),
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
