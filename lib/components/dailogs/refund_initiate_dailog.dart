import 'package:admin_panel/components/widgets/bottons/color_btn.dart';
import 'package:flutter/material.dart';
import '../../presentation/dashboard_page.dart';
import '../../utils/text_utils.dart';
import '../widgets/bottons/border_btn.dart';
import '../widgets/toast_widget.dart';
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
          const TextUtil(text: 'Initiate refund',size: 24,),
          const SizedBox(height: 24,),

          GestureDetector(
            onTap: (){
              selectedIndex=1;
            },
            child: ListTile(

              leading: Radio(
                value: 1,
                groupValue: selectedIndex,
                onChanged: (value) {
                  setState(() {
                    selectedIndex = value!;
                  });
                },
              ),
              title: const Text("Same payment method"),
              subtitle:const Text("Rs. 1,43,900") ,
            ),
          ),
          GestureDetector(
            onTap: (){
              selectedIndex=0;
            },
            child: ListTile(

              leading: Radio(
                value: 0,
                groupValue: selectedIndex,
                onChanged: (value) {
                  setState(() {
                    selectedIndex = value!;
                  });
                },
              ),
              title:const  Text("Same payment method"),
              subtitle:const  Text("Rs. 1,43,900") ,
            ),
          ),
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
                  title: "Refund Initiate", onTap: (){
                  Navigator.pop(context);
                  showSnackBar(context,"Refund Initiate to customer");

                },),
              ),
            ],
          ),

          const SizedBox(height: 16,),

        ],
      ),
    );
  }

}