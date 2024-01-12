import 'package:admin_panel/components/widgets/color_btn.dart';
import 'package:admin_panel/components/widgets/text_btn.dart';
import 'package:flutter/material.dart';
import '../../presentation/dashboard_page.dart';
import '../../utils/text_utils.dart';
import '../widgets/toast_widget.dart';
class CancelOrderDialogBox extends StatefulWidget {
  const CancelOrderDialogBox({super.key});
  @override
  _CancelOrderDialogBoxState createState() => _CancelOrderDialogBoxState();
}
class _CancelOrderDialogBoxState extends State<CancelOrderDialogBox> {
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
          TextUtil(text: 'Are you sure want to Cancel the order: #123456789',size: 22,),
          const SizedBox(height: 24,),
          ColorBtn(title: "Cancel order", onTap: (){
            Navigator.pop(context);
            showSnackBar(context,"Order Cancelled");
          },color: appColors.redColor,),
          const SizedBox(height: 16,),
          TextBtn(title: "Cancel", onTap: (){
            Navigator.pop(context);
          })
        ],
      ),
    );
  }
}