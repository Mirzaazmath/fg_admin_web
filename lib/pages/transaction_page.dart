import 'package:flutter/material.dart';
import '../components/dailogs/add_bowser_dialog.dart';
import '../utils/text_utils.dart';
import 'dashboard_page.dart';
class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPage();
}

class _TransactionPage extends State<TransactionPage> {
  List<String> actionList = <String>['View details', 'Edit details', 'Delete details', ];
  List<String> filterList = <String>['All', 'Credited', 'Debit/Refund Initiate',];
  String selectedAction = "View details";
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

          title: TextUtil(text: "Transactions",size: 28,),

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
                    Container(
                      height: 48,
                      padding:const  EdgeInsets.symmetric(horizontal: 32),
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color:selectedFilter==filterList[i]? appColors.blueColor:Colors.transparent,width: 2))
                      ),
                      alignment: Alignment.center,
                      child: TextUtil(text: filterList[i],weight: true,color: selectedFilter==filterList[i]?Colors.black: const Color(0xff46464F),size: 16),
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
                          Expanded(child: TextUtil(text: "Transactions ID",weight: true,size: 16,)),
                          Expanded(child:  TextUtil(text: "Date",weight: true,size: 16,),),
                          Expanded(child: TextUtil(text: "Value",weight: true,size: 16,)),
                          Expanded(child:  TextUtil(text: "Status",weight: true,size: 16,)),
                          Expanded(child:  TextUtil(text: "Actions",weight: true,size: 16,)),

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
                                Expanded(child: DescriptionText(text: "#123456789",)),
                                Expanded(child:  DescriptionText(text: "25-Dec-2023",),),
                                Expanded(child: DescriptionText(text: "₹ 5,500",)),
                                Expanded(child: DescriptionText(text: "Credit",)),

                                Expanded(child:  Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  width: double.infinity,
                                  height:32,

                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      border: Border.all(color: Colors.grey)
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: selectedAction,
                                      icon: const Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.black,
                                      ),
                                      elevation: 16,
                                      onChanged: (String? value) {
                                        // This is called when the user selects an item.
                                        setState(() {
                                          selectedAction = value!;
                                        });
                                      },
                                      items: actionList
                                          .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
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
