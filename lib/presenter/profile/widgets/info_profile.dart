import 'package:flutter/material.dart';

import '../../../core/app_assets.dart';

class InfoContainerProfile extends StatelessWidget {
  final String titleInfo;
  final String info;
  final IconData iconInfo;
  const InfoContainerProfile({
    Key? key,
    required this.titleInfo,
    required this.info,
    required this.iconInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        height: 100,
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black,
          boxShadow: const [
            BoxShadow(
                color: Colors.black38,
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(5, 5)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              titleInfo,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  iconInfo,
                  color: greenNeon,
                  size: 35,
                ),
                const SizedBox(width: 10),
                Text(
                  info,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
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
