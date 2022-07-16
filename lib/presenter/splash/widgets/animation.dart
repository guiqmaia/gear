import 'package:flutter/material.dart';

import '../../../core/app_assets.dart';

class AnimationSplash extends StatelessWidget {
  const AnimationSplash({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 300),
        style: TextStyle(
          fontSize: 60,
          color: greenNeon,
          fontWeight: FontWeight.bold,
        ),
        child: const Text("GEAR"),
      ),
    );
  }
}
