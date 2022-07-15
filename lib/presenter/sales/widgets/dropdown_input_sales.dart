import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DropDownInputSale extends StatefulWidget {
  final List<DropdownMenuItem<String>> dropdownList;
  final String labelDropdown;
  final IconData iconDropdown;

  const DropDownInputSale({
    Key? key,
    required this.dropdownList,
    required this.labelDropdown,
    required this.iconDropdown,
  }) : super(key: key);

  @override
  State<DropDownInputSale> createState() => _DropDownInputSaleState();
}

class _DropDownInputSaleState extends State<DropDownInputSale> {
  String selectedValue = 'Modo de pagamento';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          labelText: widget.labelDropdown,
          prefixIcon: Icon(
            widget.iconDropdown,
            color: Colors.black,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        //value: selectedValue,
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue!;
          });
        },
        items: widget.dropdownList,
      ),
    );
  }
}
