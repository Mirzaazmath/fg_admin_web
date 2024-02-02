import 'package:flutter/material.dart';
import '../components/dailogs/view_customer_details_dailog.dart';
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

          title: TextUtil(text: "Customers",size: 28,),
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
                  onPressed: (){
                    showCustomDialog(context,"New Customer");
                  }, child: TextUtil(text: 'New Customer',color: appColors.brownColor,size: 14,)),
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
                  TextUtil(text: "Customers",size: 16,color: appColors.blueColor,)
                ],
              ),
            ),
            const  SizedBox(height: 32,),
            Container(
              height: 48,
              padding:const  EdgeInsets.symmetric(horizontal: 52),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,

              ),
              child: Row(
                children: [
                  for(int i=0;i<filterList.length;i++)...[
                    InkWell(
                      onTap: (){
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
                          Expanded(child: TextUtil(text: "Customer ID",weight: true,size: 16,)),
                          Expanded(child:  TextUtil(text: "Name",weight: true,size: 16,),),
                          Expanded(child: TextUtil(text: "Email",weight: true,size: 16,)),
                          Expanded(child:  TextUtil(text: "Phone",weight: true,size: 16,),),
                          Expanded(child:  TextUtil(text: "Status",weight: true,size: 16,),),
                          Expanded(child: TextUtil(text: "No.of orders",weight: true,size: 16,)),
                          Expanded(child:  TextUtil(text: "Actions",weight: true,size: 16,))

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
                                Expanded(child: DescriptionText(text: "1234567890",)),
                                Expanded(child:  DescriptionText(text: "Kiran Naik",),),
                                Expanded(child: DescriptionText(text: "Kiran@gmail.com",)),
                                Expanded(child:  DescriptionText(text: "9746274637",),),
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
                                Expanded(child: DescriptionText(text: "12",)),
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
                                                    GestureDetector(
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
                                                        height: 56,width: 200,
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
      return [MenuModel(icon: Icons.edit, title: "Edit customer"),MenuModel(icon: Icons.person_off_outlined, title: "Inactive customer"),];
    }
    case "Active":{
      return [MenuModel(icon: Icons.edit, title: "Edit customer"),MenuModel(icon: Icons.person_off_outlined, title: "Inactive customer"),];
    }
    case "Inactive":{
      return [MenuModel(icon: Icons.edit, title: "Edit customer"),MenuModel(icon: Icons.person_outlined, title: "Active customer"),];
    }
    default:{
      return [MenuModel(icon: Icons.edit, title: "Edit customer"),MenuModel(icon: Icons.person_off_outlined, title: "Inactive customer"),];
    }

  }
}