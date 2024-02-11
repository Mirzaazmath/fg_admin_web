
import 'package:admin_panel/components/widgets/bottons/border_btn.dart';

import 'package:admin_panel/utils/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../presentation/dashboard_page.dart';
import '../../provider/dialog_provider.dart';
import '../../utils/text_feild_utils.dart';
import '../widgets/bottons/color_btn.dart';
import '../widgets/toast_widget.dart';

class ViewDriverDetailDialogBox extends StatefulWidget {
  bool isEdit;
  ViewDriverDetailDialogBox({super.key,required this.isEdit});
  @override
  _ViewDriverDetailDialogBoxState createState() => _ViewDriverDetailDialogBoxState();
}

class _ViewDriverDetailDialogBoxState extends State<ViewDriverDetailDialogBox> {

  List<String>optionList=["Personal info","Bank details","Documents"];
  int selectedOption=0;
  TextEditingController firstNameController=TextEditingController(text: "Kiran");
  TextEditingController lastNameController=TextEditingController(text: "Naik");
  TextEditingController emailController=TextEditingController(text: "kiran@gmail.com");
  TextEditingController phoneController=TextEditingController(text: "9876543211");
  TextEditingController bloodGroupController=TextEditingController(text: "B+");
  TextEditingController dateOfJoinController=TextEditingController(text: "20/1/2022");
  TextEditingController dateOfBirthController=TextEditingController(text: "2/5/1990");
  TextEditingController accountNumberController=TextEditingController(text: "987663552672626");
  TextEditingController confirmAccountNoController=TextEditingController(text: "987663552672626");
  TextEditingController ifscController=TextEditingController(text: "8764");
  TextEditingController accountHolderNameController=TextEditingController(text:"Kiran Naik");
  TextEditingController adhaarController=TextEditingController(text: "9876-3552-6726");
  TextEditingController panController=TextEditingController(text: "VGS8474");
  TextEditingController drivingLicenseController=TextEditingController(text: "D9847");



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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextUtil(text:widget.isEdit? 'Edit driver details':"Driver details",size: 24,),
                        IconButton(onPressed: (){
                          Navigator.pop(context);
                        }, icon:const  Icon(Icons.close)),
                      ],
                    ),
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
        return personalInfoWidget();
      case 1:
        return bankInfoWidget();
      case 2:
        return documentInfoWidget();

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
  Widget personalInfoWidget(){
    return  Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        // TextUtil(text: 'Driver Personal details',size: 24,),
        const SizedBox(height: 16,),
        Row(
          children: [
            Expanded(child: Field(controller: firstNameController, hintText: 'First Name',isEnable: !widget.isEdit)),
            const SizedBox(width: 16,),
            Expanded(child: Field(controller: lastNameController, hintText: 'Last Name',isEnable: !widget.isEdit)),
          ],
        ),
        const SizedBox(height: 16,),
        Field(controller: dateOfBirthController, hintText: 'Date of Birth',isEnable: !widget.isEdit),
        const SizedBox(height: 16,),
        Field(controller: emailController, hintText: 'Email',isEnable: !widget.isEdit),
        const SizedBox(height: 16,),
        Field(controller: phoneController, hintText: 'Phone Number',isEnable: !widget.isEdit),
        const SizedBox(height: 16,),
        Row(
          children: [
            Expanded(child: Field(controller: dateOfJoinController, hintText: 'Join Date',isEnable: !widget.isEdit),),
            const SizedBox(width: 16,),
            Expanded(child: Field(controller: bloodGroupController, hintText: 'Blood Group',isEnable: !widget.isEdit)),
          ],
        ),
        const SizedBox(height: 16,),
      //  const Spacer(),
         widget.isEdit ?  Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ColorBtn(title: "Save", onTap: (){
              showSnackBar(context, "Updated");
             // pageController.animateToPage(1, duration:const  Duration(milliseconds: 500), curve: Curves.linearToEaseOut);

            },width: 250,),

          ],
        ):const SizedBox(),
      ],
    );
  }
  ///// Bank  Info ///

  Widget bankInfoWidget(){
    return  Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 16,),

        Field(controller: accountNumberController, hintText: 'Account Number',isEnable: !widget.isEdit),
        const SizedBox(height: 24,),
        Field(controller: confirmAccountNoController, hintText: 'Confirm Account Number',isEnable: !widget.isEdit),
        const SizedBox(height: 24,),
        Field(controller: ifscController, hintText: 'IFSC',),
        const SizedBox(height: 24,),
        Field(controller: accountHolderNameController, hintText: 'Account Holder Name',isEnable: !widget.isEdit),
        const SizedBox(height: 24,),

         widget.isEdit?   Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ColorBtn(title: "Save", onTap: (){
              showSnackBar(context, "Updated");


            },width: 250,),

          ],
        ):const SizedBox(),

      ],
    );
  }


  ///// Document  Info ///

  Widget documentInfoWidget(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widget.isEdit?
      <Widget>[
        const SizedBox(height: 16,),

        Row(
          children: [
            Expanded(child: Field(controller: adhaarController, hintText: 'Aadhaar Number',isEnable: !widget.isEdit),),
            const  SizedBox(width: 20,),
            BorderBtn(title: "Upload document", onTap: (){},width: 180,)
          ],
        ),
        const SizedBox(height: 24,),
        Row(
          children: [
            Expanded(child:  Field(controller: panController, hintText: 'Pan Number',isEnable: !widget.isEdit),),
            const  SizedBox(width: 20,),
            BorderBtn(title: "Upload document", onTap: (){},width: 180,)
          ],
        ),

        const SizedBox(height: 24,),
        Row(
          children: [
            Expanded(child:  Field(controller: drivingLicenseController, hintText: 'Driving License',isEnable: !widget.isEdit),),
            const  SizedBox(width: 20,),
            BorderBtn(title: "Upload document", onTap: (){},width: 180,)
          ],
        ),

        const SizedBox(height: 24,),
       // const Spacer(),
         widget.isEdit? Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ColorBtn(title: "Save", onTap: (){
              showSnackBar(context, "Updated");


            },width: 250,),

          ],
        ):const SizedBox(),

      ]:[
       const  TitleText(text: "Aadhaar number"),
      const  SizedBox(height: 10,),
       const  DescriptionText(text: "9746 7363 7373"),
        const  SizedBox(height: 20,),
        const  TitleText(text: "Pan number"),
        const  SizedBox(height: 10,),
        const  DescriptionText(text: "CBG7373"),
        const  SizedBox(height: 20,),
        const  TitleText(text: "Driving License number"),
        const  SizedBox(height: 10,),
        const  DescriptionText(text: "D97467363"),
        const  SizedBox(height: 20,),



      ]
    );
  }

}
