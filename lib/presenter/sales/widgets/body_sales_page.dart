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

    bool verifyDate(SaleModel saleModel) {
      DateTime dateTime = DateTime.now();
      bool first = true;

      if (first == true) {
        first = !first;
        return true;
      }
      if (DateFormat.yMd().format(saleModel.date) !=
          DateFormat.yMd().format(dateTime)) {
        dateTime = saleModel.date;
        return true;
      }
      return false;
    }

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
                  visible: verifyDate(sales[index]),
                  child: Row(
                    children: <Widget>[
                      const Expanded(
                        child: Divider(
                          indent: 10,
                          endIndent: 20,
                          color: Colors.black,
                          height: 36,
                          thickness: 0.7,
                        ),
                      ),
                      Text(
                        dividerDateFormat.format(sales[index].date),
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          indent: 20,
                          endIndent: 10,
                          color: Colors.black,
                          height: 36,
                          thickness: 0.7,
                        ),
                      ),
                    ],
                  ),
                ),
                SaleRegisterContainer(
                  saleModel: sales[index],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
