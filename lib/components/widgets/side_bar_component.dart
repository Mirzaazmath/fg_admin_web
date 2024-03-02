import 'package:admin_panel/components/widgets/side_bar_chip_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/dashboard_page.dart';
import '../../utils/text_utils.dart';

class SideBarWidget extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const SideBarWidget({super.key,required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 270,
      height: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).primaryColor
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(Icons.home_outlined,color: appColors.blackColor,),
            title: const DescriptionText(text: "DashBoard"),),
          const  Divider(),
          Expanded(
            child: ListView(
              children:  [
                const  SizedBox(height: 10,),
                const   DescriptionText(text: "Sales"),
                const  SizedBox(height: 18,),
                 SideBarChipWidget(title: "Orders",count: "12", icon: Icons.shopping_cart_outlined, index: 0,navigationShell: navigationShell,),
                 SideBarChipWidget(title: "Customers",count: "30", icon: Icons.group_outlined, index: 1,navigationShell: navigationShell),
                 SideBarChipWidget(title: "Business profiles",count: "30", icon: Icons.business_center_outlined, index: 2,navigationShell: navigationShell),
                const   Divider(),
                const     SizedBox(height: 10,),
                const   DescriptionText(text: "Store"),
                const    SizedBox(height: 18,),
                SideBarChipWidget(title: "Products",count: "22", icon: Icons.store_mall_directory_outlined, index: 3,navigationShell: navigationShell),
                SideBarChipWidget(title: "Categories",count: "12", icon: Icons.category_outlined, index: 4,navigationShell: navigationShell),
                const  Divider(),
                const   SizedBox(height: 10,),
                const   DescriptionText(text: "Partner Network"),
                const    SizedBox(height: 18,),
                 SideBarChipWidget(title: "Partners",count: "22", icon: Icons.handshake_outlined, index: 5,navigationShell: navigationShell),
                 SideBarChipWidget(title: "Bowsers",count: "12", icon: Icons.local_gas_station_outlined, index: 6,navigationShell: navigationShell),
                 SideBarChipWidget(title: "Drivers",count: "12", icon: Icons.person_2_outlined, index: 7,navigationShell: navigationShell),
                const  Divider(),
                const   SizedBox(height: 10,),
                const   DescriptionText(text: "Accounting"),
                const   SizedBox(height: 18,),
                 SideBarChipWidget(title: "Transactions", icon: Icons.article_outlined, index: 8,navigationShell: navigationShell),
                const    Divider(),
                const    SizedBox(height: 10,),
                const  DescriptionText(text: "Admin controls"),
                const  SizedBox(height: 18,),
                 SideBarChipWidget(title: "App settings", icon: Icons.phone_iphone_outlined, index: 9,navigationShell: navigationShell),
                 SideBarChipWidget(title: "Roles & Permissions", icon: Icons.settings_outlined, index: 10,navigationShell: navigationShell),
                 SideBarChipWidget(title: "Team Management", icon: Icons.groups_outlined, index: 11,navigationShell: navigationShell),
                 SideBarChipWidget(title: "Payments methods", icon: Icons.payment_outlined, index: 12,navigationShell: navigationShell),
              ],
            ),
          )
        ],
      ),
    );
  }
}

