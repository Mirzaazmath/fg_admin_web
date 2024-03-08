import 'package:admin_panel/components/widgets/bottons/border_btn.dart';
import 'package:admin_panel/components/widgets/bottons/color_btn.dart';
import 'package:admin_panel/components/widgets/bottons/text_btn.dart';
import 'package:admin_panel/presentation/dashboard_page.dart';
import 'package:admin_panel/utils/text_utils.dart';
import 'package:flutter/material.dart';
import '../../utils/drop_down_utils.dart';
import '../../utils/text_feild_utils.dart';

import '../widgets/toast_widget.dart';
import 'add_variant_dailog.dart';

class AddProductDialogBox extends StatefulWidget {
  const AddProductDialogBox({super.key});
  @override
  _AddProductDialogBoxState createState() => _AddProductDialogBoxState();
}
class _AddProductDialogBoxState extends State<AddProductDialogBox> {
  TextEditingController productNameController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  TextEditingController priceController=TextEditingController();
  TextEditingController comparePriceController=TextEditingController();
  TextEditingController quantityController=TextEditingController();
  TextEditingController skuController=TextEditingController();
  List<String> unitList = <String>['1L', '2L', '3L', '4L',"5L","10L","20L"];
  String selectedUnit = "1L";
  VariantModel? variantData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1100,
      height: 1050,
      padding: const  EdgeInsets.all(36),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const   TextUtil(text: 'Add Products',size: 24,),
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon:const  Icon(Icons.close))
            ],
          ),
         const  Divider(),
       Expanded(child:    Row(
           children: [
             Expanded(child:  SingleChildScrollView(
               child: Column(

                 mainAxisSize: MainAxisSize.min,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   const SizedBox(height: 16,),
                   const  TitleText(text: "Product name"),
                   const SizedBox(height: 24,),
                   Field(controller: productNameController, hintText: 'Product name',),
                   const SizedBox(height: 16,),
                   Field(controller: descriptionController, hintText: 'Description',maxLine: 5,),
                   const SizedBox(height: 24,),
                   const  TitleText(text: "Pricing"),
                   const SizedBox(height: 16,),
                   Row(
                     children: [
                       Expanded(child: Field(controller: priceController, hintText: 'Price',isNumberType: true,)),
                       const  SizedBox(width: 16,),
                       Expanded(child: Field(controller: comparePriceController, hintText: 'Compare-at price',isNumberType: true,)),
                     ],
                   ),
                   const SizedBox(height: 24,),
                   const  TitleText(text: "Inventory"),
                   const SizedBox(height: 16,),
                   Row(
                     children: [
                       Expanded(child: Field(controller:quantityController, hintText: 'Quantity',isNumberType: true,)),
                       const  SizedBox(width: 16,),
                       Expanded(
                           child: DropField(selectValue: selectedUnit, valueList: unitList, onChange: (String value) {
                             setState(() {selectedUnit=value;
                             });
                           },)

                       ),
                     ],
                   ),
                   const SizedBox(height: 16,),
                   Field(controller: skuController, hintText: 'SKU(Stock Keeping Unit)',isNumberType: true,),
                   const SizedBox(height: 24,),
                   const  TitleText(text: "Media(Multiple)"),
                   const SizedBox(height: 16,),
                   BorderBtn(
                       width: 160,
                       title: "Upload", onTap: (){}),
                   const SizedBox(height: 24,),

                   const  TitleText(text: "Variants"),
                   const SizedBox(height: 16,),
                   variantData==null?const SizedBox():Container(
                     padding:const  EdgeInsets.all(16),

                   decoration: BoxDecoration(
                     border: Border.all(),
                     borderRadius: BorderRadius.circular(16),
                   ),
                   child: Column(
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           DescriptionText(text: variantData!.title),
                           TextBtn(
                             width: 100,
                               title: "Edit", onTap: (){

                           }),


                         ],
                       ),
                       const  SizedBox(height: 24,),
                       Wrap(
                        runSpacing: 10,
                         children: [
                           for(int i=0;i<variantData!.values!.length;i++)
                             Padding(
                               padding: const EdgeInsets.only(right: 10),
                               child: Chip(
                                 backgroundColor: appColors.chipColor,
                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                   label:Text(variantData!.values![i].subtitle) ),
                             )

                         ],
                       )
                     ],

                     
                   ),),
                 const  Divider(
                   height: 48,

                  ),
                   TextBtn(
                       width: 160,
                       title: "+ Add option", onTap: (){
                        //Add Variant
                     _showOrderDetailDialog();
                   }),
                   const SizedBox(height: 24,),

                   const  TitleText(text: "Variant List"),
                   const SizedBox(height: 24,),
                    Row(
                     children: [
                       Expanded(
                         flex:2,
                           child:  DescriptionText (text: "Variant",color: appColors.blackColor,)),
                       Expanded(
                           flex:1,
                           child:  DescriptionText (text: "Price",color: appColors.blackColor)),
                       Expanded(
                           flex:1,
                           child:  DescriptionText (text: "Available",color: appColors.blackColor)),
                     ],
                   ),
                   const Divider(
                     height: 32,
                   ),
                   Container(
                     height: 88,
                     padding: const EdgeInsets.symmetric(vertical: 10),
                     decoration: BoxDecoration(
                       border: Border(bottom: BorderSide(color: appColors.lightGreyColor))
                     ),
                     child:  Row(
                       children: [
                         Expanded(
                             flex:2,
                             child: ListTile(
                               contentPadding: EdgeInsets.zero,
                               leading:Container(
                                 height: 56,
                                 width: 56,
                                 color: appColors.lightGreyColor,
                               ) ,
                               title: DescriptionText (text: "Large",color: appColors.blackColor),
                               subtitle:DescriptionText (text: "Variant",color: appColors.blueColor),
                             ),


                             ),
                         Expanded(
                             flex:1,
                             child:  Padding(
                               padding:const  EdgeInsets.only(right: 10,),
                               child:Field(controller: skuController, hintText: '',)),
                             ),
                         Expanded(
                           flex:1,
                           child:  Padding(
                               padding:const  EdgeInsets.only(left: 10,),
                               child:Field(controller: skuController, hintText: '',)),
                         )
                       ],
                     ),
                     ),


                   const SizedBox(height: 40,),
                   ColorBtn(title: "Save Bowser", onTap: (){
                     Navigator.pop(context);
                     showSnackBar(context,"Bowser Added Successfully");
                   })
                 ],
               ),
             ),),
             const  SizedBox(width: 48,),


             ///////////  Second Section//////
             Expanded(child:  Column(

               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.start,
               children: <Widget>[ const SizedBox(height: 16,),
                 const  TitleText(text: "Pricing"),
                 const SizedBox(height: 16,),
                 Row(
                   children: [
                     Expanded(child: Field(controller: priceController, hintText: 'Price',isNumberType: true,)),
                     const  SizedBox(width: 16,),
                     Expanded(child: Field(controller: comparePriceController, hintText: 'Compare-at price',isNumberType: true,)),
                   ],
                 ),



               ],
             ),)

           ]
       ),),
         const  Divider(
            height: 48,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BorderBtn(
                width: 100,
                  title: "Cancel", onTap: (){
                Navigator.pop(context);
              }),
              ColorBtn(
                width: 150,
                  title: "Save", onTap: (){

              })

            ],
          )
        ],
      ),
    );
  }
  _showOrderDetailDialog()async{
   final dynamic variant= await  showDialog(context: context,
        barrierDismissible: true,
        builder: (BuildContext context){
          return const AddVariantDialogBox();
        }

    );
   if(variant==null){

   }else{
     setState(() {
       variantData=variant;
     });
     print(variantData?.title);
   }

  }
}
