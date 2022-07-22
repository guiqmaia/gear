import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'row_formatters_text_field.dart';

class TextFieldAppFormatted extends StatelessWidget {
  final String labelItem;
  final dynamic typeController;
  TextInputFormatter? formater;
  TextInputType textInputType;
  bool? isEnabled;

  TextFieldAppFormatted({
    Key? key,
    required this.labelItem,
    required this.typeController,
    required this.textInputType,
    this.isEnabled = true,
    this.formater,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: RowFormatters(
        label: labelItem,
        formatter: formater,
        controller: typeController,
        keyboardType: textInputType,
        isEnabled: isEnabled! ? true : false,
      ),
    );
  }
}


