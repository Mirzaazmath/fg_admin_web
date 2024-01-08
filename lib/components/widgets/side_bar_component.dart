import 'package:admin_panel/components/widgets/side_bar_chip_widget.dart';
import 'package:flutter/material.dart';

import '../../pages/dashboard_page.dart';
import '../../utils/text_utils.dart';

class SideBarWidget extends StatelessWidget {
  const SideBarWidget({super.key});

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
            title: DescriptionText(text: "DashBoard"),),
          const  Divider(),
          Expanded(
            child: ListView(
              children: [
                const  SizedBox(height: 10,),
                DescriptionText(text: "Sales"),
                const  SizedBox(height: 18,),
                const SideBarChipWidget(title: "Orders",count: "12", icon: Icons.shopping_cart_outlined, index: 0,),
                const SideBarChipWidget(title: "Customers",count: "30", icon: Icons.group_outlined, index: 1,),
                const SideBarChipWidget(title: "Business profiles",count: "30", icon: Icons.business_center_outlined, index: 2,),
                const  Divider(),
                const  SizedBox(height: 10,),
                DescriptionText(text: "Partner Network"),
                const  SizedBox(height: 18,),
                const SideBarChipWidget(title: "Partners",count: "22", icon: Icons.handshake_outlined, index: 3,),
                const SideBarChipWidget(title: "Bowsers",count: "12", icon: Icons.local_gas_station_outlined, index: 4,),
                const SideBarChipWidget(title: "Drivers",count: "12", icon: Icons.person_2_outlined, index: 5,),
                const  Divider(),
                const  SizedBox(height: 10,),
                DescriptionText(text: "Accounting"),
                const  SizedBox(height: 18,),
                const SideBarChipWidget(title: "Transactions", icon: Icons.article_outlined, index: 6,),
                const  Divider(),
                const  SizedBox(height: 10,),
                DescriptionText(text: "Admin controls"),
                const  SizedBox(height: 18,),
                const SideBarChipWidget(title: "App settings", icon: Icons.phone_iphone_outlined, index: 7,),
                const SideBarChipWidget(title: "Roles & Permissions", icon: Icons.settings_outlined, index: 8,),
                const SideBarChipWidget(title: "Team Management", icon: Icons.groups_outlined, index: 9,),
                const SideBarChipWidget(title: "Payments methods", icon: Icons.payment_outlined, index: 10,),
              ],
            ),
          )
        ],
      ),
    );
  }
}

