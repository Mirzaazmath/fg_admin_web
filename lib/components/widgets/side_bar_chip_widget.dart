import 'package:admin_panel/provider/siderbar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../presentation/dashboard_page.dart';
import '../../utils/text_utils.dart';

class SideBarChipWidget extends StatelessWidget {
 final  String title;
 final  String? count;
 final  int index;
  final IconData icon;
  const SideBarChipWidget({super.key,required this.title,required this.icon,required this.index,this.count});

  @override
  Widget build(BuildContext context) {

    return Consumer<SideBarProvider>(
        builder: (BuildContext context, provider, Widget? child) {
      return GestureDetector(
        onTap: (){
          context.read<SideBarProvider>().updateMenu(index);
          },
        child: Container(
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color:provider.currentIndex==index? appColors.secondaryColor:Colors.transparent,
                borderRadius: BorderRadius.circular(50)
            ),
            alignment: Alignment.center,
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(icon,color: appColors.blackColor,),
              title: TextUtil(text: title,color: appColors.blackColor,weight: provider.currentIndex==index?true: null,size: 12,),
              trailing:  TextUtil(text: count??"",color: appColors.blackColor,weight:provider.currentIndex==index?true: null,size: 12,),

            )
        ),
      );
        }
    );
  }
}