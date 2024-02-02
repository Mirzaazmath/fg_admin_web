import 'package:admin_panel/components/widgets/color_btn.dart';
import 'package:flutter/material.dart';
import '../../presentation/dashboard_page.dart';
import '../../utils/text_utils.dart';
import '../widgets/border_btn.dart';
import '../widgets/toast_widget.dart';
class DeleteBowserDialogBox extends StatefulWidget {
  const DeleteBowserDialogBox({super.key});
  @override
  _DeleteBowserDialogBoxState createState() => _DeleteBowserDialogBoxState();
}
class _DeleteBowserDialogBoxState extends State<DeleteBowserDialogBox> {
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
          TextUtil(text: 'Are you sure want to delete the Bowser - Kiran',size: 22,),
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
                showSnackBar(context,"Bowser Deleted");
              },color: appColors.redColor,),
            ],
          )

        ],
      ),
    );
  }
}