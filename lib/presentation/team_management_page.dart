import 'package:admin_panel/components/dailogs/view_profile_dailog.dart';
import 'package:flutter/material.dart';
import '../components/widgets/bottons/create_btn.dart';
import '../components/widgets/bottons/secondary_btn.dart';
import '../components/widgets/bottons/setting_btn.dart';
import '../components/widgets/global_custom_dailog.dart';
import '../models/menu_model.dart';
import '../utils/text_utils.dart';
import 'dashboard_page.dart';
class TeamManagementPage extends StatefulWidget {
  const TeamManagementPage({super.key});

  @override
  State<TeamManagementPage> createState() => _TeamManagementPage();
}

class _TeamManagementPage extends State<TeamManagementPage> {
  //List<String> actionList = <String>[ 'Edit Profile', 'Delete Profile', ];
  List<MenuModel>actionList=<MenuModel>[MenuModel(icon: Icons.edit, title: "Edit Profile"),MenuModel(icon: Icons.delete_outline, title: "Delete Profile"),];
  List<String> filterList = <String>['Team', 'Roles',];
  String selectedAction = "View Profile";
  String selectedFilter = "Team";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const  EdgeInsets.only(left: 24,right: 24,bottom: 24),
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: appColors.whiteColor,
          centerTitle: false,

          title:const  TextUtil(text: "Team Management",size: 28,),
          actions: [
            SettingBtn(onTap: (){}),
            const SizedBox(width: 10,),
            SecondaryBtn(onTap: (){}),
            const  SizedBox(width: 10,),
            CreateBtn(onTap: (){
              showCustomDialog(context,"Add team member");
            }, title: "Add Team Member"),

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
                  TextUtil(text: "Team Management",size: 16,color: appColors.blueColor,)
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
                child:selectedFilter=="Team"? teamWidget():roleWidget()

              ),
            )
          ],
        ),

      ),

    );
  }

  Widget teamWidget(){
    return   Column(
      children: [
        Container(
          height: 58,
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: appColors.lightGreyColor))
          ),
          child:const  Row(
            children: [
              SizedBox(width: 100,
                child: TitleText(text: "S.No",),),
              Expanded(child: TitleText(text: "Name",)),
              Expanded(child:  TitleText(text: "Email",),),
              Expanded(child:  TitleText(text: "ID",),),
              Expanded(child: TitleText(text: "Role",)),
              Expanded(child: TitleText(text: "Phone Number",)),
              Expanded(child:  TitleText(text: "Actions",)),

            ],
          ),
        ),
        Expanded(child: ListView.builder(
            shrinkWrap: true,
            itemCount: teamList.length,
            itemBuilder: (context,index){
              return  Container(
                height: 58,
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: appColors.lightGreyColor))
                ),
                child: Row(
                  children: [
                    SizedBox(width: 100,
                      child: TitleText(text: "0${index+1}",),),
                    Expanded(child: DescriptionText(text: teamList[index].name,)),
                    Expanded(child:  DescriptionText(text: teamList[index].email,),),
                    Expanded(child:  DescriptionText(text: teamList[index].id,),),
                    Expanded(child: Align(
                      alignment:Alignment.centerLeft,
                      child:  Container(
                        width: 90,
                        height: 27,
                        alignment:Alignment.center,
                        decoration: BoxDecoration(
                            color: appColors.blueColor,
                            borderRadius: BorderRadius.circular(100)

                        ),
                        child: TextUtil(text: teamList[index].role,color: appColors.whiteColor,size: 11,),
                      ),
                    )
                    ),
                    Expanded(child: DescriptionText(text: teamList[index].phoneNumber,)),
                    Expanded(child: Align(
                      alignment:Alignment.centerLeft,
                      child: Row(
                        children: [
                          IconButton(onPressed: (){
                            _showCreateCustomerDialog(false);
                            //View Profile
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
                                            if(i>=1){
                                              showCustomDialog(context,actionList[i].title);
                                            }else{
                                              _showCreateCustomerDialog(true);
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
                                        // InkWell(
                                        //   onTap:(){
                                        //     Navigator.pop(context);
                                        //     if(i>=1){
                                        //       showCustomDialog(context,actionList[i]);
                                        //     }else{
                                        //       _showCreateCustomerDialog(true);
                                        //     }
                                        //
                                        //
                                        //   },
                                        //   child: SizedBox(
                                        //     height: 56,width: 200,
                                        //     child: TextUtil(text: actionList[i].title,size: 16,),
                                        //   ),
                                        // )
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
            }))
      ],
    );
  }
  Widget roleWidget(){
    return   Column(
      children: [
        Container(
          height: 58,
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: appColors.lightGreyColor))
          ),
          child:const  Row(
            children: [

              Expanded(child: TitleText(text: "Role",)),
              Expanded(child:  TitleText(text: "Permission",),),
              Expanded(child:  Align(
                alignment: Alignment.centerRight,
                  child: TitleText(text: "Actions",))),

            ],
          ),
        ),
        Expanded(child: ListView.builder(
            shrinkWrap: true,
            itemCount: teamList.length,
            itemBuilder: (context,index){
              return  Container(
                height: 58,
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: appColors.lightGreyColor))
                ),
                child: Row(
                  children: [

                   const  Expanded(child: DescriptionText(text: "Admin",)),
                   const  Expanded(child:  DescriptionText(text: "99 Permissions"),),

                    Expanded(child: Align(
                      alignment:Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.end,
                        children: [
                          IconButton(onPressed: (){
                            showCustomDialog(context, "Show Role");
                            //View Profile
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
                                        // InkWell(
                                        //   onTap:(){
                                        //     Navigator.pop(context);
                                        //     if(i>=1){
                                        //       showCustomDialog(context,actionList[i]);
                                        //     }else{
                                        //       _showCreateCustomerDialog(true);
                                        //     }
                                        //
                                        //
                                        //   },
                                        //   child: SizedBox(
                                        //     height: 56,width: 200,
                                        //     child: TextUtil(text: actionList[i],size: 16,),
                                        //   ),
                                        // )
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
            }))
      ],
    );
  }

  _showCreateCustomerDialog(bool isEdit){
    showDialog(context: context,
        barrierDismissible: true,
        builder: (BuildContext context){
          return ViewProfileDetailDialogBox(isEdit: isEdit,
          );
        }
    );

  }
}

class  TeamMember{
  String id;
  String name;
  String email;
  String phoneNumber;
  String role;
  TeamMember({required this.name,required this.email,required this.id,required this.phoneNumber,required this.role});
}
List<TeamMember>teamList=[
  TeamMember(id: "Anand@123",name: "Anand",email: "Anand@fuelgenie.in",role: "Admin",phoneNumber: "9014355577"),
  TeamMember(id: "Kiran@123",name: "Kiran",email: "kiran@fuelgenie.in",role: "Assistant",phoneNumber: "6014355577"),
  TeamMember(id: "Mirza@123",name: "Mirza",email: "Mirza@fuelgenie.in",role: "Sales",phoneNumber: "8014355577"),

];