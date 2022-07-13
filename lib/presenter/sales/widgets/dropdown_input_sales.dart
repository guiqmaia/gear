import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DropDownInputSale extends StatefulWidget {
  const DropDownInputSale({Key? key}) : super(key: key);

  @override
  State<DropDownInputSale> createState() => _DropDownInputSaleState();
}

class _DropDownInputSaleState extends State<DropDownInputSale> {
  
  List<DropdownMenuItem<String>> dropdownItems = const [
    DropdownMenuItem(value: 'Crédito', child: Text('Crédito')),
    DropdownMenuItem(value: 'Débito', child: Text('Débito')),
    DropdownMenuItem(value: 'Dinheiro', child: Text('Dinheiro')),
    DropdownMenuItem(value: 'PIX', child: Text('PIX')),
  ];

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
          labelText: 'Modo de pagamento',
          prefixIcon: const Icon(
            Icons.credit_score_rounded,
            color: Colors.black,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.blue.withOpacity(0.3),
        ),
        //value: selectedValue,
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue!;
          });
        },
        items: dropdownItems,
      ),
    );
  }
}
