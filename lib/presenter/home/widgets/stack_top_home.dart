import 'package:flutter/material.dart';

import '../../../core/app_assets.dart';
import '../../../core/app_getit.dart';

class StackTopHome extends StatelessWidget {
  const StackTopHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.06,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Olá,',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.black26,
                ),
              ),
              Text(
                logedUser.name,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
          CircleAvatar(
            radius: 34,
            backgroundColor: Colors.white,
            backgroundImage: Image.asset(
              iconUserAnon,
              fit: BoxFit.cover,
            ).image,
          ),
        ],
      ),
    );
    //
    // Stack(
    //   children: [
    //     Container(
    //       height: MediaQuery.of(context).size.height * 0.58,
    //       padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 35),
    //       width: MediaQuery.of(context).size.width,
    //       decoration: const BoxDecoration(
    //         color: Colors.black,
    //         borderRadius: BorderRadius.only(
    //           bottomLeft: Radius.circular(150),
    //           bottomRight: Radius.circular(150),
    //         ),
    //       ),
    //       child: Column(
    //         children: [
    //           Text(
    //             'GEAR',
    //             style: TextStyle(
    //               color: greenNeon,
    //               fontSize: 40,
    //               fontWeight: FontWeight.w500,
    //             ),
    //           ),
    //           SizedBox(height: MediaQuery.of(context).size.height * 0.06),
    //           CircleAvatar(
    //             radius: 70,
    //             backgroundImage: Image.asset(
    //               imgStore,
    //               fit: BoxFit.cover,
    //             ).image,
    //           ),
    //         ],
    //       ),
    //     ),
    //     Positioned(
    //       bottom: 0,
    //       left: MediaQuery.of(context).size.width * 0.15,
    //       child: Container(
    //         padding: const EdgeInsets.symmetric(vertical: 12),
    //         width: MediaQuery.of(context).size.width * 0.7,
    //         decoration: BoxDecoration(
    //           border: Border.all(
    //             color: Colors.black,
    //             width: 2.0,
    //           ),
    //           borderRadius: BorderRadius.circular(25),
    //           color: greenNeon,
    //         ),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Text(
    //               logedUser.company,
    //               style: const TextStyle(
    //                 color: Colors.black,
    //                 fontSize: 19,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //             const SizedBox(height: 5),
    //             Text(
    //               logedUser.cnpj,
    //               style: const TextStyle(
    //                   color: Colors.black,
    //                   fontSize: 14,
    //                   fontWeight: FontWeight.w500),
    //             ),
    //             const SizedBox(height: 10),
    //             Text(
    //               logedUser.name,
    //               style: const TextStyle(
    //                 color: Colors.black,
    //                 fontSize: 16,
    //                 fontWeight: FontWeight.w500,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
