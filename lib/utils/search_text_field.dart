import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../presentation/dashboard_page.dart';


class FieldWithSearch extends StatelessWidget {
  final  TextEditingController controller;
  final String hintText;
  final bool? isNumberType;
  final bool?  isEnable;
  final int? maxLine;
  const FieldWithSearch({super.key,required this.controller,required this.hintText,this.isNumberType,this.isEnable,this.maxLine});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      readOnly:isEnable ??false,
      maxLines:maxLine??1,
      controller:controller ,
      keyboardType:isNumberType==true?TextInputType.number: TextInputType.name,
      inputFormatters:isNumberType==true? [FilteringTextInputFormatter.digitsOnly]:[],
      decoration: InputDecoration(
          hintText: hintText,
          labelText:hintText,
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1,color:isEnable==true?appColors.greyColor: appColors.blueColor),
          ),

          border: const OutlineInputBorder()
      ),
    );
  }
}