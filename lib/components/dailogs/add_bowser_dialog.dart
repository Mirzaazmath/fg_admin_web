import 'package:admin_panel/pages/dashboard_page.dart';
import 'package:admin_panel/utils/text_utils.dart';
import 'package:flutter/material.dart';
import '../../utils/text_feild_utils.dart';


// CUSTOM DAILOG CLASS
class AddBowserDialogBox extends StatefulWidget {

  const AddBowserDialogBox({super.key});



  @override
  _AddBowserDialogBoxBoxState createState() => _AddBowserDialogBoxBoxState();
}

class _AddBowserDialogBoxBoxState extends State<AddBowserDialogBox> {
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
      child: contentBox(context),
    );
  }
  contentBox(context){

    return Container(
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
          TextUtil(text: 'Add Bowser',size: 24,),
          const SizedBox(height: 24,),
          Field(controller: boswerNumberontroller, hintText: 'Bowser Number',),
          const SizedBox(height: 16,),
          Field(controller: loadCapacityController, hintText: 'Load Capacity',isNumberType: true,),
          const SizedBox(height: 16,),
          Field(controller: manufactureCompanyController, hintText: 'Manufacture Company',),
          const SizedBox(height: 16,),
          Field(controller: insuranceController, hintText: 'Insurance Details',),
          const SizedBox(height: 40,),
          Align(
            alignment: Alignment.center,
            child:GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30), color: appColors.darkBlue
                  ),
                  alignment: Alignment.center,
                  child: TextUtil(text:"Save Bowser",color: Colors.white,size: 14,)

              ),
            ),

          )
        ],
      ),
    );
  }
}
