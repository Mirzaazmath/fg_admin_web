import 'package:flutter/material.dart';
import '../../../presentation/dashboard_page.dart';
import '../../../utils/text_utils.dart';
class TextBtn extends StatelessWidget {
  final String title;
  final double? width;
  final  VoidCallback onTap;
  final Color? color;
  const TextBtn({super.key,required this.title, required this.onTap,this.width,this.color});
  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: 40,
      width:width?? double.infinity,
      child: TextButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:color?? appColors.whiteColor,
           // side: const BorderSide(color: Colors.grey),
          ),
          onPressed: onTap,
          child: TextUtil(text: title,color: appColors.blueColor,size: 14,)),
    );

  }
}
