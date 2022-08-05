import 'package:flutter/material.dart';

import '../../../core/app_assets.dart';
import '../../category/category_page.dart';
import '../../sales/sales_page.dart';

class WrapContainerHome extends StatefulWidget {
  const WrapContainerHome({Key? key}) : super(key: key);

  @override
  State<WrapContainerHome> createState() => _WrapContainerHomeState();
}

class _WrapContainerHomeState extends State<WrapContainerHome> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.grey.shade200,
              image: DecorationImage(
                image: Image.asset(imgGraphic).image,
                fit: BoxFit.none,
                alignment: Alignment.topRight,
                scale: 2.3,
                //opacity: 0.7,
              ),
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.3,
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Seu saldo'),
                SizedBox(height: MediaQuery.of(context).size.height * 0.010),
                Text(
                  isVisible ? 'R\$ 1500,00' : 'R\$ ••••••',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                InkWell(
                  onTap: () => setState(() => isVisible = !isVisible),
                  child: Icon(
                    isVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: blue,
                    size: 35,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              // color: const Color.fromRGBO(244, 144, 140, 1),
              color: blue,
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.16,
            padding: const EdgeInsets.symmetric(
              vertical: 3,
              horizontal: 10,
            ),
            child: TextButton(
              onPressed: () async {
                Navigator.of(context).pushNamed(SalesPage.route);
              },
              child: const Text(
                'CAIXA',
                style: TextStyle(
                  // color: Colors.black87,
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: const Color.fromRGBO(204, 225, 52, 1),
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.16,
            padding: const EdgeInsets.symmetric(
              vertical: 3,
              horizontal: 10,
            ),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CategoryPage.route);
              },
              child: const Text(
                'ESTOQUE',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
