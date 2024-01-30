import 'package:flutter/material.dart';

import '../presentation/dashboard_page.dart';


class Field extends StatelessWidget {
  final  TextEditingController controller;
  final String hintText;
  final bool? isNumberType;
  final bool?  isEnable;


  const Field({super.key,required this.controller,required this.hintText,this.isNumberType,this.isEnable});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
     readOnly:isEnable ??false,
      controller:controller ,
      decoration: InputDecoration(
          hintText: hintText,
          labelText:hintText,
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1,color: appColors.blueColor),
          ),

          border: const OutlineInputBorder()
      ),
    );
  }
}