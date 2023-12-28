import 'package:admin_panel/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FG-Admin Panel",
      theme: ThemeData(
        primaryColor: const Color(0xffF6F2F7),
        scaffoldBackgroundColor: Colors.white
      ),
      home: const DashBoardPage(),

    );
  }
}
