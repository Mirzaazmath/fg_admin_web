import 'package:flutter/material.dart';
import '../../presentation/dashboard_page.dart';
import '../../utils/text_utils.dart';
class BorderBtn extends StatelessWidget {
  final String title;
  final  VoidCallback onTap;
  final double? width;
  final Color? color;
  const BorderBtn({super.key,required this.title, required this.onTap,this.width,this.color});
  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap:onTap,
      child: Container(
          height: 40,
          width:width?? double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(30), color:color?? appColors.whiteColor
          ),
          alignment: Alignment.center,
          child: TextUtil(text:title,color:appColors.blueColor ,size: 14,)

      ),
    );
  }
}
