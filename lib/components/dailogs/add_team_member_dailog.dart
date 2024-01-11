import 'package:admin_panel/components/widgets/border_btn.dart';
import 'package:admin_panel/components/widgets/color_btn.dart';
import 'package:admin_panel/presentation/dashboard_page.dart';
import 'package:flutter/material.dart';
import '../../utils/text_feild_utils.dart';
import '../../utils/text_utils.dart';
class AddTeamMemberDialogBox extends StatefulWidget {
  const AddTeamMemberDialogBox({super.key});
  @override
  _AddDriverDialogBoxState createState() => _AddDriverDialogBoxState();
}
class _AddDriverDialogBoxState extends State<AddTeamMemberDialogBox> {

  TextEditingController firstNameController=TextEditingController();
  TextEditingController lastNameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController bloodGroupController=TextEditingController();
  TextEditingController dateOfJoinController=TextEditingController();


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

            addInfoWidget(),
          ],
        )
    );
  }
  ///// addInfoWidget  ///
  Widget addInfoWidget(){
    return  Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 16,),
        TextUtil(text: 'Add Team Member',size: 24,),
        const SizedBox(height: 24,),
        Row(
          children: [
            Expanded(child: Field(controller: firstNameController, hintText: 'First Name',)),
            const SizedBox(width: 16,),
            Expanded(child: Field(controller: lastNameController, hintText: 'Last Name',)),
          ],
        ),
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
            ColorBtn(title: "Create and Save", onTap: (){


            },width: 250,),

          ],
        )
      ],
    );
  }

}