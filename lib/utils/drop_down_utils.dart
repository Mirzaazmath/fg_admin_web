import 'package:flutter/material.dart';
class DropField extends StatelessWidget {
 final  String selectValue;
 final List<String>valueList;
 final Function(String value)onChange;
  const DropField({super.key,required this.selectValue,required this.valueList,required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade600)
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectValue,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.cyan,
          ),
          elevation: 16,
          onChanged:
              (String? value) {
                onChange(value!);
                },
          items: valueList
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
