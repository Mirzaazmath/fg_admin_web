import 'package:admin_panel/components/widgets/bottons/border_btn.dart';
import 'package:admin_panel/components/widgets/toast_widget.dart';
import 'package:admin_panel/presentation/dashboard_page.dart';
import 'package:admin_panel/utils/text_utils.dart';
import 'package:flutter/material.dart';
import '../widgets/bottons/color_btn.dart';
import '../widgets/global_custom_dailog.dart';


class OrderDetailsDialogBox extends StatefulWidget {
  final String state;
  const OrderDetailsDialogBox({super.key,required this.state});
  @override
  _OrderDetailsDialogBoxState createState() => _OrderDetailsDialogBoxState();
}
class _OrderDetailsDialogBoxState extends State<OrderDetailsDialogBox> {
  @override
  Widget build(BuildContext context) {
    bool showMap=widget.state=="Truck allocated"||widget.state=="Out for delivery";
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        width:showMap?1170: 814,
        height: 740,
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

            Row(
              children: [
                const   TextUtil(text: 'Order: #123456789',size: 24,),
             const  SizedBox(width: 10,),
                Container(
                  width: 144,
                  height: 16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: widget.state=="Cancelled"?appColors.redColor:appColors.darkBlue
                  ),
                  alignment: Alignment.center,
                  child: TextUtil(text: widget.state,color: appColors.whiteColor,size: 11,),
                ),
              const  Spacer(),
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon:const  Icon( Icons.close))
              ],
            ),
            // const SizedBox(height: 24,),
            const Divider(
              height: 48,
            ),

            Expanded(
              child: Row(
                children: [
                  showMap?Expanded(child:Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const    TitleText(text: "Order Tracking",),
                            const SizedBox(height: 8,),
                            Expanded(
                              child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                   image: const DecorationImage(
                                     image: AssetImage("assets/images/map.png"),fit: BoxFit.fill
                                   )
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      VerticalDivider(
                        width: 48,
                        color: appColors.transparent,
                      ),
                    ],
                  )):const SizedBox(),
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
                    color: appColors.transparent,
                  ),
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const  TitleText(text: "Truck details"),
                      const SizedBox(height: 16,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DescriptionText(text: "Vehicle number"),
                          DescriptionText(text: "---"),

                        ],),
                      const SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DescriptionText(text: "Current ordres"),
                          DescriptionText(text: "---"),

                        ],),
                      const SizedBox(height: 16,),
                      const TitleText(text: "Driver details"),
                      const SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DescriptionText(text: "Driver Name"),
                          DescriptionText(text: "---"),

                        ],),
                      const SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DescriptionText(text: "Phone"),
                          DescriptionText(text: "---"),

                        ],),
                      const SizedBox(height: 24,),
                      const  TitleText(text: "Delivery info"),
                      const SizedBox(height: 16,),
                      const DescriptionText(text: "Delivery location"),
                      const SizedBox(height: 8,),
                      const DescriptionText(text: "Apollo Hospitals Gachibowli, #123, Street, Main, Cross, Karnataka, Bengaluru, India"),
                      const SizedBox(height: 16,),
                      const TitleText(text: "Delivery slot"),
                      const SizedBox(height: 8,),
                      const  DescriptionText(text: "15 Sep 2023 • Between 12pm to 3pm"),
                      const SizedBox(height: 24,),
                      const  Spacer(),

                    ],))
                ],
              ),
            ),
            widget.state=="Out for delivery"?const  SizedBox(height: 48,): const Divider(
              height: 48,
            ),
            btnRow(widget.state),
          ],
        ),
      ),
    );
  }

 Widget btnRow(String filter ){
    switch(filter){
      case "Confirmed":{
        return Row(
          children: [
            BorderBtn(width: 200,
                title: "Cancel order", onTap: (){
                  Navigator.pop(context);
                  showCustomDialog(context,"Cancel order");
                }),
            const  Spacer(),
            ColorBtn(
              width: 200,
              title: 'Allocate bowser',onTap: (){
              Navigator.pop(context);
              showCustomDialog(context,"Allocate bowser");
            },),
          ],
        );
      }
      case "Truck allocated":{
        return  BorderBtn(width: 200,
        title: "Cancel order", onTap: (){
    Navigator.pop(context);
    showCustomDialog(context,"Cancel order");
    });
      }
      case "Out for delivery":{
        return const  SizedBox();
      }
      case "Delivered":{
        return   Align(
          alignment: Alignment.centerRight,
          child: ColorBtn(width: 200,
              title: "Download Invoice", onTap: (){
                Navigator.pop(context);
                showSnackBar(context,"Download Successful");
              }),
        );
      }
      case "Cancelled":{
        return  Align(
          alignment: Alignment.centerRight,
          child: ColorBtn(width: 200,
              title: "Initiate refund", onTap: (){
                Navigator.pop(context);
                showCustomDialog(context,"Initiate refund");
              }),
        );
      }
      default :{
        return  Row(
          children: [
            BorderBtn(width: 200,
                title: "Cancel order", onTap: (){
                  Navigator.pop(context);
                  showCustomDialog(context,"Cancel order");
                }),
            const  Spacer(),
            BorderBtn(width: 300,
                title: "Allocate bowser", onTap: (){
                  Navigator.pop(context);
                  showCustomDialog(context,"Allocate bowser");
                }),
            const  SizedBox(width: 8,),
            ColorBtn(
              width: 200,
              title: 'Confirm Order',onTap: (){
              Navigator.pop(context);
              showSnackBar(context,"Order is confirmed");
            },),
          ],
        );
      }


    }
  }

}
