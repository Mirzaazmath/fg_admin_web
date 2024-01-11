
import 'package:admin_panel/utils/text_utils.dart';
import 'package:flutter/material.dart';
import '../../presentation/dashboard_page.dart';
import '../../utils/text_feild_utils.dart';

class ViewCustomerDetailDialogBox extends StatefulWidget {
  const ViewCustomerDetailDialogBox({super.key});
  @override
  _ViewCustomerDetailDialogBoxState createState() => _ViewCustomerDetailDialogBoxState();
}

class _ViewCustomerDetailDialogBoxState extends State<ViewCustomerDetailDialogBox> {

  List<String>optionList=["Personal info","Business profile","Delivery location"];
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
    return Container(
      width: 600,
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
                  Expanded(child: GestureDetector(
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

  Widget detailBody(int index){
    switch(index){
      case 0:
        return personalInfo();
      case 1:
        return businessInfo();
      case 2:
        return locationInfo();
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
            Expanded(child: Field(controller: firstNameController, hintText: 'First Name',)),
            const SizedBox(width: 16,),
            Expanded(child: Field(controller: lastNameController, hintText: 'Last Name',)),
          ],
        ),
        const SizedBox(height: 24,),
        Field(controller: mobileController, hintText: 'Mobile Number',isNumberType: true,),
        const SizedBox(height: 16,),
        Field(controller: emailController, hintText: 'Email Address',),
        const SizedBox(height: 16,),

        //  ColorBtn(title: "Create Customer", onTap: (){}),
      ],
    );
  }
  Widget businessInfo(){
    return Column(
      children: [
      Field(controller: companyNameController, hintText: "Company Name",),
        const SizedBox(height: 16,),
        Field(controller: legalNameController, hintText: 'Legal Name',),
        const SizedBox(height: 16,),
        Field(controller: cinController, hintText: "CIN"),
        const SizedBox(height: 16,),
        Field(controller: gstinController, hintText: 'GSTIN',),
        const SizedBox(height: 16,),
        Field(controller: companyPanController, hintText: 'Company PAN',),
        const SizedBox(height: 16,),

        //  ColorBtn(title: "Create Customer", onTap: (){}),
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
         height: 100,
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
                 TitleText(text: "Gachibowli Hospital"),
                 const  SizedBox(height: 4,),
                 DescriptionText(text: "Apollo Hospitals Gachibowli, #123, Street, Main, Cross, Karnataka, Bengaluru, India"),
               ],
             ))

           ],
         ),
       );
     })

        //  ColorBtn(title: "Create Customer", onTap: (){}),
      ],
    );
  }

}
