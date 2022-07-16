import 'package:flutter/material.dart';

import '../../../core/app_assets.dart';

class AnimationSplash extends StatelessWidget {
  const AnimationSplash({
    Key? key,
    required bool myFirs,
    required double myFontSize,
    required Color myColor,
    required FontWeight myFontWeight,
  })  : _myFirs = myFirs,
        _myFontSize = myFontSize,
        _myColor = myColor,
        _myFontWeight = myFontWeight,
        super(key: key);

  final bool _myFirs;
  final double _myFontSize;
  final Color _myColor;
  final FontWeight _myFontWeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 300),
        style: _myFirs
            ? TextStyle(
                fontSize: _myFontSize,
                color: greenNeon,
                fontWeight: _myFontWeight,
              )
            : TextStyle(
                fontSize: 50,
                color: Colors.grey,
                fontWeight: _myFontWeight,
              ),
        child: const Text("GEAR"),
      ),
    );
  }
}
