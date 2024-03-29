import 'package:flutter/material.dart';
import '../components/dailogs/view_customer_details_dailog.dart';
import '../components/widgets/bottons/create_btn.dart';
import '../components/widgets/chip_filter.dart';
import '../components/widgets/chip_filter_with_search.dart';
import '../depricated/secondary_btn.dart';
import '../components/widgets/bottons/setting_btn.dart';
import '../components/widgets/global_custom_dailog.dart';
import '../components/widgets/pagination_widget.dart';
import '../components/widgets/toast_widget.dart';
import '../models/menu_model.dart';
import '../utils/text_utils.dart';
import 'dashboard_page.dart';
class CustomerPage extends StatefulWidget {
  const CustomerPage({super.key});

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {

  //List<MenuModel>actionList=<MenuModel>[MenuModel(icon: Icons.edit, title: "Edit customer"),MenuModel(icon: Icons.list_alt_outlined, title: "List of orders"),MenuModel(icon: Icons.person_off_outlined, title: "Inactive customer"),];
  List<String> filterList = <String>['All',"Active","Inactive"];
  String selectedAction = "View customer details";
  String selectedFilter = "All";
  String searchFilter="All";
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
    List<MenuModel>actionList=menuItems(selectedFilter);
    return Container(
      padding:const  EdgeInsets.only(left: 24,right: 24,bottom: 24),
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: appColors.whiteColor,
          centerTitle: false,

          title:const  TextUtil(text: "Customers",size: 28,),
          actions: [
            DownloadBtn(onTap: (){}),
            const SizedBox(width: 10,),
            SecondaryBtn(onTap: (){}),
            const  SizedBox(width: 10,),
            CreateBtn(onTap: (){
              showCustomDialog(context,"New Customer");
            }, title: "New Customer"),


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
                  TextUtil(text: "Customers",size: 16,color: appColors.blueColor,)
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
                      hintText: "Search for Customer ID/Name",
                    ),

                    const  Expanded(child: SizedBox()),
                    const  Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child:  VerticalDivider(width: 32,),
                    ),
                    FilterChip(
                        selected: newestSelect,
                        selectedColor: appColors.secondaryColor,
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
                          Expanded(child: HeadingText(text: "Customer ID",)),
                          Expanded(child:  HeadingText(text: "Name",),),
                          Expanded(child: HeadingText(text: "Email",)),
                          Expanded(child:  HeadingText(text: "Phone",),),
                          Expanded(child:  HeadingText(text: "Status",),),
                          Expanded(child: HeadingText(text: "No.of orders",)),
                          Expanded(child:  HeadingText(text: "Actions",))

                        ],
                      ),
                    ),
                    Expanded(child: isLoad?const Center(child: CircularProgressIndicator(),): ListView.builder(
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
                               const  Expanded(child: DescriptionText(text: "Kiran@gmail.com",)),
                              const   Expanded(child:  DescriptionText(text: "9746274637",),),
                                Expanded(child: Align(
                                  alignment:Alignment.centerLeft,
                                  child:  Container(
                                    width: 64,
                                    height: 20,
                                    alignment:Alignment.center,
                                    decoration: BoxDecoration(
                                        color:selectedFilter=="Inactive"?appColors.redColor:index.isEven&&selectedFilter=="All"?appColors.redColor: appColors.blueColor,
                                        borderRadius: BorderRadius.circular(100)

                                    ),
                                    child: TextUtil(text:selectedFilter=="Inactive"?"Inactive":index.isEven&&selectedFilter=="All"?"Inactive": "Active",color: appColors.whiteColor,size: 11,),
                                  ),
                                )
                                ),
                              const   Expanded(child: DescriptionText(text: "12",)),
                                Expanded(child: Align(
                                  alignment:Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      IconButton(onPressed: (){
                                        _showCreateCustomerDialog(false);
                                      }, icon:const  Icon(Icons.visibility_outlined)),
                                      PopupMenuButton(
                                        itemBuilder: (BuildContext context) => [
                                          PopupMenuItem(
                                            enabled: false,
                                            child:Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 8),
                                              child: Column(
                                                children: [
                                                  for(int i=0;i<actionList.length;i++)...[
                                                    InkWell(
                                                      onTap:(){
                                                        Navigator.pop(context);
                                                        if(i==0){
                                                          _showCreateCustomerDialog(true);
                                                        }else if (i==actionList.length-1){
                                                          showSnackBar(context,selectedFilter=="Active"?"Customer Deactivated":"Customer Activated");

                                                        }else{
                                                          showCustomDialog(context,actionList[i].title);
                                                        }

                                                      },
                                                      child: SizedBox(
                                                        height: 56,width: 250,
                                                        child: Row(
                                                          children: [
                                                            Icon(actionList[i].icon,color: appColors.blackColor,),
                                                            const  SizedBox(width: 12,),
                                                            TextUtil(text: actionList[i].title,size: 16,),
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
  _showCreateCustomerDialog(bool isEdit){
    showDialog(context: context,
        barrierDismissible: true,
        builder: (BuildContext context){
          return  ViewCustomerDetailDialogBox(isEdit: isEdit,
          );
        }
    );

  }
}

List<MenuModel> menuItems(String filter ){
  switch(filter){
    case "All":{
      return [MenuModel(icon: Icons.edit, title: "Edit customer"),MenuModel(icon: Icons.person_off_outlined, title: "Deactivate customer"),];
    }
    case "Active":{
      return [MenuModel(icon: Icons.edit, title: "Edit customer"),MenuModel(icon: Icons.person_off_outlined, title: "Deactivate customer"),];
    }
    case "Inactive":{
      return [MenuModel(icon: Icons.edit, title: "Edit customer"),MenuModel(icon: Icons.person_outlined, title: "Activate customer"),];
    }
    case "AllList":{
      return [MenuModel(icon: Icons.check, title: "Confirm order"),MenuModel(icon: Icons.fire_truck_outlined, title: "Allocate bowser"),MenuModel(icon: Icons.cancel_outlined, title: "Cancel order"),MenuModel(icon: Icons.credit_card_outlined, title: "Initiate refund"),MenuModel(icon: Icons.receipt_long_outlined, title: "Download Invoice")];
    }
    default:{
      return [MenuModel(icon: Icons.edit, title: "Edit customer"),MenuModel(icon: Icons.person_off_outlined, title: "Deactivate customer"),];
    }

  }
}