
import 'package:admin_panel/components/widgets/bottons/border_btn.dart';
import 'package:admin_panel/components/widgets/bottons/text_btn.dart';
import 'package:admin_panel/utils/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/menu_model.dart';
import '../../presentation/customer_page.dart';
import '../../presentation/dashboard_page.dart';
import '../../provider/dialog_provider.dart';
import '../../utils/text_feild_utils.dart';
import '../widgets/bottons/color_btn.dart';
import '../widgets/global_custom_dailog.dart';
import '../widgets/toast_widget.dart';

class ViewRoleDetailDialogBox extends StatefulWidget {

  ViewRoleDetailDialogBox({super.key,});
  @override
  _ViewRoleDetailDialogBoxState createState() => _ViewRoleDetailDialogBoxState();
}

class _ViewRoleDetailDialogBoxState extends State<ViewRoleDetailDialogBox> {






  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Consumer<DialogProvider>(
            builder: (BuildContext context, provider, Widget? child) {
              return Container(
                width: 777,
                padding: const  EdgeInsets.all(36),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child:  orderHistoryInfo()

              );
            }
        )
    );


  }





  Widget orderHistoryInfo(){

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 16,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           const  TextUtil(text: 'Admin role',size: 24,),
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon:const  Icon(Icons.close))
          ],
        ),

        const SizedBox(height: 24,),
        Container(
          height: 58,
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: appColors.lightGreyColor))
          ),
          child:const Row(
            children: [
              Expanded(child: TextUtil(text: "Permission",weight: true,size: 16,)),
              Expanded(child: TextUtil(text: "Des",weight: true,size: 16,)),
              Expanded(child:  TextUtil(text: "Status",weight: true,size: 16,),),
             

            ],
          ),
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 100,
              itemBuilder: (context,index){
                return  Container(
                  height: 58,
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: appColors.lightGreyColor))
                  ),
                  child: Row(
                    children: [
                      const  Expanded(child: DescriptionText(text: "Permissions",)),
                      const  Expanded(child:  DescriptionText(text: "Description",),),
                      const  Expanded(child:  Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(Icons.check_circle_outline))),
                     
                    ],
                  ),
                );
              }),
        ),

        // Align(
        //     alignment: Alignment.centerRight,
        //     child: ColorBtn(title: "Save Edit",width: 200, onTap: (){
        //       Navigator.pop(context);
        //       showSnackBar(context,"Edit Successfully");
        //     },)): const  SizedBox(),
      ],
    );
  }

}
