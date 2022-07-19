import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../../core/app_assets.dart';

class AnimationSplash extends StatelessWidget {
  const AnimationSplash({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      child: TextLiquidFill(
        text: 'Gear',
        waveColor: greenNeon,
        boxBackgroundColor: Colors.black,
        textStyle: const TextStyle(
          fontSize: 80.0,
          fontWeight: FontWeight.bold,          
        ),
        boxHeight: 300.0,
      ),
    );
  }
}
