import 'package:admin_panel/components/widgets/color_btn.dart';
import 'package:admin_panel/components/widgets/text_btn.dart';
import 'package:admin_panel/utils/color_utils.dart';
import 'package:flutter/material.dart';

import '../../presentation/dashboard_page.dart';
import '../../utils/text_utils.dart';
import '../widgets/toast_widget.dart';
class AllocateDriverDialogBox extends StatefulWidget {
  const AllocateDriverDialogBox({super.key});
  @override
  _AllocateDriverDialogBoxState createState() => _AllocateDriverDialogBoxState();
}
class _AllocateDriverDialogBoxState extends State<AllocateDriverDialogBox> {
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
         const  TextUtil(text: 'Allocate Driver',size: 24,),
          const SizedBox(height: 24,),
          Container(
            height: 80,
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: AppColors().lightGreyColor))
            ),
            child:const  Row(
              children: [
                   SizedBox(width: 40,),
                Expanded(child: TitleText(text: "Name",)),
                Expanded(child:  TitleText(text: "Status",),),
                Expanded(child: TitleText(text: "Out of office",)),

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
                          if(index.isEven){
                            selectedIndex=null;
                          }else{
                            selectedIndex = index;
                          }

                        });
                      },
                      child: Row(
                        children: [
                          Radio(

                            value: index,
                            groupValue: selectedIndex,
                            onChanged: (value) {
                              // setState(() {
                              //
                              //   selectedIndex = value!;
                              // });
                            },
                          ),
                          const   SizedBox(width: 20,),
                          Expanded(child: DescriptionText(text: "Kiran Naik",color: index.isEven?appColors.greyColor.withOpacity(0.3):appColors.blackColor,)),
                          Expanded(child:   Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 64,
                              height: 20,
                              alignment:Alignment.center,
                              decoration: BoxDecoration(
                                  color:index.isEven?appColors.redColor: appColors.blueColor,
                                  borderRadius: BorderRadius.circular(100)

                              ),
                              child: TextUtil(text:index.isEven?"Inactive":"Active",color: appColors.whiteColor,size: 11,),
                            ),
                          ),),
                          Expanded(child: DescriptionText(text: index.isEven?"Yes":"No",)),

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
              TextBtn(title: "Cancel", onTap: (){
                Navigator.pop(context);
              },width: 150,),
              ColorBtn(title: "Allocate", onTap: (){
                Navigator.pop(context);
                showSnackBar(context,"Driver Allocated");
              },width: 150,),

            ],
          )
        ],
      ),
    );
  }

}