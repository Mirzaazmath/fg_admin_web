import 'package:flutter/material.dart';
import '../../../presentation/dashboard_page.dart';
import '../../../utils/text_utils.dart';
class BorderBtn extends StatelessWidget {
  final String title;
  final  VoidCallback onTap;
  final double? width;
  final Color? color;
  final Widget? child;
  const BorderBtn({super.key,required this.title, required this.onTap,this.width,this.color,this.child});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width:width?? double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:appColors.whiteColor,
            side:  BorderSide(color:color??  Colors.grey),
          ),
          onPressed: onTap,
          child:child?? TextUtil(text: title,color:color??  appColors.blueColor,size: 14,)),
    );

    //   InkWell(
    //   onTap:onTap,
    //   child: Container(
    //       height: 40,
    //       width:width?? double.infinity,
    //       decoration: BoxDecoration(
    //           border: Border.all(color: Colors.grey),
    //           borderRadius: BorderRadius.circular(30), color:color?? appColors.whiteColor
    //       ),
    //       alignment: Alignment.center,
    //       child: TextUtil(text:title,color:appColors.blueColor ,size: 14,)
    //
    //   ),
    // );
  }
}
