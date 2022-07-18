// import 'package:flutter/material.dart';

// import '../../core/app_assets.dart';
// import '../../infra/models/product_model.dart';
// import '../product_signup/product_signup_page.dart';
// import '../shared/widgets/btn_standard_app.dart';
// import 'widgets/body_product_page.dart';

// // ignore: must_be_immutable
// class ProductPage extends StatelessWidget {
//   final String categoryTitle;
//   final dynamic categoryImg;

//   ProductPage({
//     Key? key,
//     required this.categoryTitle,
//     required this.categoryImg,
//   }) : super(key: key);

//   Map<String, List<ProductModel>> productsList = {
//     'Refrigerante': [
//       ProductModel(
//         productTitle: 'Coca Cola',
//         productImg: imgCocaCola,
//         productCode: 1001,
//         productQuantity: 20,
//         productPrice: 4.50,
//       ),
//       ProductModel(
//         productTitle: 'Pepsi',
//         productImg: imgPepsi,
//         productCode: 1002,
//         productQuantity: 10,
//         productPrice: 3.50,
//       ),
//       ProductModel(
//         productTitle: 'Fanta Laranja',
//         productImg: imgFanta,
//         productCode: 1003,
//         productQuantity: 8,
//         productPrice: 4.70,
//       ),
//       ProductModel(
//         productTitle: 'Sprite',
//         productImg: imgSprite,
//         productCode: 1004,
//         productQuantity: 18,
//         productPrice: 4.00,
//       ),
//     ],
//     'Cerveja': [
//       ProductModel(
//         productTitle: 'Mary Wells - Warren',
//         productImg: imgMaryWellsBeer,
//         productCode: 2001,
//         productQuantity: 30,
//         productPrice: 10.5,
//       ),
//       ProductModel(
//         productTitle: 'Red Sonja',
//         productImg: imgRedSonjaBeer,
//         productCode: 2002,
//         productQuantity: 10,
//         productPrice: 9.30,
//       ),
//       ProductModel(
//         productTitle: 'Stannis Pilsner',
//         productImg: imgStannisPilsner,
//         productCode: 2003,
//         productQuantity: 25,
//         productPrice: 6.50,
//       ),
//       ProductModel(
//         productTitle: 'Dear Paula',
//         productImg: imgDearPaulaBeer,
//         productCode: 2004,
//         productQuantity: 18,
//         productPrice: 12.70,
//       ),
//     ],
//     'Vinho': [
//       ProductModel(
//         productTitle: 'Casa Perini - Malbec',
//         productImg: imgCasaPerini,
//         productCode: 3001,
//         productQuantity: 10,
//         productPrice: 55.4,
//       ),
//       ProductModel(
//         productTitle: 'Casa Valduga -  Cabernet Sauvignon',
//         productImg: imgCasaValduga,
//         productCode: 3002,
//         productQuantity: 8,
//         productPrice: 50.4,
//       ),
//       ProductModel(
//         productTitle: 'Cabriz - Rosé',
//         productImg: imgCabrizRose,
//         productCode: 3003,
//         productQuantity: 12,
//         productPrice: 46.2,
//       ),
//       ProductModel(
//         productTitle: 'Cabriz - Branco',
//         productImg: imgCabrizWhite,
//         productCode: 3004,
//         productQuantity: 13,
//         productPrice: 35.0,
//       ),
//     ],
//     'Destilado': [
//       ProductModel(
//         productTitle: 'Bacardi - Carta Oro',
//         productImg: imgBacardi,
//         productCode: 4001,
//         productQuantity: 15,
//         productPrice: 42.3,
//       ),
//       ProductModel(
//         productTitle: 'Beefeater - Gin',
//         productImg: imgBeefeater,
//         productCode: 4002,
//         productQuantity: 10,
//         productPrice: 66.5,
//       ),
//       ProductModel(
//         productTitle: 'Absolut - Vodka',
//         productImg: imgAbsolut,
//         productCode: 4003,
//         productQuantity: 30,
//         productPrice: 98.5,
//       ),
//       ProductModel(
//         productTitle: 'White Horse - Uísque',
//         productImg: imgWhiteHorse,
//         productCode: 4004,
//         productQuantity: 15,
//         productPrice: 120.0,
//       ),
//     ],
//     'Energético': [
//       ProductModel(
//         productTitle: 'Monster',
//         productImg: imgMonster,
//         productCode: 5001,
//         productQuantity: 20,
//         productPrice: 15.2,
//       ),
//       ProductModel(
//         productTitle: 'RedBull',
//         productImg: imgRedBull,
//         productCode: 5002,
//         productQuantity: 25,
//         productPrice: 18.7,
//       ),
//       ProductModel(
//         productTitle: 'Baly',
//         productImg: imgBaly,
//         productCode: 5003,
//         productQuantity: 17,
//         productPrice: 9.8,
//       ),
//     ],
//     'Água': [
//       ProductModel(
//         productTitle: 'Água - Sem gás',
//         productImg: imgWater,
//         productCode: 6001,
//         productQuantity: 50,
//         productPrice: 5.0,
//       ),
//       ProductModel(
//         productTitle: 'Água - Com gás',
//         productImg: imgSparklingWater,
//         productCode: 6002,
//         productQuantity: 25,
//         productPrice: 6.5,
//       ),
//     ],
//   };

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundGrey,
//       body: SingleChildScrollView(
//         child: BodyProductPage(
//           categoryTitle: categoryTitle,
//           productsList: productsList,
//         ),
//       ),
//       bottomNavigationBar: BtnStandardApp(
//         title: 'Novo produto',
//         pageRoute: const ProductSignupPage(),
//         widthBtn: MediaQuery.of(context).size.width * 0.8,
//       ),
//     );
//   }
// }
