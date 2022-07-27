import 'package:flutter/material.dart';

import '../../../infra/database/gear_database.dart';
import '../../../infra/models/product_model.dart';
import '../../../infra/models/sale_model.dart';
import '../../../shared/widgets/top_bar_app.dart';
import '../../home/home_page.dart';
import 'recent_sales_container.dart';
import 'sale_register_container.dart';

class BodyCashRegister extends StatefulWidget {
  const BodyCashRegister({Key? key}) : super(key: key);

  @override
  State<BodyCashRegister> createState() => _BodyCashRegisterState();
}

class _BodyCashRegisterState extends State<BodyCashRegister> {
  List<SaleModel> salesList = [];
  List<ProductModel> productsList = [];

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshSales();
  }

  Future refreshSales() async {
    setState(() => isLoading = true);
    salesList = await GearDatabase.instance.selectSale();
    for (SaleModel sale in salesList) {
      productsList
          .add(await GearDatabase.instance.selectProductById(sale.productId));
    }
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopBarApp(
          title: 'Caixa',
          pageRoute: HomePage(),
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
                  ProductModel product = productsList[index];
                  return SaleRegisterContainer(
                    price: sale.price.toStringAsFixed(2),
                    quantity: sale.quantity,
                    product: product.name,
                    productImg: product.image,
                    payment: sale.pay,
                    dateTime: sale.date,
                  );
                },
              ),
      ],
    );
  }
}
