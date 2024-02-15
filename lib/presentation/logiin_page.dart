import 'package:admin_panel/components/widgets/bottons/color_btn.dart';
import 'package:admin_panel/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  bool _isHidden=true;

  void handleFormSubmit() {
    if (_loginFormKey.currentState!.validate()) {

      context.go(RouteNames.ordersPagePath);
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
     // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const DashBoardPage()));
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('Processing Data')),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;





    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 10,
            child: Container(
              width: 400.0,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(20),
               color: appColors.whiteColor
             ),
              padding: const EdgeInsets.symmetric(horizontal:  24.0,vertical: 50),
              child: Form(
                key: _loginFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: _textTheme.titleSmall,
                    ),
                   const  SizedBox(height: 10,),
                    Text(
                      'FuelGenie Admin',
                      style: _textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(

                      decoration:  InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
                        focusedBorder:  OutlineInputBorder(
                          borderSide:  BorderSide(color: appColors.blueColor, width: 1.0),
                        ),
                        border:const  OutlineInputBorder(

                        ),
                        hintText: 'Login ID',
                        labelText:"Login ID",

                        prefixIcon:const  Icon(Icons.person_2_outlined),
                        isDense: true,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) => handleFormSubmit(),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      decoration:  InputDecoration(
                        focusedBorder:  OutlineInputBorder(
                          borderSide:  BorderSide(color: appColors.blueColor, width: 1.0),
                        ),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(onPressed: (){
                          setState(() {
                          _isHidden=!_isHidden;
                          });
                        }, icon:  Icon(_isHidden?Icons.visibility_outlined:Icons.visibility_off_outlined),),
                        hintText: 'Password',
                        labelText: "Password",
                        prefixIcon:const  Icon(Icons.password_outlined),
                       // isDense: true,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      obscureText: _isHidden,
                      onFieldSubmitted: (value) => handleFormSubmit(),
                    ),
                    const SizedBox(height: 16.0),
                    ColorBtn(title: "Login", onTap:handleFormSubmit )

                  ],
                ),
              ),
            ),
          ),
        ),
       const  SizedBox(height: 40,),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'By continuing you agree with our\n ',
            style: TextStyle(color:appColors.greyColor,fontSize: 14),
            children:  <TextSpan>[
              TextSpan(text: 'Terms & Conditions ', style: TextStyle(color: appColors.blueColor)),
             const  TextSpan(text: 'and'),
              TextSpan(text: ' Privacy Policy', style: TextStyle(color: appColors.blueColor)),
            ],
          ),
        )
      ],
    );
  }
}

/*
General Suggestions:
- Use TextFormField instead of TextField for input fields. TextFormField provides built-in validation capabilities.
- Add appropriate validation logic to the TextFormField widgets and display error messages if necessary.
- Use obscureText property set to true for password fields to hide the entered text.
- Add proper labels to the input fields using InputDecoration to improve accessibility and user experience.
- Consider adding additional form fields or features as needed for your specific login form requirements.
*/