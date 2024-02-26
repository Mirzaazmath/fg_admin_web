import 'package:admin_panel/components/widgets/bottons/create_btn.dart';
import 'package:admin_panel/components/widgets/bottons/setting_btn.dart';
import 'package:admin_panel/components/widgets/toast_widget.dart';
import 'package:admin_panel/utils/color_utils.dart';
import 'package:flutter/material.dart';
import '../components/dailogs/Order_detail_dailog.dart';
import '../components/widgets/chip_filter.dart';
import '../components/widgets/chip_filter_with_search.dart';
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
  List<String> durationList = <String>['Today',"Last 30days", 'This month', 'This Quarter',"Last Quarter",];
  String selectedFilter = "All";
  String searchFilter="All";
  String selectedDuration="Today";
  bool newestSelect=false;
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
    DownloadBtn(onTap: (){}),
    const  SizedBox(width: 10,),
    CreateBtn(onTap: (){}, title: "Create Order"),
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
           SizedBox(
             height: 48,
             width: MediaQuery.of(context).size.width,
             child:Row(
               children: [
                 ChipFilterBtn(
                   selectedFilter: selectedDuration,
                   filterList: durationList, onChange: (val) {
                   setState(() {
                     selectedDuration=val!;
                   });
                 }, constantValue: "Today",
                 ),
               const  Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child:  VerticalDivider(width: 32,),
                ),
                 ChipFilterBtn(
                   selectedFilter: selectedFilter,
                   filterList: filterList, onChange: (val) {
                   setState(() {
                     selectedFilter=val!;
                     isLoad=true;
                   });
                   updateFilter();
                 }, constantValue: "All",
                 ),
                 ChipFilterBtnWithSearch(
                   selectedFilter: searchFilter,
                   filterList: filterList, onChange: (val) {
                   setState(() {
                     searchFilter=val!;
                   });

                 }, constantValue: "All",
                   hintText: "Search for order ID",
                 ),

                const  Expanded(child: SizedBox()),
                 const  Padding(
                   padding: EdgeInsets.symmetric(vertical: 5),
                   child:  VerticalDivider(width: 32,),
                 ),
                 FilterChip(
                   selected: newestSelect,
                     selectedColor: AppColors().secondaryColor,
                     label:const  Text("Newest first"), onSelected: (value){
                     setState(() {
                       newestSelect=value;
                     });

                 })

               ],

             )

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
                                  _showOrderDetailDialog(selectedFilter);
                                //  showCustomDialog(context,selectedFilter=="All"||selectedFilter=="New"?"Confirm order":"View Order");
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
                                                InkWell(
                                                  onTap:(){
                                                    Navigator.pop(context);
                                                    if(actionListAll[i].title=="Download Invoice"){
                                                      showSnackBar(context, "Invoice Downloaded");
                                                    }else if(actionListAll[i].title=="Confirm order"){
                                                      showSnackBar(context, "Order Confirmed");
                                                    }
                                                    else{
                                                      showCustomDialog(context,actionListAll[i].title);
                                                    }

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
  _showOrderDetailDialog(String value){
    showDialog(context: context,
        barrierDismissible: true,
        builder: (BuildContext context){
          return OrderDetailsDialogBox(state: value,);
        }
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