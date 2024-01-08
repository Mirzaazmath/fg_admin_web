import 'package:admin_panel/pages/customer_page.dart';
import 'package:admin_panel/pages/order_page.dart';
import 'package:admin_panel/pages/transaction_page.dart';
import 'package:admin_panel/utils/color_utils.dart';
import 'package:admin_panel/utils/text_utils.dart';
import 'package:flutter/material.dart';

import '../components/widgets/side_bar_component.dart';
import 'bower_page.dart';
var appColors=AppColors();

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          surfaceTintColor: Colors.transparent,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: false,
        leading:const  Icon(Icons.menu),
        title: TextUtil(text: "FuelGenie",size: 22,),
        actions: [
          const  Icon(Icons.notifications_outlined),
          const SizedBox(width: 10,),
          CircleAvatar(
            backgroundColor: appColors.secondaryColor,
            child: Image.asset("assets/images/profile.png"),
          ),
         const  SizedBox(width: 10,),
        ],
      ),
      body: const Padding(
        padding:  EdgeInsets.all(14),
        child: Row(
          children: [
            SideBarWidget(),
            SizedBox(width: 14,),
            Expanded(child: OrderPage())


            ],
        ),
      ),
    );
  }

}
