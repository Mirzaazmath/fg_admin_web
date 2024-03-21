import 'package:admin_panel/components/widgets/toast_widget.dart';
import 'package:flutter/material.dart';
import '../components/dailogs/view_bowser_details_dialog.dart';
import '../components/widgets/bottons/create_btn.dart';
import '../components/widgets/chip_filter.dart';
import '../components/widgets/chip_filter_with_search.dart';
import '../depricated/secondary_btn.dart';
import '../components/widgets/bottons/setting_btn.dart';
import '../components/widgets/global_custom_dailog.dart';
import '../components/widgets/pagination_widget.dart';
import '../models/menu_model.dart';
import '../utils/text_utils.dart';
import 'dashboard_page.dart';
class BowsersPage extends StatefulWidget {
  const BowsersPage({super.key});

  @override
  State<BowsersPage> createState() => _BowsersPageState();
}

class _BowsersPageState extends State<BowsersPage> {

  //List<MenuModel>actionList=<MenuModel>[MenuModel(icon: Icons.edit, title: "Edit details"),MenuModel(icon: Icons.delete_outline, title: "Delete details"),MenuModel(icon: Icons.person_2_outlined, title: "Allocate Driver"),];
  List<String> filterList = <String>['All', 'Active', 'Inactive',];
  String selectedAction = "View details";
  String selectedFilter = "All";
  String searchFilter="All";
  bool newestSelect=false;
  bool isLoad=false;
  void updateFilter(){
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        isLoad=false;
      });
    });}
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

          title: const TextUtil(text: "Bowsers",size: 28,),
          actions: [
            DownloadBtn(onTap: (){}),
            const SizedBox(width: 10,),
            SecondaryBtn(onTap: (){}),
            const  SizedBox(width: 10,),
            CreateBtn(onTap: (){
              showCustomDialog(context,"Add bowsers");
            }, title: "New Bowsers"),

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
                  TextUtil(text: "Bowsers",size: 16,color: appColors.blueColor,)
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
                      hintText: "Search by Vehicle number",
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
            // Container(
            //   height: 48,
            //   padding:const  EdgeInsets.symmetric(horizontal: 52),
            //   decoration: BoxDecoration(
            //     color: Theme.of(context).primaryColor,
            //
            //   ),
            //   child: Row(
            //     children: [
            //       for(int i=0;i<filterList.length;i++)...[
            //         InkWell(
            //           onTap: (){
            //             setState(() {
            //               selectedFilter=filterList[i];
            //               isLoad=true;
            //               updateFilter();
            //             });
            //
            //           },
            //           child: Container(
            //             height: 48,
            //             padding:const  EdgeInsets.symmetric(horizontal: 32),
            //             decoration: BoxDecoration(
            //                 border: Border(bottom: BorderSide(color:selectedFilter==filterList[i]? appColors.blueColor:Colors.transparent,width: 2))
            //             ),
            //             alignment: Alignment.center,
            //             child: TextUtil(text: filterList[i],color: selectedFilter==filterList[i]?Colors.black: const Color(0xff46464F),size: 16),
            //           ),
            //         )]
            //     ],
            //   ),
            // ),
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
                          Expanded(child: HeadingText(text: "Vehicle number",)),
                          Expanded(child:  HeadingText(text: "Allocated driver",),),
                          Expanded(child:  HeadingText(text: "Fuel left",),),
                          Expanded(child: HeadingText(text: "Active orders",)),
                          Expanded(child: HeadingText(text: "Status",)),
                          Expanded(child:  HeadingText(text: "Actions",))

                        ],
                      ),
                    ),
                    Expanded(child:isLoad?const Center(child: CircularProgressIndicator(),):  ListView.builder(
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
                              const   Expanded(child: DescriptionText(text: "1234567890",)),
                              const   Expanded(child:  DescriptionText(text: "Kiran Naik",)),
                              const   Expanded(child: DescriptionText(text: "500/2500 lt",)),
                              const   Expanded(child: DescriptionText(text: "6",)),
                                Expanded(child: Align(
                                  alignment:Alignment.centerLeft,
                                  child:
                                  Container(
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
                                Expanded(child: Align(
                                  alignment:Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      IconButton(onPressed: (){
                                        _showCreateCustomerDialog(false);
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
                                                  for(int i=0;i<actionListAll.length;i++)...[
                                                    InkWell(
                                                      onTap:(){
                                                        Navigator.pop(context);
                                                        if(i==0){
                                                          _showCreateCustomerDialog(true);
                                                        }else if(actionListAll[i].title=="Allocate Driver") {
                                                          showCustomDialog(context,"Allocate Driver");
                                                        }else if(actionListAll[i].title=="Deactivate"){
                                                          showSnackBar(context, "Bowser Deactivated");
                                                        }
                                                        else if(actionListAll[i].title=="Activate"){
                                                          showSnackBar(context, "Bowser Activated");
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
  _showCreateCustomerDialog(bool isEdit){
    showDialog(context: context,
        barrierDismissible: true,
        builder: (BuildContext context){
          return  ViewBowserDetailDialogBox(isEdit:isEdit
          );
        }
    );

  }
}
List<MenuModel> menuItems(String filter ){
  switch(filter){
    case "All":{
      return [MenuModel(icon: Icons.edit, title: "Edit details"),MenuModel(icon: Icons.delete_outline, title: "Delete details"),MenuModel(icon: Icons.person_2_outlined, title: "Allocate Driver"),MenuModel(icon: Icons.do_not_disturb_on_outlined, title: "Deactivate"),];
    }
    case "Active":{

      return [MenuModel(icon: Icons.edit, title: "Edit details"),MenuModel(icon: Icons.delete_outline, title: "Delete details"),MenuModel(icon: Icons.person_2_outlined, title: "Allocate Driver"),MenuModel(icon: Icons.do_not_disturb_on_outlined, title: "Deactivate"),];
    }
    case "Inactive":{

      return [MenuModel(icon: Icons.edit, title: "Edit details"),MenuModel(icon: Icons.delete_outline, title: "Delete details"),MenuModel(icon: Icons.check_circle_outline, title: "Activate")];
    }
    default :{
      return [MenuModel(icon: Icons.edit, title: "Edit details"),MenuModel(icon: Icons.delete_outline, title: "Delete details"),MenuModel(icon: Icons.person_2_outlined, title: "Allocate Driver"),MenuModel(icon: Icons.person_2_outlined, title: "Deactivate"),];
    }


  }
}