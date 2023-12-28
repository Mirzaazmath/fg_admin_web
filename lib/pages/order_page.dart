import 'package:flutter/material.dart';

import '../utils/text_utils.dart';
import 'dashboard_page.dart';
class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    padding:const  EdgeInsets.only(left: 24,right: 24,bottom: 24),
     child: Scaffold(
appBar: AppBar(
  surfaceTintColor: Colors.transparent,
  backgroundColor: appColors.whiteColor,
  centerTitle: false,

  title: TextUtil(text: "Order",size: 28,),
  actions: [
    Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: appColors.greyColor)
      ),
      child: const  Icon(Icons.settings_outlined),
    ),
    const SizedBox(width: 10,),
    Container(
      height: 40,
     padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: appColors.greyColor)
      ),
      alignment: Alignment.center,
      child: TextUtil(text: 'Secondary action',color: appColors.blueColor,size: 14,)
    ),
    const  SizedBox(width: 10,),
    Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: appColors.secondaryColor,
            borderRadius: BorderRadius.circular(20),

        ),
        alignment: Alignment.center,
        child: TextUtil(text: 'Secondary action',color: appColors.greyColor,size: 14,)
    ),
  ],
 ),
       body: Column(
         children: [
           Padding(
             padding:const  EdgeInsets.only(left: 20),
             child: Row(
               children: [
                 TextUtil(text: "Home",size: 16,color: appColors.greyColor,),
                const  SizedBox(width: 8,),
                const Icon(Icons.arrow_forward_ios_outlined,size: 15,),
                const  SizedBox(width: 8,),
                 TextUtil(text: "Orders",size: 16,color: appColors.blueColor,)
               ],
             ),
           ),
          const  SizedBox(height: 32,),
           Container(
             height: 48,
             decoration: BoxDecoration(
               color: Theme.of(context).primaryColor
             ),
           ),
           const  SizedBox(height: 32,),
          Expanded(
            child: Padding(
              padding:const  EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Container(
                    height: 58,
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: appColors.lightGreyColor))
                    ),
                    child: Row(
                      children: [
                        Expanded(child: TextUtil(text: "Order ID",weight: true,size: 16,)),
                        Expanded(child:  TextUtil(text: "Customer",weight: true,size: 16,),),
                        Expanded(child: TextUtil(text: "Status",weight: true,size: 16,)),
                        Expanded(child:  TextUtil(text: "Value",weight: true,size: 16,),),
                        Expanded(child: TextUtil(text: "Menu",weight: true,size: 16,)),
                        Expanded(child:  TextUtil(text: "Actions",weight: true,size: 16,))
            
                      ],
                    ),
                  ),
                  Expanded(child: ListView.builder(
                    shrinkWrap: true,
                      itemCount: 100,
                      itemBuilder: (context,index){
                    return  Container(
                      height: 58,
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: appColors.lightGreyColor))
                      ),
                      child: Row(
                        children: [
                          Expanded(child: DescriptionText(text: "1234567890",)),
                          Expanded(child:  DescriptionText(text: "Kiran Naik",),),
                          Expanded(child: DescriptionText(text: "Active",)),
                          Expanded(child:  DescriptionText(text: "\$10,000",),),
                          Expanded(child: DescriptionText(text: "Confirm Order",)),
                          Expanded(child:  DescriptionText(text: "Allocate bowser",))
            
                        ],
                      ),
                    );
                  }))
                ],
              ),
            ),
          )
         ],
       ),
       
     ),

    );
  }
}
