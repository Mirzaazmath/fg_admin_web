import 'package:flutter/material.dart';
import '../../../presentation/dashboard_page.dart';
import '../../../utils/text_utils.dart';

class CreateBtn extends StatelessWidget {
  final  VoidCallback onTap;
  final String title;
  const CreateBtn({super.key, required this.onTap,required this.title});
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 40,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: appColors.secondaryColor,
          ),
          onPressed: onTap,
          child: TextUtil(text: title,color: appColors.brownColor,size: 14,)),
    );
  }
}