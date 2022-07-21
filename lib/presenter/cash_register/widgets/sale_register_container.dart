import 'package:flutter/material.dart';

import '../../../core/app_assets.dart';

// ignore: must_be_immutable
class RecentSalesList extends StatefulWidget {
  List sales;

  RecentSalesList({
    Key? key,
    required this.sales,
  }) : super(key: key);

  @override
  State<RecentSalesList> createState() => _RecentSalesListState();
}

class _RecentSalesListState extends State<RecentSalesList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [],
    );
  }
}

List<SaleRegisterContainer> salesList = [
  SaleRegisterContainer(
      price: 'R\$ 25,00', quantity: 5, product: 'Soda', productImg: imgSodaAntarctica, payment: 'Débito',),
  SaleRegisterContainer(
      price: 'R\$ 50,00', quantity: 10, product: 'Coca-cola', productImg: imgCocaCola, payment: 'Crédito',),
  SaleRegisterContainer(
      price: 'R\$ 120,50', quantity: 1, product: 'White Horse', productImg: imgWhiteHorse, payment: 'PIX',),
];

List get getLista {
  return salesList;
}

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
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  productImg,
                  height: 60,
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    payment,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
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
                  price,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
              ),
              const SizedBox(height: 15),
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
