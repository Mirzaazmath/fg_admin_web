import 'package:admin_panel/components/widgets/border_btn.dart';
import 'package:admin_panel/components/widgets/color_btn.dart';
import 'package:admin_panel/presentation/dashboard_page.dart';
import 'package:flutter/material.dart';
import '../../utils/text_feild_utils.dart';
import '../../utils/text_utils.dart';
class AddDriverDialogBox extends StatefulWidget {
  const AddDriverDialogBox({super.key});
  @override
  _AddDriverDialogBoxState createState() => _AddDriverDialogBoxState();
}
class _AddDriverDialogBoxState extends State<AddDriverDialogBox> {
  final PageController pageController = PageController();
  TextEditingController firstNameController=TextEditingController();
  TextEditingController lastNameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController bloodGroupController=TextEditingController();
  TextEditingController dateOfJoinController=TextEditingController();
  TextEditingController dateOfBirthController=TextEditingController();
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
        height: 600,
      padding: const  EdgeInsets.all(36),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),

      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        Align(
          alignment: Alignment.centerRight,
          child: Chip(
              side:const  BorderSide(color: Colors.transparent),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
            backgroundColor: appColors.lightPurple,
              label:TextUtil(text: "${selectedIndex+1}/3",size: 14,color: Colors.white,) ),
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

        TextUtil(text: 'Driver Personal details',size: 24,),
        const SizedBox(height: 24,),
        Row(
          children: [
            Expanded(child: Field(controller: firstNameController, hintText: 'First Name',)),
            const SizedBox(width: 16,),
            Expanded(child: Field(controller: lastNameController, hintText: 'Last Name',)),
          ],
        ),
        const SizedBox(height: 16,),
        Field(controller: dateOfBirthController, hintText: 'Date of Birth',),
        const SizedBox(height: 16,),
        Field(controller: emailController, hintText: 'Email',),
        const SizedBox(height: 16,),
        Field(controller: phoneController, hintText: 'Phone Number',),
        const SizedBox(height: 16,),
        Row(
          children: [
            Expanded(child: Field(controller: dateOfJoinController, hintText: 'Join Date',),),
            const SizedBox(width: 16,),
            Expanded(child: Field(controller: bloodGroupController, hintText: 'Blood Group',)),
          ],
        ),
        const SizedBox(height: 16,),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ColorBtn(title: "Next", onTap: (){
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

            ColorBtn(title: "Next", onTap: (){
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
        Row(
          children: [
            Expanded(child: Field(controller: adhaarController, hintText: 'Aadhaar Number',),),
           const  SizedBox(width: 20,),
            BorderBtn(title: "Upload document", onTap: (){},width: 180,)
          ],
        ),
        const SizedBox(height: 24,),
        Row(
          children: [
            Expanded(child:  Field(controller: panController, hintText: 'Pan Number',),),
            const  SizedBox(width: 20,),
            BorderBtn(title: "Upload document", onTap: (){},width: 180,)
          ],
        ),

        const SizedBox(height: 24,),
        Row(
          children: [
            Expanded(child:  Field(controller: drivingLicenseController, hintText: 'Driving License',),),
            const  SizedBox(width: 20,),
            BorderBtn(title: "Upload document", onTap: (){},width: 180,)
          ],
        ),

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