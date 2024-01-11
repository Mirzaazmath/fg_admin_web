import 'package:admin_panel/components/widgets/color_btn.dart';
import 'package:admin_panel/components/widgets/text_btn.dart';
import 'package:flutter/material.dart';
import '../../presentation/dashboard_page.dart';
import '../../utils/text_utils.dart';
class DeleteProfileDialogBox extends StatefulWidget {
  const DeleteProfileDialogBox({super.key});
  @override
  _DeleteProfileDialogBoxState createState() => _DeleteProfileDialogBoxState();
}
class _DeleteProfileDialogBoxState extends State<DeleteProfileDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 484,
      padding: const  EdgeInsets.all(52),
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
          TextUtil(text: 'Are you sure want to delete the Kiran - sales profile',size: 22,),
          const SizedBox(height: 24,),
          ColorBtn(title: "Delete", onTap: (){},color: appColors.redColor,),
          const SizedBox(height: 16,),
          TextBtn(title: "Cancel", onTap: (){
            Navigator.pop(context);
          })
        ],
      ),
    );
  }
}