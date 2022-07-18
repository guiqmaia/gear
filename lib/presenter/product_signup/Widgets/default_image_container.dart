import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class DefaulImageContainer extends StatelessWidget {
  const DefaulImageContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Colors.grey,
      strokeWidth: 3,
      dashPattern: const [15, 8],
      padding: const EdgeInsets.all(0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 80,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: Icon(
            Icons.camera_alt_rounded,
            color: Colors.grey,
            size: 60,
          ),
        ),
      ),
    );
  }
}
