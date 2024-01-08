import 'package:flutter/material.dart';
import '../../pages/dashboard_page.dart';
import '../../utils/text_utils.dart';
class ColorBtn extends StatelessWidget {
  final String title;
  final double? width;
  final Color? color;
 final  VoidCallback onTap;
 const ColorBtn({super.key,required this.title, required this.onTap,this.width,this.color});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 40,
          width:width?? double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color:color?? appColors.darkBlue
          ),
          alignment: Alignment.center,
          child: TextUtil(text:title,color: Colors.white,size: 14,)
      ),
    );
  }
}
