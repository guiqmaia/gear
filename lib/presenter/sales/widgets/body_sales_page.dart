import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../infra/models/sale_model.dart';
import '../../../infra/providers/login_providers.dart';
import '../../../infra/providers/sale_providers.dart';
import '../../../shared/widgets/top_bar_app.dart';
import 'recent_sales_container.dart';
import 'sale_register_container.dart';

final saleNotifier = StateNotifierProvider<SaleNotifier, List<SaleModel>>(
  (ref) => SaleNotifier(ref.watch(userModelProvider.state).state),
);

class BodySalesPage extends HookConsumerWidget {
  const BodySalesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sales = ref.watch(saleNotifier);
    List<SaleModel> salesReversed = sales.reversed.toList();
    DateFormat dividerDateFormat = DateFormat('dd/MM/yyyy');
    DateTime dateTime = DateTime.now();
    bool first = true;

    bool verifyDate(SaleModel model) {
      if (first) {
        dateTime = DateTime.parse(model.date);
        first = !first;
        return true;
      }
      if (DateUtils.dateOnly(DateTime.parse(model.date)) != DateUtils.dateOnly(dateTime)) {
        dateTime = DateTime.parse(model.date);
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
          itemCount: salesReversed.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Visibility(
                  visible: verifyDate(salesReversed[index]),
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
                        dividerDateFormat.format(DateTime.parse(salesReversed[index].date)),
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
                  saleModel: salesReversed[index],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
