import 'package:admin_panel/components/widgets/bottons/color_btn.dart';
import 'package:admin_panel/components/widgets/bottons/text_btn.dart';
import 'package:flutter/material.dart';
import '../../presentation/dashboard_page.dart';
import '../../utils/text_utils.dart';
import '../widgets/bottons/border_btn.dart';
import '../widgets/toast_widget.dart';
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
          const  TextUtil(text: 'Are you sure want to delete the Kiran - sales profile',size: 22,),
          const SizedBox(height: 24,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BorderBtn(
                  width: 150,
                  title: "Cancel", onTap: (){
                Navigator.pop(context);
              }),
              const SizedBox(width: 16,),
              ColorBtn(
                width: 150,
                title: "Delete", onTap: (){
                Navigator.pop(context);
                showSnackBar(context,"Profile Deleted");
              },color: appColors.redColor,),
            ],
          )
          // ColorBtn(title: "Delete", onTap: (){},color: appColors.redColor,),
          // const SizedBox(height: 16,),
          // TextBtn(title: "Cancel", onTap: (){
          //   Navigator.pop(context);
          // })
        ],
      ),
    );
  }
}