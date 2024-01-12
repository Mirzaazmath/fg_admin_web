import 'package:admin_panel/components/widgets/color_btn.dart';
import 'package:admin_panel/utils/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/dialog_provider.dart';
import '../../utils/text_feild_utils.dart';
import '../widgets/toast_widget.dart';

class ViewBowserDetailDialogBox extends StatefulWidget {
  bool isEdit;
   ViewBowserDetailDialogBox({super.key,required this.isEdit});
  @override
  _ViewBowserDetailDialogBoxState createState() => _ViewBowserDetailDialogBoxState();
}
class _ViewBowserDetailDialogBoxState extends State<ViewBowserDetailDialogBox> {
  TextEditingController boswerNumberontroller=TextEditingController();
  TextEditingController loadCapacityController=TextEditingController();
  TextEditingController manufactureCompanyController=TextEditingController();
  TextEditingController insuranceController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          width: 484,
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
              TextUtil(text: widget.isEdit?"Edit Bowser":'Bowser Details',size: 24,),
              const SizedBox(height: 24,),
              Field(controller: boswerNumberontroller, hintText: 'Bowser Number',),
              const SizedBox(height: 16,),
              Field(controller: loadCapacityController, hintText: 'Load Capacity',isNumberType: true,),
              const SizedBox(height: 16,),
              Field(controller: manufactureCompanyController, hintText: 'Manufacture Company',),
              const SizedBox(height: 16,),
              Field(controller: insuranceController, hintText: 'Insurance Details',),
              const SizedBox(height: 40,),
              widget.isEdit?  ColorBtn(title: "Save Edit", onTap: (){
                Navigator.pop(context);
                showSnackBar(context,"Edit Successfully");
              }):const  SizedBox(),
            ],
          ),
        )
    );

  }
}
