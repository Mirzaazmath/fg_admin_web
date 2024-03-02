import 'package:admin_panel/presentation/bower_page.dart';
import 'package:admin_panel/presentation/category_page.dart';
import 'package:admin_panel/presentation/customer_page.dart';
import 'package:admin_panel/presentation/partner_page.dart';
import 'package:admin_panel/presentation/payment_method_page.dart';
import 'package:admin_panel/presentation/role_permission_page.dart';
import 'package:admin_panel/presentation/product_page.dart';
import 'package:admin_panel/presentation/team_management_page.dart';
import 'package:admin_panel/presentation/transaction_page.dart';
import 'package:admin_panel/provider/siderbar_provider.dart';
import 'package:admin_panel/utils/color_utils.dart';
import 'package:admin_panel/utils/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../components/widgets/side_bar_component.dart';
import 'appsetting_page.dart';
import 'business_profile.dart';
import 'driver_page.dart';
import 'order_page.dart';

var appColors=AppColors();
List<Widget>pageList=[const OrderPage(),const CustomerPage(),const BusinessPage(),const ProductsPage(),const CategoryPage(),const PartnersPage(),const BowsersPage(),const DriverPage(),const TransactionPage(),const AppSettingPage(),const RoleAndPermissionPage(),const TeamManagementPage(),const PaymentMethodPage()];

class DashBoardPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const DashBoardPage({super.key,required this.navigationShell});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          surfaceTintColor: Colors.transparent,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: false,
        leading:const  Icon(Icons.menu),
        title:const  TextUtil(text: "FuelGenie",size: 22,),
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
            SideBarWidget(navigationShell: navigationShell,),
           const  SizedBox(width: 14,),

            Expanded(child: navigationShell)
            // Expanded(child: Consumer<SideBarProvider>(
            //             //   builder: (context,provider,child) {
            //             //     return pageList[provider.currentIndex];
            //             //   }
            //             // ))


            ],
        ),
      ),
    );
  }

}
