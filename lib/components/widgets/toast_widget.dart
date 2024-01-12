
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context,String msg) {
  final snackBar = SnackBar(
    width: 300,
    content: Text(msg),
    backgroundColor:const  Color(0xff303034),
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 1),
    //margin: EdgeInsets.all(50),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
