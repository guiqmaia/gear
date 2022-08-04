import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../infra/models/sale_model.dart';
import '../../../infra/providers/sale_providers.dart';
import '../../../shared/widgets/top_bar_app.dart';
import 'recent_sales_container.dart';
import 'sale_register_container.dart';

final saleNotifier = StateNotifierProvider<SaleNotifier, List<SaleModel>>(
  (ref) => SaleNotifier(),
);

class BodySalesPage extends HookConsumerWidget {
  BodySalesPage({Key? key}) : super(key: key);

  DateFormat dividerDateFormat = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sales = ref.watch(saleNotifier);
    final verifyDateSale = ref.watch(saleNotifier.notifier);
    final products = ref.watch(saleNotifier.notifier).products;

    return Column(
      children: [
        const TopBarApp(
          title: 'Caixa',
          isProfile: false,
        ),
        const RecentSalesContainer(),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: sales.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Visibility(
                  visible: verifyDateSale.verifyDate(sales[index]),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(
                            left: 10.0,
                            right: 20.0,
                          ),
                          child: const Divider(
                            color: Colors.black,
                            height: 36,
                          ),
                        ),
                      ),
                      Text(dividerDateFormat.format(sales[index].date)),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(
                            left: 20.0,
                            right: 10.0,
                          ),
                          child: const Divider(
                            color: Colors.black,
                            height: 36,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SaleRegisterContainer(
                  saleModel: sales[index],
                  productModel: products[index],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
