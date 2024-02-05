import 'package:admin_panel/components/widgets/color_btn.dart';
import 'package:admin_panel/components/widgets/text_btn.dart';
import 'package:flutter/material.dart';
import '../../presentation/dashboard_page.dart';
import '../../utils/text_utils.dart';
import '../widgets/border_btn.dart';
import '../widgets/toast_widget.dart';
class DeleteDriverDialogBox extends StatefulWidget {
  const DeleteDriverDialogBox({super.key});
  @override
  _DeleteDriverDialogBoxState createState() => _DeleteDriverDialogBoxState();
}
class _DeleteDriverDialogBoxState extends State<DeleteDriverDialogBox> {
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
          const  TextUtil(text: 'Are you sure want to delete the Driver - Kiran',size: 22,),
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
                showSnackBar(context,"Driver Deleted");
              },color: appColors.redColor,),
            ],
          )
        ],
      ),
    );
  }
}