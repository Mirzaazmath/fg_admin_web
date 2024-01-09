import 'package:admin_panel/components/widgets/color_btn.dart';
import 'package:flutter/material.dart';
import '../../utils/text_utils.dart';
class RefundInitiateDialogBox extends StatefulWidget {
  const RefundInitiateDialogBox({super.key});
  @override
  _RefundInitiateDialogBoxState createState() => _RefundInitiateDialogBoxState();
}
class _RefundInitiateDialogBoxState extends State<RefundInitiateDialogBox> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
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
          TextUtil(text: 'Initiate refund',size: 24,),
          const SizedBox(height: 24,),
          ListTile(
            leading: Radio(
              value: 1,
              groupValue: selectedIndex,
              onChanged: (value) {
                setState(() {
                  selectedIndex = value!;
                });
              },
            ),
            title: Text("Same payment method"),
            subtitle:Text("Rs. 1,43,900") ,
          ),
          ListTile(
            leading: Radio(
              value: 0,
              groupValue: selectedIndex,
              onChanged: (value) {
                setState(() {
                  selectedIndex = value!;
                });
              },
            ),
            title: Text("Same payment method"),
            subtitle:Text("Rs. 1,43,900") ,
          ),
          const SizedBox(height: 24,),
          ColorBtn(title: "Initiate refund", onTap: (){},),
          const SizedBox(height: 16,),

        ],
      ),
    );
  }

}