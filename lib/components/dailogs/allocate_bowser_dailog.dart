import 'package:admin_panel/components/widgets/bottons/border_btn.dart';
import 'package:admin_panel/components/widgets/bottons/color_btn.dart';
import 'package:admin_panel/components/widgets/bottons/text_btn.dart';
import 'package:admin_panel/utils/color_utils.dart';
import 'package:flutter/material.dart';

import '../../utils/text_utils.dart';
import '../widgets/toast_widget.dart';
class AllocateBowserDialogBox extends StatefulWidget {
  const AllocateBowserDialogBox({super.key});
  @override
  _AllocateBowserDialogBoxState createState() => _AllocateBowserDialogBoxState();
}
class _AllocateBowserDialogBoxState extends State<AllocateBowserDialogBox> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 584,
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
         const TextUtil(text: 'Allocate bowser',size: 24,),
          const SizedBox(height: 24,),
           Container(
            height: 80,
             decoration: BoxDecoration(
                 border: Border(bottom: BorderSide(color: AppColors().lightGreyColor))
             ),
            child: const Row(
              children: [
                   SizedBox(width: 40,),
                Expanded(child: TitleText(text: "Vehicle number",)),
                Expanded(child:  TitleText(text: "Location",),),
                Expanded(child: TitleText(text: "Fuel left",)),

              ],
            ),
          ),
         SizedBox(
           height: 320,
           child: ListView.builder(
             itemCount: 40,
               shrinkWrap: true,
               itemBuilder: (context,index){
             return  Container(
               height: 64,
               decoration: BoxDecoration(
                 border: Border(bottom: BorderSide(color: AppColors().lightGreyColor))
               ),
               child: GestureDetector(
                 onTap: (){
                   setState(() {
                     selectedIndex = index;
                   });
                 },
                 child: Row(
                   children: [
                     Radio(
                       value: index,
                       groupValue: selectedIndex,
                       onChanged: (value) {
                         setState(() {
                           selectedIndex = value!;
                         });
                       },
                     ),
                   const   SizedBox(width: 20,),
                  const    Expanded(child: DescriptionText(text: "123456789",)),
                   const   Expanded(child:  DescriptionText(text: "Madhapur",),),
                   const   Expanded(child: DescriptionText(text: "500/2400 Lt",)),

                   ],
                 ),
               ),
             );
           }),
         ),
         const  SizedBox(height: 24,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BorderBtn(title: "Close", onTap: (){
                Navigator.pop(context);
              },width: 150,),
             const  SizedBox(width: 16,),
              ColorBtn(title: "Allocate", onTap: (){
                Navigator.pop(context);
                showSnackBar(context,"Bowser Allocated");
              },width: 150,),

            ],
          )
        ],
      ),
    );
  }

}