import 'package:flutter/material.dart';

class DropDownInput extends StatefulWidget {
  final List<DropdownMenuItem<String>> dropdownList;
  final String labelDropdown;
  final IconData iconDropdown;
  final String? selectedValue;
  final TextEditingController selectedValueController;

  const DropDownInput({
    Key? key,
    required this.dropdownList,
    required this.labelDropdown,
    required this.iconDropdown,
    required this.selectedValueController,
    this.selectedValue,
  }) : super(key: key);

  @override
  State<DropDownInput> createState() => _DropDownInputState();
}

class _DropDownInputState extends State<DropDownInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16),
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
        onChanged: (String? selectedValue) {
          setState(() {
            widget.selectedValueController.text = selectedValue!;
          });
        },
        items: widget.dropdownList,
      ),
    );
  }
}
