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
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.symmetric(
        horizontal: 35,
        vertical: 12,
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: blue,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 10,
            blurRadius: 10,
            offset: const Offset(5, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            titleInfo,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Row(
            children: [
              Icon(
                iconInfo,
                color: greenNeon,
                size: 15,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.025),
              Expanded(
                child: Text(
                  info,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.4,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
