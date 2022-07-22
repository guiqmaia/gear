import 'package:flutter/material.dart';

import '../../../core/app_assets.dart';
import '../../../infra/database/gear_database.dart';
import '../../../infra/models/product_model.dart';
import '../../edit_product/edit_product_page.dart';

class ContainerProductCategory extends StatefulWidget {
  final String productName;
  final String productPrice;
  final int productQuantity;
  final int productCode;
  final dynamic productImg;
  List<ProductModel>? products;

  ContainerProductCategory({
    Key? key,
    required this.productName,
    required this.productPrice,
    required this.productQuantity,
    required this.productCode,
    required this.productImg,
    required this.products,
  }) : super(key: key);

  @override
  State<ContainerProductCategory> createState() =>
      _ContainerProductCategoryState();
}

class _ContainerProductCategoryState extends State<ContainerProductCategory> {
  bool isLoading = false;

  deleteProduct() async {
    widget.products =
        await GearDatabase.instance.delete("product", widget.productCode);
    setState(() => isLoading = true);
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoading ? false : true,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 9,
          vertical: 11,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.memory(
                widget.productImg,
                height: MediaQuery.of(context).size.height * 0.1,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.productName,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          'R\$ ${widget.productPrice}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Código: ',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.purple.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              '${widget.productCode}',
                              style: const TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            'Quantidade: ',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              '${widget.productQuantity}',
                              style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            PopupMenuButton(
              position: PopupMenuPosition.under,
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'Deletar',
                  child: InkWell(
                    onTap: () {
                      deleteProduct();
                      Navigator.pop(context, 'Deletar');
                    },
                    child: const Text('Deletar'),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'Editar',
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const EditProductPage(),
                        ),
                      );
                    },
                    child: const Text('Editar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
