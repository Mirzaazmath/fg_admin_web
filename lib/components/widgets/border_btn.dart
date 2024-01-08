import 'package:flutter/material.dart';

import '../../pages/dashboard_page.dart';
import '../../utils/text_utils.dart';
class BorderBtn extends StatelessWidget {
  final String title;
  final  VoidCallback onTap;
  const BorderBtn({super.key,required this.title, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap:onTap,
      child: Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(30), color: appColors.whiteColor
          ),
          alignment: Alignment.center,
          child: TextUtil(text:title,color:appColors.darkBlue ,size: 14,)

      ),
    );
  }
}
