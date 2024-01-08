import 'package:flutter/material.dart';

import '../../pages/dashboard_page.dart';
import '../../utils/text_utils.dart';
class TextBtn extends StatelessWidget {
  final String title;
  final double? width;
  final  VoidCallback onTap;
  const TextBtn({super.key,required this.title, required this.onTap,this.width});
  @override
  Widget build(BuildContext context) {
    return    GestureDetector(
      onTap:onTap,
      child: Container(
          height: 40,
          width:width?? double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: appColors.whiteColor
          ),
          alignment: Alignment.center,
          child: TextUtil(text:title,color:appColors.darkBlue ,size: 14,)

      ),
    );
  }
}
