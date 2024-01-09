import 'package:admin_panel/components/widgets/color_btn.dart';
import 'package:admin_panel/utils/text_utils.dart';
import 'package:flutter/material.dart';
import '../../presentation/dashboard_page.dart';
import '../../utils/text_feild_utils.dart';

class EditCustomerDialogBox extends StatefulWidget {
  const EditCustomerDialogBox({super.key});
  @override
  _EditCustomerDialogBoxState createState() => _EditCustomerDialogBoxState();
}

class _EditCustomerDialogBoxState extends State<EditCustomerDialogBox> {
  TextEditingController firstNameController=TextEditingController();
  TextEditingController lastNameController=TextEditingController();
  TextEditingController mobileController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override

  Widget build(BuildContext context) {
    return Container(
      width: 484,
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
          TextUtil(text: 'Add customer',size: 24,),
          const SizedBox(height: 24,),
          Row(
            children: [
              Expanded(child: Field(controller: firstNameController, hintText: 'First Name',)),
              const SizedBox(width: 16,),
              Expanded(child: Field(controller: lastNameController, hintText: 'Last Name',)),
            ],
          ),
          const SizedBox(height: 16,),
          Field(controller: mobileController, hintText: 'Mobile Number',isNumberType: true,),
          const SizedBox(height: 16,),
          Field(controller: emailController, hintText: 'Email Address',),
          const SizedBox(height: 16,),
          Field(controller: passwordController, hintText: ' Set Password',),
          const SizedBox(height: 16,),
          RichText(
            text: TextSpan(
              text: 'By continuing you agree with our\n',
              style:const TextStyle( color:Colors.black,fontSize: 14,
                  fontWeight: FontWeight.w400,fontFamily: "Poppins"
              ),
              children:  <TextSpan>[
                TextSpan(text: 'Terms & Conditions ', style: TextStyle(color: appColors.blueColor)),
                const  TextSpan(text: ' and '),
                TextSpan(text: "Privacy Policy",style: TextStyle(color: appColors.blueColor)),
              ],
            ),
          ),
          const SizedBox(height: 40,),
          ColorBtn(title: "Create Customer", onTap: (){}),
        ],
      ),
    );
  }

}
