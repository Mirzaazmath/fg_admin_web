import 'package:admin_panel/components/widgets/bottons/border_btn.dart';
import 'package:admin_panel/components/widgets/bottons/text_btn.dart';
import 'package:admin_panel/components/widgets/toast_widget.dart';
import 'package:admin_panel/presentation/dashboard_page.dart';
import 'package:admin_panel/utils/text_utils.dart';
import 'package:flutter/material.dart';
import '../../utils/text_feild_utils.dart';


class AddVariantDialogBox extends StatefulWidget {
  VariantModel? variantData;
  int index;
  bool isEdit;
   AddVariantDialogBox({super.key,required this.variantData,required this.isEdit,required this.index});
  @override
  _AddVariantDialogBoxState createState() => _AddVariantDialogBoxState();
}
class _AddVariantDialogBoxState extends State<AddVariantDialogBox> {
  TextEditingController optionNameController=TextEditingController();
  List<TextEditingController> _controllers = [];
  List<Field>valueField=[];
  List<SubVariantModel>?values=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.isEdit){
      optionNameController.text=widget.variantData!.title;
      for(int i =0;i<widget.variantData!.values!.length;i++){
        final controller = TextEditingController(text: widget.variantData!.values![i].subtitle);
        final field =  Field(controller: controller, hintText: "",);
        _controllers.add(controller);
        valueField.add(field);
      }
    }
  }
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
        padding: const  EdgeInsets.all(26),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const   TextUtil(text: 'Variants',size: 16,),
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon:const  Icon(Icons.close))
              ],
            ),
            const SizedBox(height: 24,),
           Container(
             padding: const EdgeInsets.all(16),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(16),
               border: Border.all()
             ),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [

                const  DescriptionText(text: 'Option name'),
               const   SizedBox(height: 8,),
                 Field(controller: optionNameController, hintText: 'Option Name',),
                 const SizedBox(height: 16,),
                 const  DescriptionText(text: 'Option values'),
                 const   SizedBox(height: 8,),
               ListView.builder(
                   shrinkWrap: true,
                   itemCount:valueField.length,
                   itemBuilder: (context,index){
                   return Padding(
                     padding: const EdgeInsets.only(bottom: 8),
                     child: Row(
                       children: [
                         Expanded(child: valueField[index]),
                         const SizedBox(width: 16,),
                         IconButton(onPressed: (){

                           setState(() {
                             _controllers.removeAt(index);
                             valueField.removeAt(index);
                           });
                         }, icon: Icon(Icons.delete_outline,color: appColors.redColor,)),
                       ],
                     ),
                   );

               }),
               TextBtn(
                 width: 120,
                   title: "+ Add Value", onTap: (){
                 final controller = TextEditingController();
                 final field =  Field(controller: controller, hintText: "Enter value",);
                 setState(() {
                   _controllers.add(controller);
                   valueField.add(field);
                 });

               }),
                 const SizedBox(height: 16,),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [TextBtn(
                    width: 100,
                      title: "Cancel", onTap: (){
                      Navigator.pop(context);
                  }),
                    BorderBtn(
                      width: 120,
                        title: "Save", onTap: (){
                        for(int i=0;i<_controllers.length;i++){
                          if(_controllers[i].text==""){
                            showSnackBar(context, "Please Enter Value at Value$i");
                          }else{
                            values?.add(SubVariantModel(subtitle:_controllers[i].text ));

                          }
                        }

                        final variant=VariantModel(title:optionNameController.text,values:values);
                        final  returnObject=ReturnObject(variant: variant,index: widget.index,isEdit: widget.isEdit);
                       Navigator.of(context).pop(returnObject);

                    })
                  ],
                )
               ],
             )
             ,
           )
          ],
        ),
      ),
    );
  }
}
class ReturnObject{
  final int index;
  final bool isEdit;
  final VariantModel variant;
  ReturnObject({required this.variant,required this.index,required this.isEdit});

}
class VariantModel{
  final String title;
  final List<SubVariantModel>? values;
  VariantModel({required this.title,this.values});
}
class SubVariantModel{
  final String subtitle;
  final List<String>?subVariant;
  SubVariantModel({required this.subtitle,this.subVariant});
}

