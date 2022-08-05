// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:gear/infra/models/sale_model.dart';
import 'package:gear/presenter/sales/widgets/body_sales_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/app_assets.dart';
import '../../../infra/models/product_model.dart';

class SaleRegisterContainer extends HookConsumerWidget {
  final SaleModel saleModel;

  const SaleRegisterContainer({
    Key? key,
    required this.saleModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String price = saleModel.price.toStringAsFixed(2).replaceAll('.', ',');
    final productModel =
        ref.watch(saleNotifier.notifier).getProductById(saleModel);

    return FutureBuilder(
      future: productModel,
      builder: (context, AsyncSnapshot<ProductModel> snapshot) {
        if (snapshot.hasData) {
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
                          snapshot.data!.image,
                          height: MediaQuery.of(context).size.height * 0.09,
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data!.name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.035),
                            Text(
                              saleModel.pay,
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
                          saleModel.quantity > 1 ? 'unidades: ' : 'unidade: ',
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
                            saleModel.quantity.toString(),
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
        return const CircularProgressIndicator();
      },
    );
  }
}
