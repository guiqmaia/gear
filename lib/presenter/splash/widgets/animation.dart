import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../../core/app_assets.dart';

class AnimationSplash extends StatelessWidget {
  const AnimationSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextLiquidFill(
        text: 'Gear',
        waveColor: greenNeon,
        boxBackgroundColor: Colors.black,
        textStyle: const TextStyle(
          fontSize: 80.0,
          fontWeight: FontWeight.bold,
        ),
        loadDuration: const Duration(seconds: 2),
        boxHeight: MediaQuery.of(context).size.height,
      ),
    );
  }
}
