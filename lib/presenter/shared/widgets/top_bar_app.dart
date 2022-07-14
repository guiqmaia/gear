import 'package:flutter/material.dart';

import '../../profile/profile.dart';

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
      padding: const EdgeInsets.only(bottom: 10, top: 20, right: 30, left: 10),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.7),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => pageRoute,
                ),
              );
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
                    builder: (context) => const Profile(),
                  ),
                );
              },
              child: const CircleAvatar(
                radius: 26,
                child: Icon(Icons.person),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
