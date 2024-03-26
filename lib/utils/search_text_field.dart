import 'package:admin_panel/utils/text_utils.dart';
import 'package:flutter/material.dart';

import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../presentation/dashboard_page.dart';


class FieldWithSearch extends StatelessWidget {
  final  TextEditingController controller;
 final  List<String>list;
  final String hintText;
  final bool? isNumberType;
  final bool?  isEnable;
  final int? maxLine;
  final Function noDataFound;
  const FieldWithSearch({super.key,required this.controller,required this.hintText,this.isNumberType,this.isEnable,this.maxLine,required this.list,required this.noDataFound});

  @override
  Widget build(BuildContext context) {
    return  Container(

      margin:const  EdgeInsets.symmetric(vertical: 4),
      child: TypeAheadField(
        noItemsFoundBuilder: (context) {
          return InkWell(
            onTap: (){
              noDataFound();
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child:TextUtil(text: "Add Category",color: appColors.blueColor,size: 14,),
            ),
          );
        },
        textFieldConfiguration: TextFieldConfiguration(
          controller: controller,
          /* autofillHints: ["AutoFillHints 1", "AutoFillHints 2"],*/
          autofocus: false,
          style: TextStyle(color: appColors.blackColor),
          decoration: InputDecoration(
            border: InputBorder.none,
            //suffixIcon: Icon(Icons.search),
            hintText: hintText,
            labelStyle:
            TextStyle(decoration: TextDecoration.none, fontSize: 10),
            counterText: "",
            hintStyle: TextStyle(color: appColors.greyColor),
            filled: true,
            contentPadding: EdgeInsets.only(bottom: 0.0, left: 8.0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              borderSide: BorderSide(color: appColors.greyColor, width: 1),
            ),
            fillColor: Colors.white70,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide(color: appColors.greyColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              borderSide: BorderSide(color: appColors.greyColor),
            ),
          ),
        ),
        suggestionsCallback: (pattern) async {

          List<String>newList=list.where((element) => element.contains(pattern)).toList();
          return newList;
        },
        itemBuilder: (context,  suggestion) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Text(suggestion),
          );
        },
        itemSeparatorBuilder: (context, index) {
          return const Divider(thickness: 1);
        },
        onSuggestionSelected: (value) {
          controller.text=value;
        },
        suggestionsBoxDecoration: SuggestionsBoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          elevation: 8.0,
          color:appColors.whiteColor,
        ),
      ),
    );
  }
}