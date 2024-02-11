import 'package:flutter/material.dart';
import '../components/dailogs/add_bowser_dialog.dart';
import '../components/widgets/global_custom_dailog.dart';
import '../components/widgets/pagination_widget.dart';
import '../models/menu_model.dart';
import '../utils/text_utils.dart';
import 'dashboard_page.dart';
class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPage();
}

class _TransactionPage extends State<TransactionPage> {
  //List<String> actionList = <String>['View details', 'Edit details', 'Delete details', ];
  List<MenuModel>actionList=<MenuModel>[MenuModel(icon: Icons.visibility_outlined, title: "View details"),MenuModel(icon: Icons.edit, title: "Edit details"),MenuModel(icon: Icons.delete_outline, title: "Delete details"),];
  List<String> filterList = <String>['All', 'Credited', 'Debit/Refund Initiate',];
  String selectedAction = "View details";
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
    return Container(
      padding:const  EdgeInsets.only(left: 24,right: 24,bottom: 24),
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: appColors.whiteColor,
          centerTitle: false,

          title: const TextUtil(text: "Transactions",size: 28,),

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
                  TextUtil(text: "Transactions",size: 16,color: appColors.blueColor,)
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
                          Expanded(child: HeadingText(text: "Transactions ID")),
                          Expanded(child:  HeadingText(text: "Date",),),
                          Expanded(child:  HeadingText(text: "Order ID",),),
                          Expanded(child: HeadingText(text: "Amount",)),
                          Expanded(child:  HeadingText(text: "Status",)),
                          Expanded(child:  HeadingText(text: "Kind",)),
                          Expanded(child:  HeadingText(text: "Payment method",)),
                          Expanded(child:  HeadingText(text: "Actions",)),

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
                              const   Expanded(child: DescriptionText(text: "#123456789",)),
                              const   Expanded(child:  DescriptionText(text: "25-Dec-2023",),),
                             const    Expanded(child: DescriptionText(text: "#2433",)),
                             const    Expanded(child: DescriptionText(text: "₹ 5,500",)),
                             const    Expanded(child: DescriptionText(text: "Paid",)),
                             const    Expanded(child: DescriptionText(text: "Sale",)),
                             const    Expanded(child: DescriptionText(text: "FG Credit",)),

                                Expanded(child: Align(
                                  alignment:Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      IconButton(onPressed: (){

                                        //View details
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
                                                        showCustomDialog(context, "");
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
  _showCreateCustomerDialog(){
    showDialog(context: context,
        barrierDismissible: true,
        builder: (BuildContext context){
          return const AddBowserDialogBox(
          );
        }
    );

  }
}
