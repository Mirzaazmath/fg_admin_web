import 'package:admin_panel/presentation/dashboard_page.dart';
import 'package:admin_panel/utils/text_utils.dart';
import 'package:flutter/material.dart';

class ViewOrderDialogBox extends StatefulWidget {
  const ViewOrderDialogBox({super.key});
  @override
  _ViewOrderDialogBoxState createState() => _ViewOrderDialogBoxState();
}
class _ViewOrderDialogBoxState extends State<ViewOrderDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 814,
      height: 660,
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
          TextUtil(text: 'Order: #123456789',size: 24,),
          const SizedBox(height: 24,),
          Expanded(
            child: Row(
              children: [
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TitleText(text: "Order items",),
                    const SizedBox(height: 8,),
                    ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        itemBuilder: (context,index){
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DescriptionText(text: "item one x $index"),
                                DescriptionText(text: "Rs. 1220"),

                              ],
                            ),
                          );

                        }),
                    const  Divider(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0,top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DescriptionText(text: "Items Total"),
                          DescriptionText(text: "Rs.  10,34,343"),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DescriptionText(text: "Delivery Fee"),
                          DescriptionText(text: "Rs. 1220"),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DescriptionText(text: "GST on delivery fee"),
                          DescriptionText(text: "Rs. 1220"),

                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TitleText(text: "Total Bill"),
                        TitleText(text: "Rs. 10,35,563"),

                      ],
                    ),
                    const  Divider(
                      height: 32,
                    ),


                    TitleText(text: "Payment Summary"),
                    const SizedBox(height: 16,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DescriptionText(text: "Credit/Debit card"),
                        DescriptionText(text: "Rs. 1220"),

                      ],
                    ),
                    const SizedBox(height: 4,),
                    DescriptionText(text: "Completed",),
                    const SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DescriptionText(text: "Fuel Genie Credits"),
                        DescriptionText(text: "Rs. 1220"),

                      ],
                    ),
                    const SizedBox(height: 4,),
                    DescriptionText(text: "Completed"),

                  ],)),
                VerticalDivider(
                  width: 48,
                  color: appColors.greyColor,
                ),Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TitleText(text: "Delivery info"),
                    const SizedBox(height: 16,),
                    DescriptionText(text: "Delivery location"),
                    const SizedBox(height: 8,),
                    DescriptionText(text: "Apollo Hospitals Gachibowli, #123, Street, Main, Cross, Karnataka, Bengaluru, India"),
                    const SizedBox(height: 16,),
                    DescriptionText(text: "Delivery slot"),
                    const SizedBox(height: 8,),
                    DescriptionText(text: "15 Sep 2023 • Between 12pm to 3pm"),
                    const SizedBox(height: 24,),
                    const  Spacer(),

                  ],))
              ],
            ),
          )

        ],
      ),
    );
  }

}
