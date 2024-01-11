import 'package:admin_panel/components/widgets/border_btn.dart';
import 'package:admin_panel/components/widgets/color_btn.dart';
import 'package:admin_panel/presentation/dashboard_page.dart';
import 'package:flutter/material.dart';
import '../../utils/text_feild_utils.dart';
import '../../utils/text_utils.dart';
class AddTeamMemberDialogBox extends StatefulWidget {
  const AddTeamMemberDialogBox({super.key});
  @override
  _AddTeamMemberDialogBoxState createState() => _AddTeamMemberDialogBoxState();
}
class _AddTeamMemberDialogBoxState extends State<AddTeamMemberDialogBox> {
  final PageController pageController = PageController();
  TextEditingController firstNameController=TextEditingController();
  TextEditingController lastNameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController bloodGroupController=TextEditingController();
  TextEditingController dateOfJoinController=TextEditingController();
  TextEditingController accountNumberController=TextEditingController();
  TextEditingController confirmAccountNoController=TextEditingController();
  TextEditingController ifscController=TextEditingController();
  TextEditingController accountHolderNameController=TextEditingController();
  TextEditingController adhaarController=TextEditingController();
  TextEditingController panController=TextEditingController();
  TextEditingController drivingLicenseController=TextEditingController();
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 584,
        height: 700,
      padding: const  EdgeInsets.all(36),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),

      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              for(int i=0;i<3;i++)...[
                Expanded(child: Container(
                  margin: EdgeInsets.only(right: i ==2?0:20),
                  height: 10,decoration: BoxDecoration(
                  color:selectedIndex<i? Colors.grey:appColors.blueColor,
                  borderRadius: BorderRadius.circular(10),

                ),))
              ]

            ],
          ),
          Expanded(
            child: PageView(
              onPageChanged: (index){
                setState(() {
                  selectedIndex=index;
                });
              },
              physics: const NeverScrollableScrollPhysics(),
              padEnds: true,
              controller: pageController,
              children: [
                personalInfoWidget(),
                bankInfoWidget(),
                documentInfoWidget(),

              ],
            ),
          ),
        ],
      )
    );
  }
  ///// Personal Info ///
  Widget personalInfoWidget(){
    return  Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 16,),
        TextUtil(text: 'Driver Personal details',size: 24,),
        const SizedBox(height: 24,),
        Field(controller: firstNameController, hintText: 'First Name',),
        const SizedBox(height: 24,),
        Field(controller: lastNameController, hintText: 'Last Name',),
        const SizedBox(height: 24,),
        Field(controller: emailController, hintText: 'Email',),
        const SizedBox(height: 24,),
        Field(controller: phoneController, hintText: 'Phone Number',),
        const SizedBox(height: 24,),
        Field(controller: bloodGroupController, hintText: 'Blood Group',),
        const SizedBox(height: 24,),
        Field(controller: dateOfJoinController, hintText: 'Join Date',),
        const SizedBox(height: 24,),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ColorBtn(title: "Save and Continue", onTap: (){
              pageController.animateToPage(1, duration:const  Duration(milliseconds: 500), curve: Curves.linearToEaseOut);

            },width: 250,),

          ],
        )
      ],
    );
  }
  ///// Bank  Info ///

  Widget bankInfoWidget(){
    return  Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 16,),
        TextUtil(text: 'Driver Bank details',size: 24,),
        const SizedBox(height: 24,),
        Field(controller: accountNumberController, hintText: 'Account Number',),
        const SizedBox(height: 24,),
        Field(controller: confirmAccountNoController, hintText: 'Confirm Account Number',),
        const SizedBox(height: 24,),
        Field(controller: ifscController, hintText: 'IFSC',),
        const SizedBox(height: 24,),
        Field(controller: accountHolderNameController, hintText: 'Account Holder Name',),
        const SizedBox(height: 24,),
         const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BorderBtn(title: "Back", onTap: (){
              pageController.animateToPage(0, duration:const  Duration(milliseconds: 500), curve: Curves.linearToEaseOut);

            },width: 150,),

            ColorBtn(title: "Save and Continue", onTap: (){
              pageController.animateToPage(2, duration:const  Duration(milliseconds: 500), curve: Curves.linearToEaseOut);

            },width: 250,),

          ],
        )
      ],
    );
  }


  ///// Document  Info ///

  Widget documentInfoWidget(){
    return  Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 16,),
        TextUtil(text: 'Upload documents',size: 24,),
        const SizedBox(height: 24,),
        Field(controller: adhaarController, hintText: 'Aadhaar Number',),
        const SizedBox(height: 24,),
        Field(controller: panController, hintText: 'Pan Number',),
        const SizedBox(height: 24,),
        Field(controller: drivingLicenseController, hintText: 'Driving License',),
        const SizedBox(height: 24,),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BorderBtn(title: "Back", onTap: (){
              pageController.animateToPage(1, duration:const  Duration(milliseconds: 500), curve: Curves.linearToEaseOut);

            },width: 150,),

            ColorBtn(title: "Save", onTap: (){
             // pageController.animateToPage(3, duration:const  Duration(milliseconds: 500), curve: Curves.linearToEaseOut);

            },width: 250,),

          ],
        )
      ],
    );
  }

}