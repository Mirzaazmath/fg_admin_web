import 'package:flutter/material.dart';
import '../components/dailogs/add_bowser_dialog.dart';
import '../components/widgets/global_custom_dailog.dart';
import '../utils/text_utils.dart';
import 'dashboard_page.dart';
class DriverPage extends StatefulWidget {
  const DriverPage({super.key});

  @override
  State<DriverPage> createState() => _DriverPage();
}

class _DriverPage extends State<DriverPage> {
  List<String> actionList = <String>['View details', 'Edit details', 'Delete details',"Deactivate" ];
  List<String> filterList = <String>['All', 'Active', 'Inactive',];
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

          title: TextUtil(text: "Drivers",size: 28,),
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
            GestureDetector(
              onTap: (){
                showCustomDialog(context,"Add Driver");
              },
              child: Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: appColors.secondaryColor,
                    borderRadius: BorderRadius.circular(20),

                  ),
                  alignment: Alignment.center,
                  child: TextUtil(text: 'Add Driver',color: appColors.greyColor,size: 14,)
              ),
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
                  TextUtil(text: "Drivers",size: 16,color: appColors.blueColor,)
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
                          SizedBox(width: 100,
                          child: TextUtil(text: "Avatar",weight: true,size: 16,),),
                          Expanded(child: TextUtil(text: "Name",weight: true,size: 16,)),
                          Expanded(child:  TextUtil(text: "Phone number",weight: true,size: 16,),),
                          Expanded(child:  TextUtil(text: "Status",weight: true,size: 16,),),
                          Expanded(child: TextUtil(text: "Out of office",weight: true,size: 16,)),
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
                                Container(width: 100,
                                  alignment: Alignment.centerLeft,
                                  child:CircleAvatar(
                                    backgroundColor: appColors.secondaryColor,
                                    child: Image.asset("assets/images/profile.png"),
                                  ),),
                                Expanded(child: DescriptionText(text: "KIran Naik",)),
                                Expanded(child:  DescriptionText(text: "9014355577",),),
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
                                Expanded(child: DescriptionText(text: "Yes",)),
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
                                                    showCustomDialog(context,"");
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
