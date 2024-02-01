
import 'package:admin_panel/components/widgets/border_btn.dart';
import 'package:admin_panel/components/widgets/text_btn.dart';
import 'package:admin_panel/utils/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../presentation/dashboard_page.dart';
import '../../provider/dialog_provider.dart';
import '../../utils/text_feild_utils.dart';
import '../widgets/color_btn.dart';
import '../widgets/global_custom_dailog.dart';
import '../widgets/toast_widget.dart';

class ViewCustomerDetailDialogBox extends StatefulWidget {
  bool isEdit;
   ViewCustomerDetailDialogBox({super.key,required this.isEdit});
  @override
  _ViewCustomerDetailDialogBoxState createState() => _ViewCustomerDetailDialogBoxState();
}

class _ViewCustomerDetailDialogBoxState extends State<ViewCustomerDetailDialogBox> {

  List<String>optionList=["Personal info","Business profile","Delivery location","Order history"];
  int selectedOption=0;
  TextEditingController firstNameController=TextEditingController(text: "Kiran");
  TextEditingController lastNameController=TextEditingController(text: "Naik");
  TextEditingController mobileController=TextEditingController(text: "9876543210");
  TextEditingController emailController=TextEditingController(text: "kiran@gmail.com");
  TextEditingController companyNameController=TextEditingController(text: "Apollo Hospitals");
  TextEditingController legalNameController=TextEditingController(text: "Apollo Hospitals Private Limited");
  TextEditingController cinController=TextEditingController(text: "LA234LKSJS");
  TextEditingController gstinController=TextEditingController(text: "OIER8743SS");
  TextEditingController companyPanController=TextEditingController(text: "CHKH882733");



  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Consumer<DialogProvider>(
            builder: (BuildContext context, provider, Widget? child) {
              return Container(
                width: 777,
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
                    TextUtil(text: 'Custom ID: #123456',size: 24,),
                    const SizedBox(height: 24,),
                    Container(height: 48,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor
                      ),
                      child: Row(
                        children: [
                          for(int i =0; i<optionList.length;i++)...[
                            widget.isEdit && i==3?const SizedBox():   Expanded(child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  selectedOption=i;
                                });
                              },
                              child: Container(
                                height: 48,
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: selectedOption==i?appColors.blueColor:Colors.transparent,width: 2))
                                ),
                                alignment: Alignment.center,
                                child: DescriptionText(text: optionList[i],),

                              ),
                            ))
                          ]
                        ],
                      ),
                    ),
                    const SizedBox(height: 24,),
                    detailBody(selectedOption)

                  ],
                ),
              );
            }
        )
    );


  }

  Widget detailBody(int index){
    switch(index){
      case 0:
        return personalInfo();
      case 1:
        return businessInfo();
      case 2:
        return locationInfo();
      case 3:
        return orderHistoryInfo();

      default: {
        return Container(
          width: 484,
          padding: const  EdgeInsets.all(36),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
        );
      }
    }
  }
  Widget personalInfo(){
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Field(controller: firstNameController, hintText: 'First Name',isEnable: !widget.isEdit,)),
            const SizedBox(width: 16,),
            Expanded(child: Field(controller: lastNameController, hintText: 'Last Name',isEnable: !widget.isEdit,)),
          ],
        ),
        const SizedBox(height: 24,),
        Field(controller: mobileController, hintText: 'Mobile Number',isNumberType: true,isEnable: !widget.isEdit,),
        const SizedBox(height: 16,),
        Field(controller: emailController, hintText: 'Email Address',isEnable: !widget.isEdit,),
        const SizedBox(height: 16,),

        widget.isEdit? Align(
          alignment: Alignment.centerRight,
            child: ColorBtn(title: "Save Edit",width: 200, onTap: (){
              Navigator.pop(context);
              showSnackBar(context,"Edit Successfully");
            },)): const  SizedBox(),
      ],
    );
  }
  Widget businessInfo(){
    return Column(
      children: [
      Field(controller: companyNameController, hintText: "Company Name",isEnable: !widget.isEdit,),
        const SizedBox(height: 16,),
        Field(controller: legalNameController, hintText: 'Legal Name',isEnable: !widget.isEdit,),
        const SizedBox(height: 16,),
        Row(
          children: [
            Expanded(child: Field(controller: cinController, hintText: "CIN",isEnable: !widget.isEdit,),),
          const   SizedBox(width: 16,),
            Expanded(child: Field(controller: gstinController, hintText: 'GSTIN',isEnable: !widget.isEdit,)),

          ],
        ),
        const SizedBox(height: 16,),
        Field(controller: companyPanController, hintText: 'Company PAN',isEnable: !widget.isEdit,),
        const SizedBox(height: 16,),

        widget.isEdit? Align(
            alignment: Alignment.centerRight,
            child: ColorBtn(title: "Save Edit",width: 200, onTap: (){
              Navigator.pop(context);
              showSnackBar(context,"Edit Successfully");
            },)): const  SizedBox(),
      ],
    );
  }
  Widget locationInfo(){
    return Column(
      children: [
     ListView.builder(
       itemCount: 3,
         shrinkWrap: true,
         itemBuilder: (context,index){
       return  Container(
         height:  widget.isEdit?156: 100,
         margin: const EdgeInsets.only(bottom: 16),
         padding: const EdgeInsets.all(16),
         decoration: BoxDecoration(
             color: Theme.of(context).primaryColor,
             borderRadius: BorderRadius.circular(12)
         ),
         child: Row(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             const  Icon(Icons.location_on_outlined),
             const  SizedBox(width: 16,),
             Expanded(child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Row(
                   children: [
                     TitleText(text: "Gachibowli Hospital"),
                    index==0? Container(
                      margin:const  EdgeInsets.only(left: 10),
                       width: 50,
                       height: 16,
                       alignment:Alignment.center,
                       decoration: BoxDecoration(
                           color: appColors.blueColor,
                           borderRadius: BorderRadius.circular(100)

                       ),
                       child: TextUtil(text: "Default",color: appColors.whiteColor,size: 11,),
                     ):const SizedBox()
                   ],
                 ),
                 const  SizedBox(height: 4,),
                 DescriptionText(text: "Apollo Hospitals Gachibowli, #123, Street, Main, Cross, Karnataka, Bengaluru, India"),
                 widget.isEdit?Container(
                   margin:const  EdgeInsets.only(top: 16),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       TextBtn(title: "Delete", onTap: (){},width: 100,color: Colors.transparent,),
                       BorderBtn(title: "Edit", onTap: (){},width: 100,color: Colors.transparent,)
                     ],
                   ),

                 ):const SizedBox()
               ],
             ))

           ],
         ),
       );
     }),

        widget.isEdit? Align(
            alignment: Alignment.centerRight,
            child: ColorBtn(title: "Save Edit",width: 200, onTap: (){
              Navigator.pop(context);
              showSnackBar(context,"Edit Successfully");
            },)): const  SizedBox(),
      ],
    );
  }
  Widget orderHistoryInfo(){
    return Column(
      children: [
        Container(
          height: 58,
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: appColors.lightGreyColor))
          ),
          child: Row(
            children: [
              Expanded(child: TextUtil(text: "Order ID",weight: true,size: 16,)),
              Expanded(child: TextUtil(text: "Status",weight: true,size: 16,)),
              Expanded(child:  TextUtil(text: "Value",weight: true,size: 16,),),
              Expanded(child: TextUtil(text: "Payment status",weight: true,size: 16,)),
              Expanded(child:  TextUtil(text: "Actions",weight: true,size: 16,))

            ],
          ),
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
               shrinkWrap: true,
               itemCount: 100,
               itemBuilder: (context,index){
                 return  Container(
                   height: 58,
                   decoration: BoxDecoration(
                       border: Border(bottom: BorderSide(color: appColors.lightGreyColor))
                   ),
                   child: Row(
                     children: [
                       Expanded(child: DescriptionText(text: "1234567890",)),

                       Expanded(child: Align(
                         alignment:Alignment.centerLeft,
                         child:  Container(
                           width: 74,
                           height: 20,
                           alignment:Alignment.center,
                           decoration: BoxDecoration(
                               color: appColors.blueColor,
                               borderRadius: BorderRadius.circular(100)

                           ),
                           child: TextUtil(text:"Active",color: appColors.whiteColor,size: 11,),
                         ),
                       )
                       ),
                       Expanded(child:  DescriptionText(text: "\$10,000",),),
                       Expanded(child: DescriptionText(text: "Paid",)),
                       Expanded(child: Align(
                         alignment:Alignment.centerLeft,
                         child: Row(
                           children: [
                             IconButton(onPressed: (){
                               showCustomDialog(context,"Confirm order");
                             }, icon:const  Icon(Icons.visibility_outlined)),

                             // PopupMenuButton(
                             //
                             //   itemBuilder: (BuildContext context) => [
                             //     PopupMenuItem(
                             //
                             //       enabled: false,
                             //       child:Padding(
                             //         padding: const EdgeInsets.symmetric(vertical: 8),
                             //         child: Column(
                             //           children: [
                             //             for(int i=0;i<actionListAll.length;i++)...[
                             //               GestureDetector(
                             //                 onTap:(){
                             //                   Navigator.pop(context);
                             //                   showCustomDialog(context,actionListAll[i].title);
                             //                 },
                             //                 child: SizedBox(
                             //                   height: 56,width: 200,
                             //                   child: Row(
                             //                     children: [
                             //                       Icon(actionListAll[i].icon,color: appColors.blackColor,),
                             //                       const  SizedBox(width: 12,),
                             //                       TextUtil(text: actionListAll[i].title,size: 16,),
                             //                     ],
                             //                   ),
                             //                 ),
                             //               )
                             //             ]
                             //           ],
                             //         ),
                             //       ),
                             //
                             //     ),
                             //   ],
                             //
                             // ),
                           ],
                         ),
                       ),)
                     ],
                   ),
                 );
               }),
        ),

        widget.isEdit? Align(
            alignment: Alignment.centerRight,
            child: ColorBtn(title: "Save Edit",width: 200, onTap: (){
              Navigator.pop(context);
              showSnackBar(context,"Edit Successfully");
            },)): const  SizedBox(),
      ],
    );
  }

}
