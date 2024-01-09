import 'package:flutter/material.dart';
import '../components/widgets/global_custom_dailog.dart';
import '../utils/text_utils.dart';
import 'dashboard_page.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<String> actionList = <String>['Confirm order', 'Allocate bowser', 'Cancel order', 'Initiate refund'];
  List<String> filterList = <String>['All',"New", 'Confirmed', 'Truck allocated',"Out for delivery","Delivered","Cancelled"];
  String selectedAction = "Confirm order";
  String selectedFilter = "All";
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
        child: TextUtil(text: 'Create Order',color: appColors.greyColor,size: 14,)
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
             width: MediaQuery.of(context).size.width,
             padding:const  EdgeInsets.symmetric(horizontal: 52),
             decoration: BoxDecoration(
               color: Theme.of(context).primaryColor,
             ),
             child: SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               child: Row(
                 children: [
                 for(int i=0;i<filterList.length;i++)...[
                   GestureDetector(
                     child: Container(
                       height: 48,
                       padding:const  EdgeInsets.symmetric(horizontal: 32),
                     decoration: BoxDecoration(
                       border: Border(bottom: BorderSide(color:selectedFilter==filterList[i]? appColors.blueColor:Colors.transparent,width: 2))
                     ),
                     alignment: Alignment.center,
                     child: TextUtil(text: filterList[i],weight: true,color: selectedFilter==filterList[i]?Colors.black: const Color(0xff46464F),size: 16),
                                      ),
                   )]
                 ],
               ),
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
                          Expanded(child: Align(
                            alignment:Alignment.centerLeft,
                            child:  Container(
                              width: 64,
                              height: 27,
                              alignment:Alignment.center,
                              decoration: BoxDecoration(
                                  color: appColors.blueColor,
                                  borderRadius: BorderRadius.circular(10)

                              ),
                              child: DescriptionText(text: "Active",color: appColors.whiteColor,),
                            ),
                          )
                         ),
                          Expanded(child:  DescriptionText(text: "\$10,000",),),
                          Expanded(child: DescriptionText(text: "Confirm Order",)),
                          Expanded(child: Align(
                            alignment:Alignment.centerLeft,
                            child: PopupMenuButton(

                              itemBuilder: (BuildContext context) => [
                                PopupMenuItem(
                                  enabled: false,
                                    child:Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8),
                                      child: Column(
                                        children: [
                                          for(int i=0;i<actionList.length;i++)...[
                                            GestureDetector(
                                              onTap:(){
                                                Navigator.pop(context);
                                                showCustomDialog(context,actionList[i]);
                                                },
                                              child: SizedBox(
                                                height: 56,width: 200,
                                                child: TextUtil(text: actionList[i],size: 16,),
                                              ),
                                            )
                                          ]
                                        ],
                                      ),
                                    ),

                                ),
                              ],

                            ),
                          ),)



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
