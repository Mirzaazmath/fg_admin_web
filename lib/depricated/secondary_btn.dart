import 'package:flutter/material.dart';
import '../presentation/dashboard_page.dart';
import '../utils/text_utils.dart';

class SecondaryBtn extends StatelessWidget {
  final  VoidCallback onTap;
  const SecondaryBtn({super.key, required this.onTap,});
  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: 40,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: appColors.whiteColor,
            side: const BorderSide(color: Colors.grey),),
          onPressed: onTap,
          child: TextUtil(text: "Secondary action",color: appColors.blueColor,size: 14,)),
    );
  }
}