import 'package:flutter/material.dart';

import '../pages/dashboard_page.dart';
import '../utils/text_utils.dart';
class SideBarWidget extends StatefulWidget {
  const SideBarWidget({super.key});

  @override
  State<SideBarWidget> createState() => _SideBarWidgetState();
}

class _SideBarWidgetState extends State<SideBarWidget> {
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return  Container(
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
          ListTile(
            leading: Icon(Icons.home_outlined,color: appColors.blackColor,),
            title: DescriptionText(text: "DashBoard"),
          ),
          const  Divider(),
          Expanded(
            child: ListView(
              children: [
            
            
            const  SizedBox(height: 10,),
            DescriptionText(text: "Sales"),
            const  SizedBox(height: 18,),
            sideBarChip("Orders","12",true,0,Icons.shopping_cart_outlined),
            sideBarChip("Customers","30",false,1,Icons.group_outlined),
            sideBarChip("Business profiles","30",false,2,Icons.business_center_outlined),
            const  Divider(),
            const  SizedBox(height: 10,),
            DescriptionText(text: "Partner Network"),
            const  SizedBox(height: 18,),
            sideBarChip("Partners","22",false,3,Icons.handshake_outlined),
            sideBarChip("Bowsers","12",false,4,Icons.local_gas_station_outlined),
            sideBarChip("Drivers","12",false,5,Icons.person_2_outlined),
            const  Divider(),
            const  SizedBox(height: 10,),
            DescriptionText(text: "Accounting"),
            const  SizedBox(height: 18,),
            sideBarChip("Transactions","",false,6,Icons.article_outlined),
            const  Divider(),
            const  SizedBox(height: 10,),
            DescriptionText(text: "Admin controls"),
            const  SizedBox(height: 18,),
            sideBarChip("App settings","",false,7,Icons.phone_iphone_outlined),
            sideBarChip("Roles & Permissions","",false,8,Icons.settings_outlined),
            sideBarChip("Team Management ","",false,9,Icons.groups_outlined),
            sideBarChip("Payments methods","",false,10,Icons.credit_card_outlined),
              ],
            ),
          )



        ],
      ),
    );
  }
  Widget sideBarChip(String title,String count,bool isSelect,int index,IconData icon){
    return  InkWell(
      onTap: (){
        setState(() {
          currentIndex=index;
        });
      },
      child: Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color:currentIndex==index? appColors.secondaryColor:Colors.transparent,
              borderRadius: BorderRadius.circular(50)
          ),
          alignment: Alignment.center,
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(icon,color: appColors.blackColor,),
            title: TextUtil(text: title,color: appColors.blackColor,weight: currentIndex==index?true: null,size: 12,),
            trailing:  TextUtil(text: count,color: appColors.blackColor,weight:currentIndex==index?true: null,size: 12,),

          )
      ),
    );
  }
}
