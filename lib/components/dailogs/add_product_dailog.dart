import 'package:admin_panel/components/widgets/bottons/border_btn.dart';
import 'package:admin_panel/components/widgets/bottons/color_btn.dart';
import 'package:admin_panel/components/widgets/bottons/text_btn.dart';
import 'package:admin_panel/utils/text_utils.dart';
import 'package:flutter/material.dart';
import '../../utils/drop_down_utils.dart';
import '../../utils/text_feild_utils.dart';
import '../widgets/global_custom_dailog.dart';
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
                 const  Divider(

                  ),
                   TextBtn(
                       width: 160,
                       title: "+ Add option", onTap: (){
                        //Add Variant
                     _showOrderDetailDialog();
                   }),

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
  _showOrderDetailDialog(){
    showDialog(context: context,
        barrierDismissible: true,
        builder: (BuildContext context){
          return const AddVariantDialogBox();
        }
    );

  }
}
