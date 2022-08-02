import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../infra/database/gear_database.dart';
import '../../../infra/models/product_model.dart';
import '../../../infra/models/sale_model.dart';
import '../../../shared/widgets/top_bar_app.dart';
import 'recent_sales_container.dart';
import 'sale_register_container.dart';

class BodyCashRegister extends StatefulWidget {
  const BodyCashRegister({Key? key}) : super(key: key);

  @override
  State<BodyCashRegister> createState() => _BodyCashRegisterState();
}

class _BodyCashRegisterState extends State<BodyCashRegister> {
  List<SaleModel> salesList = [];
  List<ProductModel> products = [];
  DateFormat dividerDateFormat = DateFormat('dd/MM/yyyy');
  DateTime dateTime = DateTime.now();
  bool first = true;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    products.clear();
    refreshSales();
  }

  Future refreshSales() async {
    setState(() => isLoading = true);
    salesList = await GearDatabase.instance.selectSale();
    for (SaleModel sale in salesList) {
      findProduct(sale.productId);
    }
    setState(() => isLoading = false);
  }

  void findProduct(int id) async {
    products.add(await GearDatabase.instance.selectProductById(id));
    setState(() {});
  }

  bool verifyDate(SaleModel saleModel) {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopBarApp(
          title: 'Caixa',
          isProfile: false,
        ),
        const RecentSalesContainer(),
        isLoading
            ? const CircularProgressIndicator()
            : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: salesList.length,
                itemBuilder: (context, index) {
                  SaleModel sale = salesList[index];
                  return Column(
                    children: [
                      Visibility(
                        visible: verifyDate(sale),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(
                                    left: 10.0, right: 20.0),
                                child: const Divider(
                                  color: Colors.black,
                                  height: 36,
                                ),
                              ),
                            ),
                            Text(dividerDateFormat.format(sale.date)),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(
                                    left: 20.0, right: 10.0),
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
                        saleModel: sale,
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
