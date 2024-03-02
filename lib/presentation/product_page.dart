import 'package:flutter/material.dart';
import '../components/widgets/bottons/create_btn.dart';
import '../components/widgets/bottons/setting_btn.dart';
import '../components/widgets/coming_soon_crad.dart';
import '../components/widgets/global_custom_dailog.dart';
import '../depricated/secondary_btn.dart';
import '../utils/text_utils.dart';
import 'dashboard_page.dart';
class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const  EdgeInsets.only(left: 24,right: 24,bottom: 24),
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: appColors.whiteColor,
          centerTitle: false,

          title:const  TextUtil(text: "Products",size: 28,),
          actions: [
            DownloadBtn(onTap: (){}),
            const SizedBox(width: 10,),
            SecondaryBtn(onTap: (){}),
            const  SizedBox(width: 10,),
            CreateBtn(onTap: (){
              showCustomDialog(context,"Add New Product");
            }, title: "Add New Product"),

          ],
        ),
        body: Column(
          children: [
            Padding(
              padding:const  EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  TextUtil(text: "Home",size: 16,color: appColors.greyColor,),
                  const  SizedBox(width: 8,),
                  const Icon(Icons.arrow_forward_ios_outlined,size: 15,),
                  const  SizedBox(width: 8,),
                  TextUtil(text: "Products",size: 16,color: appColors.blueColor,)
                ],
              ),
            ),
            const  SizedBox(height: 32,),
          ],
        ),

      ),

    );

  }
}