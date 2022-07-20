import 'package:flutter/material.dart';
import 'package:gear/core/app_assets.dart';

import '../../profile/profile_page.dart';

class TopBarApp extends StatelessWidget {
  final String title;
  final dynamic pageRoute;
  final bool isProfile;

  const TopBarApp({
    Key? key,
    required this.title,
    required this.pageRoute,
    required this.isProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.only(bottom: 10, top: 28, right: 40, left: 20),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          Visibility(
            visible: isProfile ? true : false,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ),
                );
              },
              child: CircleAvatar(
                radius: 26,
                backgroundColor: Colors.white,
                backgroundImage: Image.asset(imgStore).image,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
