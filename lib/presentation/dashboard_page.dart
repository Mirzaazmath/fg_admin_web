import 'package:admin_panel/presentation/bower_page.dart';
import 'package:admin_panel/presentation/customer_page.dart';
import 'package:admin_panel/presentation/transaction_page.dart';
import 'package:admin_panel/provider/siderbar_provider.dart';
import 'package:admin_panel/utils/color_utils.dart';
import 'package:admin_panel/utils/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/widgets/side_bar_component.dart';
import 'driver_page.dart';
import 'order_page.dart';

var appColors=AppColors();
List<Widget>pageList=[const OrderPage(),const CustomerPage(),Container(),Container(),const BowsersPage(),const DriverPage(),const TransactionPage(),Container(),Container(),Container(),Container()];

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
      body:  Padding(
        padding: const  EdgeInsets.all(14),
        child: Row(
          children: [
           const  SideBarWidget(),
           const  SizedBox(width: 14,),
            Expanded(child: Consumer<SideBarProvider>(
              builder: (context,provider,child) {
                return pageList[provider.currentIndex];
              }
            ))


            ],
        ),
      ),
    );
  }

}
