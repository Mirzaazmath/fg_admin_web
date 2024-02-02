import 'package:admin_panel/components/widgets/color_btn.dart';
import 'package:flutter/material.dart';

import 'dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;
    final ColorScheme _colorScheme = Theme.of(context).colorScheme;

    void handleFormSubmit() {
      if (_loginFormKey.currentState!.validate()) {
        // If the form is valid, display a snackbar. In the real world,
        // you'd often call a server or save the information in a database.
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const DashBoardPage()));
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(content: Text('Processing Data')),
        // );
      }
    }

    return Center(
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
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Username',
                    prefixIcon: Icon(Icons.person_2_outlined),
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
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.password_outlined),
                    isDense: true,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  obscureText: true,
                  onFieldSubmitted: (value) => handleFormSubmit(),
                ),
                const SizedBox(height: 16.0),
                ColorBtn(title: "Login", onTap:handleFormSubmit )

              ],
            ),
          ),
        ),
      ),
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