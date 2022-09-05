import 'dart:convert';

import 'package:flutter/material.dart';
import '../../../infra/repository/product_repository.dart';

import '../../../infra/models/category_model.dart';

import '../../../core/app_assets.dart';
import '../../../infra/models/product_model.dart';
import '../../edit_product/edit_product_page.dart';

class ContainerProductCategory extends StatefulWidget {
  final ProductModel productModel;
  final CategoryModel category;

  const ContainerProductCategory({
    Key? key,
    required this.productModel,
    required this.category,
  }) : super(key: key);

  @override
  State<ContainerProductCategory> createState() => _ContainerProductcategoriestate();
}

class _ContainerProductcategoriestate extends State<ContainerProductCategory> {
  bool isLoading = false;

  deleteProduct() async {
    ProductRepository repository = ProductRepository();
    await repository.delete('http://192.168.0.43:81/api/Product', widget.productModel.id!);
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
        padding: const EdgeInsets.only(
          left: 10,
          top: 11,
          bottom: 11,
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
                base64Decode(widget.productModel.image),
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
                          widget.productModel.name,
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
                          'R\$ ${widget.productModel.price.toStringAsFixed(2).replaceAll('.', ',')}',
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
                              color: pink.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              '${widget.productModel.id}',
                              style: TextStyle(
                                color: pink,
                                fontWeight: FontWeight.bold,
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
                              '${widget.productModel.quantity}',
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
              padding: const EdgeInsets.all(0),
              onSelected: (String selectedOption) {
                selectedOption == 'Deletar'
                    ? deleteProduct()
                    : Navigator.of(context).pushNamed(
                        EditProductPage.route,
                        arguments: {
                          'category': widget.category,
                          'product': widget.productModel,
                        },
                      );
              },
              position: PopupMenuPosition.under,
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Deletar',
                  child: Text('Deletar'),
                ),
                const PopupMenuItem<String>(
                  value: 'Editar',
                  child: Text('Editar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
