import 'package:flutter/material.dart';
import '../components/widgets/global_custom_dailog.dart';
import '../components/widgets/pagination_widget.dart';
import '../models/menu_model.dart';
import '../utils/text_utils.dart';
import 'dashboard_page.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  List<String> filterList = <String>['All',"New", 'Confirmed', 'Truck allocated',"Out for delivery","Delivered","Cancelled"];
  String selectedFilter = "All";
  bool isLoad=false;
  void updateFilter(){
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        isLoad=false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    List<MenuModel>actionListAll=menuItems(selectedFilter);
    return Container(
    padding:const  EdgeInsets.only(left: 24,right: 24,bottom: 24),
     child: Scaffold(
appBar: AppBar(
  surfaceTintColor: Colors.transparent,
  backgroundColor: appColors.whiteColor,
  centerTitle: false,
  title:const  TextUtil(text: "Order",size: 28,),
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
    SizedBox(
      height: 40,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: appColors.secondaryColor,
          ),
          onPressed: (){}, child: TextUtil(text: 'Create Order',color: appColors.brownColor,size: 14,)),
    )

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
                   InkWell(
                     onTap:(){
                       setState(() {
                         selectedFilter=filterList[i];
                         isLoad=true;
                         updateFilter();
                       });
                       },
                     child: Container(
                       height: 48,
                       padding:const  EdgeInsets.symmetric(horizontal: 32),
                     decoration: BoxDecoration(
                       border: Border(bottom: BorderSide(color:selectedFilter==filterList[i]? appColors.blueColor:Colors.transparent,width: 2))
                     ),
                     alignment: Alignment.center,
                     child: TextUtil(text: filterList[i],color: selectedFilter==filterList[i]?Colors.black: const Color(0xff46464F),size: 16),
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
                    child:const  Row(
                      children: [
                        Expanded(child: HeadingText(text: "Order ID",)),
                        Expanded(child:  HeadingText(text: "Customer",),),
                        Expanded(child: HeadingText(text: "Status",)),
                        Expanded(child:  HeadingText(text: "Value",),),
                        Expanded(child: HeadingText(text: "Payment status",)),
                        Expanded(child:  HeadingText(text: "Actions",))

                      ],
                    ),
                  ),
                  Expanded(child:
                  isLoad?const Center(child: CircularProgressIndicator(),):ListView.builder(
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
                         const  Expanded(child: DescriptionText(text: "1234567890",)),
                         const  Expanded(child:  DescriptionText(text: "Kiran Naik",),),
                          Expanded(child: Align(
                            alignment:Alignment.centerLeft,
                            child:  Container(
                              width: 120,
                              height: 20,
                              alignment:Alignment.center,
                              decoration: BoxDecoration(
                                  color:selectedFilter=="Cancelled"?appColors.redColor: appColors.blueColor,
                                  borderRadius: BorderRadius.circular(100)

                              ),
                              child: TextUtil(text:selectedFilter=="All"?"Active": selectedFilter,color: appColors.whiteColor,size: 11,),
                            ),
                          )
                          ),
                       const    Expanded(child:  DescriptionText(text: "\$10,000",),),
                         const  Expanded(child: DescriptionText(text: "Paid",)),
                          Expanded(child: Align(
                            alignment:Alignment.centerLeft,
                            child: Row(
                              children: [
                                IconButton(onPressed: (){
                                  showCustomDialog(context,"Confirm order");
                                }, icon:const  Icon(Icons.visibility_outlined)),

                                PopupMenuButton(

                                  itemBuilder: (BuildContext context) => [
                                    PopupMenuItem(

                                      enabled: false,
                                        child:Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 8),
                                          child: Column(
                                            children: [
                                              for(int i=0;i<actionListAll.length;i++)...[
                                                GestureDetector(
                                                  onTap:(){
                                                    Navigator.pop(context);
                                                    showCustomDialog(context,actionListAll[i].title);
                                                    },
                                                  child: SizedBox(
                                                    height: 56,width: 200,
                                                    child: Row(
                                                      children: [
                                                        Icon(actionListAll[i].icon,color: appColors.blackColor,),
                                                       const  SizedBox(width: 12,),
                                                        TextUtil(text: actionListAll[i].title,size: 16,),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ]
                                            ],
                                          ),
                                        ),

                                    ),
                                  ],

                                ),
                              ],
                            ),
                          ),)
                        ],
                      ),
                    );
                  })),
                  const PaginationWidget(),


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
List<MenuModel> menuItems(String filter ){
  switch(filter){
    case "All":{
      return [MenuModel(icon: Icons.check, title: "Confirm order"),MenuModel(icon: Icons.fire_truck_outlined, title: "Allocate bowser"),MenuModel(icon: Icons.cancel_outlined, title: "Cancel order"),MenuModel(icon: Icons.credit_card_outlined, title: "Initiate refund"),MenuModel(icon: Icons.receipt_long_outlined, title: "Download Invoice")];
    }
    case "New":{

      return [MenuModel(icon: Icons.check, title: "Confirm order"),MenuModel(icon: Icons.fire_truck_outlined, title: "Allocate bowser"),MenuModel(icon: Icons.cancel_outlined, title: "Cancel order"),];
    }
    case "Confirmed":{

      return [MenuModel(icon: Icons.fire_truck_outlined, title: "Allocate bowser"),MenuModel(icon: Icons.cancel_outlined, title: "Cancel order"),];
    }
    case "Truck allocated":{

      return [MenuModel(icon: Icons.cancel_outlined, title: "Cancel order"),];
    }
    case "Out for delivery":{

      return [MenuModel(icon: Icons.visibility_outlined, title: "View Order"),];
    }
    case "Delivered":{

      return [MenuModel(icon: Icons.receipt_long_outlined, title: "Download Invoice"),];
    }
    case "Cancelled":{

      return [MenuModel(icon: Icons.credit_card_outlined, title: "Initiate refund"),];
    }


    default :{
      return [MenuModel(icon: Icons.check, title: "Confirm order"),MenuModel(icon: Icons.fire_truck_outlined, title: "Allocate bowser"),MenuModel(icon: Icons.cancel_outlined, title: "Cancel order"),MenuModel(icon: Icons.credit_card_outlined, title: "Initiate refund"),MenuModel(icon: Icons.receipt_long_outlined, title: "Download Invoice")];
    }


  }
}