
import 'package:admin_panel/components/widgets/bottons/border_btn.dart';
import 'package:admin_panel/components/widgets/bottons/text_btn.dart';
import 'package:admin_panel/utils/text_utils.dart';
import 'package:flutter/cupertino.dart';
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

class EditPermissionsDialogBox extends StatefulWidget {

  EditPermissionsDialogBox({super.key,});
  @override
  _EditPermissionsDialogBoxState createState() => _EditPermissionsDialogBoxState();
}

class _EditPermissionsDialogBoxState extends State<EditPermissionsDialogBox> {
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
                  width: 478,
                  height: 780,
                  padding: const  EdgeInsets.all(36),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:  bodyWidget()

              );
            }
        )
    );


  }





  Widget bodyWidget(){

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 16,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const  TextUtil(text: 'Edit role',size: 24,),
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

              Expanded(child:  TextUtil(text: "Status",weight: true,size: 16,),),


            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 100,
              itemBuilder: (context,index){
                return  Container(
                  height: 58,
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: appColors.lightGreyColor))
                  ),
                  child:  Row(
                    children: [
                      const   Expanded(child: DescriptionText(text: "Permissions",)),

                        Expanded(
                            child:  Align(
                          alignment: Alignment.centerLeft,
                          child:CupertinoSwitch(
                            activeColor: appColors.blueColor,
                              value: true, onChanged: (value){}))),

                    ],
                  ),
                );
              }),
        ),
          const SizedBox(height: 50,),
              Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              BorderBtn(
                  width: 200,
                  title: "Cancel", onTap: (){
                Navigator.pop(context);
              }),

              ColorBtn(title: "Save Edit",width: 200, onTap: (){
              Navigator.pop(context);
              showSnackBar(context,"Edit Successfully");
            },)]
        )
      ],
    );
  }

}
