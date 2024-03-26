import 'package:admin_panel/components/widgets/bottons/color_btn.dart';
import 'package:admin_panel/components/widgets/toast_widget.dart';
import 'package:flutter/material.dart';

import '../../utils/text_feild_utils.dart';
import '../../utils/text_utils.dart';
import '../widgets/bottons/border_btn.dart';

class AddCategoryDialogBox extends StatefulWidget {
  const AddCategoryDialogBox({super.key});
  @override
  _AddCategoryDialogBoxState createState() => _AddCategoryDialogBoxState();
}
class _AddCategoryDialogBoxState extends State<AddCategoryDialogBox> {
  TextEditingController productTypeController=TextEditingController();

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
                const   TextUtil(text: 'Add Category',size: 24,),
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon:const  Icon(Icons.close))
              ],
            ),
            const SizedBox(height: 24,),
            Field(controller: productTypeController, hintText: 'Product Type',),
            const SizedBox(height: 24,),


            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: BorderBtn(
                      title: "Close", onTap: (){
                    Navigator.pop(context);
                  }),
                ),
                const SizedBox(width: 16,),
                Expanded(
                  child: ColorBtn(
                    title: "Save", onTap: (){
                      if(productTypeController.text==""){
                        showSnackBar(context, "Enter Product Category");
                      }else{
                        Navigator.pop(context,productTypeController.text);
                      }



                  },),
                ),
              ],
            ),

            const SizedBox(height: 16,),

          ],
        ),
      ),
    );
  }

}