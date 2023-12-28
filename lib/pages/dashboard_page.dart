import 'package:admin_panel/utils/color_utils.dart';
import 'package:admin_panel/utils/text_utils.dart';
import 'package:flutter/material.dart';
var appColors=AppColors();

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: false,
        leading:const  Icon(Icons.menu),
        title: TextUtil(text: "FuelGenie",size: 22,),
        actions: [
          const  Icon(Icons.notifications_outlined),
          const SizedBox(width: 10,),
          CircleAvatar(
            backgroundColor: appColors.secondaryColor,
            child: Image.asset("assets/images/profile.png"),
          ),
         const  SizedBox(width: 10,),
        ],
      ),
      body:  Padding(
        padding:const  EdgeInsets.all(14),
        child: Row(
          children: [
            Container(
              width: 270,
              height: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).primaryColor
          ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: appColors.greyColor)),),
                    child:ListTile(
                      leading: Icon(Icons.home_outlined,color: appColors.blackColor,),
                      title: DescriptionText(text: "DashBoard"),
                    ),),
                 const  SizedBox(height: 18,),
                  DescriptionText(text: "Sales"),
                  const  SizedBox(height: 18,),
                  sideBarChip("DashBoard","12",true),
                  sideBarChip("DashBoard","12",false),
                  sideBarChip("DashBoard","12",false),

                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
  Widget sideBarChip(String title,String count,bool isSelect){
    return  Container(
        height: 56,
        decoration: BoxDecoration(
            color:isSelect? appColors.secondaryColor:Colors.transparent,
            borderRadius: BorderRadius.circular(50)
        ),
        alignment: Alignment.center,
        child: ListTile(
          leading: Icon(Icons.shopping_cart_outlined,color: appColors.blackColor,),
          title: TextUtil(text: title,color: appColors.blackColor,weight: isSelect?true: null,size: 14,),
          trailing:  TextUtil(text: count,color: appColors.blackColor,weight:isSelect?true: null,size: 14,),

        )
    );
  }
}
