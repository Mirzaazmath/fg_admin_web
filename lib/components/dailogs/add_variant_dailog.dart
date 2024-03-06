import 'package:admin_panel/components/widgets/bottons/color_btn.dart';
import 'package:admin_panel/utils/text_utils.dart';
import 'package:flutter/material.dart';
import '../../utils/text_feild_utils.dart';
import '../widgets/toast_widget.dart';

class AddVariantDialogBox extends StatefulWidget {
  const AddVariantDialogBox({super.key});
  @override
  _AddVariantDialogBoxState createState() => _AddVariantDialogBoxState();
}
class _AddVariantDialogBoxState extends State<AddVariantDialogBox> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const   TextUtil(text: 'Add Bowser',size: 24,),
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon:const  Icon(Icons.close))
              ],
            ),
            const SizedBox(height: 24,),
            Field(controller: boswerNumberontroller, hintText: 'Bowser Number',),
            const SizedBox(height: 16,),
            Field(controller: loadCapacityController, hintText: 'Load Capacity',isNumberType: true,),
            const SizedBox(height: 16,),
            Field(controller: manufactureCompanyController, hintText: 'Manufacture Company',),
            const SizedBox(height: 16,),
            Field(controller: insuranceController, hintText: 'Insurance Details',),
            const SizedBox(height: 40,),
            ColorBtn(title: "Save Bowser", onTap: (){
              Navigator.pop(context);
              showSnackBar(context,"Bowser Added Successfully");
            })
          ],
        ),
      ),
    );
  }
}
