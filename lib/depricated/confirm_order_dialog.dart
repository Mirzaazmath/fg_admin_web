import 'package:admin_panel/components/widgets/bottons/border_btn.dart';
import 'package:admin_panel/components/widgets/toast_widget.dart';
import 'package:admin_panel/presentation/dashboard_page.dart';
import 'package:admin_panel/utils/text_utils.dart';
import 'package:flutter/material.dart';
import '../components/widgets/bottons/color_btn.dart';
import '../components/widgets/global_custom_dailog.dart';
import '../components/widgets/bottons/text_btn.dart';

class ConfirmOrderDialogBox extends StatefulWidget {
  const ConfirmOrderDialogBox({super.key});
  @override
  _ConfirmOrderDialogBoxState createState() => _ConfirmOrderDialogBoxState();
}
class _ConfirmOrderDialogBoxState extends State<ConfirmOrderDialogBox> {
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const   TextUtil(text: 'Order: #123456789',size: 24,),
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon:const  Icon( Icons.close))
          ],
        ),
          const SizedBox(height: 24,),
          Expanded(
            child: Row(
              children: [
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
               const    TitleText(text: "Order items",),
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
                             const  DescriptionText(text: "Rs. 1220"),
            
                            ],
                          ),
                        );
            
                      }),
                  const  Divider(),
                 const  Padding(
                    padding:  EdgeInsets.only(bottom: 8.0,top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DescriptionText(text: "Items Total"),
                        DescriptionText(text: "Rs.  10,34,343"),
            
                      ],
                    ),
                  ),
                    const   Padding(
                    padding:  EdgeInsets.only(bottom: 8.0,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DescriptionText(text: "Delivery Fee"),
                        DescriptionText(text: "Rs. 1220"),
            
                      ],
                    ),
                  ),
                    const   Padding(
                    padding:  EdgeInsets.only(bottom: 16,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DescriptionText(text: "GST on delivery fee"),
                        DescriptionText(text: "Rs. 1220"),
            
                      ],
                    ),
                  ),
                    const  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitleText(text: "Total Bill"),
                      TitleText(text: "Rs. 10,35,563"),
            
                    ],
                  ),
                  const  Divider(
                    height: 32,
                  ),


                    const    TitleText(text: "Payment Summary"),
                  const SizedBox(height: 16,),
                    const     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DescriptionText(text: "Credit/Debit card"),
                        DescriptionText(text: "Rs. 1220"),
            
                      ],
                    ),
                  const SizedBox(height: 4,),
                    const    DescriptionText(text: "Completed",),
                  const SizedBox(height: 8,),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DescriptionText(text: "Fuel Genie Credits"),
                        DescriptionText(text: "Rs. 1220"),
            
                      ],
                    ),
                  const SizedBox(height: 4,),
                    const  DescriptionText(text: "Completed"),
            
                ],)),
                VerticalDivider(
                  width: 48,
                  color: appColors.greyColor,
                ),Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [const  TitleText(text: "Delivery info"),
                  const SizedBox(height: 16,),
                    const DescriptionText(text: "Delivery location"),
                  const SizedBox(height: 8,),
                    const DescriptionText(text: "Apollo Hospitals Gachibowli, #123, Street, Main, Cross, Karnataka, Bengaluru, India"),
                  const SizedBox(height: 16,),
                    const DescriptionText(text: "Delivery slot"),
                  const SizedBox(height: 8,),
                    const  DescriptionText(text: "15 Sep 2023 • Between 12pm to 3pm"),
                  const SizedBox(height: 24,),
                 const  Spacer(),
                  ColorBtn(title: 'Confirm Order',onTap: (){
                    Navigator.pop(context);
                    showSnackBar(context,"Order is confirmed");
                  },),
                  const  SizedBox(height: 8,),
                  BorderBtn(title: "Allocate bowser", onTap: (){
                    Navigator.pop(context);
                    showCustomDialog(context,"Allocate bowser");
                  }),
                  const  SizedBox(height: 8,),
                  TextBtn(title: 'Cancel Order',onTap: (){
                    Navigator.pop(context);
                    showCustomDialog(context,"Cancel order");
                  }),
            
                ],))
              ],
            ),
          )

        ],
      ),
    );
  }

}
