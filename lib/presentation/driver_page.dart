import 'package:flutter/material.dart';
import '../components/dailogs/add_driver_dailog.dart';
import '../components/dailogs/view_driver_dailog.dart';
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
class DriverPage extends StatefulWidget {
  const DriverPage({super.key});

  @override
  State<DriverPage> createState() => _DriverPage();
}

class _DriverPage extends State<DriverPage> {

  List<MenuModel>actionList=<MenuModel>[MenuModel(icon: Icons.edit, title: "Edit driver"),MenuModel(icon: Icons.delete_outline, title: "Delete Driver"),MenuModel(icon: Icons.lock_outline, title: "Deactivate Driver"),];
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

          title:const  TextUtil(text: "Drivers",size: 28,),
          actions: [
            DownloadBtn(onTap: (){}),
            const SizedBox(width: 10,),
            SecondaryBtn(onTap: (){}),
            const  SizedBox(width: 10,),
            CreateBtn(onTap: (){
              _showCreateDriverDialog();
            }, title: "Add Driver"),
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
                      hintText: "Search by name/phone number",
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
                          Expanded(child: HeadingText(text: "Name",)),
                          Expanded(child:  HeadingText(text: "Phone number",),),
                          Expanded(child: HeadingText(text: "Truck",)),
                          Expanded(child: HeadingText(text: "Blood group",)),
                          Expanded(child:  HeadingText(text: "Status",),),
                          Expanded(child: HeadingText(text: "Out of office",)),
                          Expanded(child:  HeadingText(text: "Actions",)),

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

                             const    Expanded(child: DescriptionText(text: "KIran Naik",)),
                              const   Expanded(child:  DescriptionText(text: "9014355577",),),
                              const   Expanded(child:  DescriptionText(text: "Allocated",),),
                             const    Expanded(child:  DescriptionText(text: "B+",),),
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
                               const  Expanded(child: DescriptionText(text: "Yes",)),
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
                                                  for(int i=0;i<actionList.length;i++)...[
                                                    InkWell(
                                                      onTap:(){
                                                        Navigator.pop(context);
                                                        if(i==0){
                                                          _showCreateCustomerDialog(true);
                                                        }else if (i==actionList.length-1){
                                                          showSnackBar(context,"Driver Deactivated");

                                                        }else{
                                                          showCustomDialog(context,actionList[i].title);
                                                        }
                                                        // showCustomDialog(context,actionList[i].title);
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
          return  ViewDriverDetailDialogBox(isEdit: isEdit,
          );
        }
    );

  }
  _showCreateDriverDialog(){
    showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return const  AddDriverDialogBox();
        }
    );

  }
}
