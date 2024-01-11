import 'package:admin_panel/utils/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/dialog_provider.dart';
import '../../utils/text_feild_utils.dart';
import '../widgets/color_btn.dart';

class ViewProfileDetailDialogBox extends StatefulWidget {
  bool isEdit;
   ViewProfileDetailDialogBox({super.key,required this.isEdit});
  @override
  _ViewProfileDetailDialogBoxState createState() => _ViewProfileDetailDialogBoxState();
}

class _ViewProfileDetailDialogBoxState extends State<ViewProfileDetailDialogBox> {

  List<String>optionList=["Personal info","Business profile","Delivery location"];
  int selectedOption=0;
  TextEditingController firstNameController=TextEditingController(text: "Kiran");
  TextEditingController lastNameController=TextEditingController(text: "Naik");
  TextEditingController mobileController=TextEditingController(text: "9876543210");
  TextEditingController emailController=TextEditingController(text: "kiran@fuelgenie.in");
  TextEditingController roleController=TextEditingController(text: "Assistant");
  TextEditingController idController=TextEditingController(text: "kiran@123");




  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Consumer<DialogProvider>(
            builder: (BuildContext context, provider, Widget? child) {
              return Container(
                width: 600,
                padding: const  EdgeInsets.all(36),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 16,),
                    TextUtil(text: widget.isEdit?"Edit Profile":'View Profile',size: 24,),
                    const SizedBox(height: 24,),

                    personalInfo(),

                  ],
                ),
              );
            }
        )
    );

  }


  Widget personalInfo(){
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Field(controller: firstNameController, hintText: 'First Name',)),
            const SizedBox(width: 16,),
            Expanded(child: Field(controller: lastNameController, hintText: 'Last Name',)),
          ],
        ),
        const SizedBox(height: 24,),
        Field(controller: mobileController, hintText: 'Mobile Number',isNumberType: true,),
        const SizedBox(height: 16,),
        Field(controller: emailController, hintText: 'Email Address',),
        const SizedBox(height: 16,),
        Field(controller: roleController, hintText: 'Role',),
        const SizedBox(height: 16,),
        Field(controller: idController, hintText: 'ID',),
        const SizedBox(height: 16,),

        widget.isEdit?  Align(
          alignment: Alignment.centerRight,
            child: ColorBtn(title: "Save",width: 150, onTap: (){})):const SizedBox()
      ],
    );
  }



}
