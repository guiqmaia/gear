import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/app_assets.dart';
import '../../infra/providers/login_providers.dart';
import '../../presenter/profile/profile_page.dart';

class TopBarApp extends HookConsumerWidget {
  final String title;
  final bool isProfile;
  final bool hasBack;

  const TopBarApp({
    Key? key,
    required this.title,
    required this.isProfile,
    this.hasBack = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userModel = ref.watch(userModelProvider.state).state;

    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.only(
        bottom: 10,
        top: 28,
        right: 40,
        left: 20,
      ),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(46, 67, 86, 1),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: !hasBack ? blue : Colors.white,
              size: 30,
            ),
            onPressed: hasBack
                ? () {
                    Navigator.of(context).pop(context);
                  }
                : () {},
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          isProfile
              ? CircleAvatar(
                  backgroundColor: blue,
                )
              : InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(ProfilePage.route);
                  },
                  child: CircleAvatar(
                    radius: 26,
                    backgroundColor: Colors.white,
                    backgroundImage: Image.memory(
                      base64Decode(userModel.image),
                    ).image,
                  ),
                ),
        ],
      ),
    );
  }
}
