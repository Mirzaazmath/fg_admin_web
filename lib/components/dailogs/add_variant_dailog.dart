import 'dart:html';

import 'package:admin_panel/components/widgets/bottons/border_btn.dart';
import 'package:admin_panel/components/widgets/bottons/text_btn.dart';
import 'package:admin_panel/components/widgets/toast_widget.dart';
import 'package:admin_panel/presentation/dashboard_page.dart';
import 'package:admin_panel/utils/text_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/text_feild_utils.dart';


class AddVariantDialogBox extends StatefulWidget {
  VariantModel? variantData;
  Function(VariantModel data) onSave;
  Function(VariantModel data) onDelete;
  Function() onCancel;
  int index;
  bool isEdit;
   AddVariantDialogBox({super.key,required this.variantData,required this.isEdit,required this.index,required this.onSave,required this.onCancel,required this.onDelete});
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
    return Container(


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
                    children: [
                      valueField.isEmpty?const SizedBox():BorderBtn(
                        color: Colors.red,
                          width: 120,
                          title: "Delete", onTap:widget.isEdit?(){
                        widget.onDelete(widget.variantData!);

                      }:widget.onCancel,),






                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [TextBtn(
                              width: 100,
                              title: "Cancel",
                              onTap: widget.onCancel

                          ),
                            BorderBtn(
                                width: 120,
                                title: "Save", onTap: (){
                                  if(optionNameController.text==""){
                                    showSnackBar(context, "Please Enter Option Name");
                                  }else{

                                    if(_controllers.isEmpty){
                                      showSnackBar(context, "Please Add One Option");
                                    }else{
                                      for(int i=0;i<_controllers.length;i++){
                                        if(_controllers[i].text==""){
                                          showSnackBar(context, "Please Enter Value at Value$i");
                                        }else{
                                          values?.add(SubVariantModel(subtitle:_controllers[i].text ));

                                        }
                                      }
                                      final variant=VariantModel(title:optionNameController.text,values:values);
                                      widget.onSave(variant);
                                    }

                                  }





                              // final  returnObject=ReturnObject(variant: variant,index: widget.index,isEdit: widget.isEdit);
                              // Navigator.of(context).pop(returnObject);

                            })
                          ],
                        ),
                      )

                    ],
                  )

               ],
             )
             ,
           ),
            const SizedBox(height: 24,),
          ],
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

