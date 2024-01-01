import 'package:admin_panel/pages/dashboard_page.dart';
import 'package:admin_panel/utils/text_utils.dart';
import 'package:flutter/material.dart';
import '../../utils/text_feild_utils.dart';


// CUSTOM DAILOG CLASS
class CreateCustomerDialogBox extends StatefulWidget {

  const CreateCustomerDialogBox({super.key});



  @override
  _CreateCustomerDialogBoxState createState() => _CreateCustomerDialogBoxState();
}

class _CreateCustomerDialogBoxState extends State<CreateCustomerDialogBox> {
  TextEditingController firstNameController=TextEditingController();
  TextEditingController lastNameController=TextEditingController();
  TextEditingController mobileController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }
  contentBox(context){

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
                TextSpan(text: 'Terms & Conditions ', style: TextStyle(color: appColors.darkBlue)),
               const  TextSpan(text: ' and '),
                TextSpan(text: "Privacy Policy",style: TextStyle(color: appColors.darkBlue)),
              ],
            ),
          ),
          const SizedBox(height: 40,),
          Align(
            alignment: Alignment.center,
            child:GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30), color: appColors.darkBlue
                ),
                alignment: Alignment.center,
                child: TextUtil(text:"Create Customer",color: Colors.white,size: 14,)

              ),
            ),

          )
        ],
      ),
    );
  }
}