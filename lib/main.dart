import 'package:admin_panel/components/widgets/side_bar_component.dart';
import 'package:admin_panel/pages/dashboard_page.dart';
import 'package:admin_panel/provider/dialog_provider.dart';
import 'package:admin_panel/provider/siderbar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>SideBarProvider()),
        ChangeNotifierProvider(create: (_)=>DialogProvider()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "FG-Admin Panel",
        theme: ThemeData(
          primaryColor: const Color(0xffF6F2F7),
          scaffoldBackgroundColor: Colors.white
        ),
        home: const DashBoardPage(),

      ),
    );
  }
}
