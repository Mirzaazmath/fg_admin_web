import 'package:flutter/material.dart';
import '../../../presentation/dashboard_page.dart';

class SettingBtn extends StatelessWidget {
  final  VoidCallback onTap;
  const SettingBtn({super.key, required this.onTap,});
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: appColors.whiteColor,
          side: const BorderSide(color: Colors.grey),
          shape:const  CircleBorder(),),
        onPressed: onTap,
        child: const  Icon(Icons.settings_outlined,color: Colors.black,),),
    );
  }
}