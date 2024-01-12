import 'package:flutter/material.dart';

import '../../presentation/dashboard_page.dart';
import '../../utils/text_utils.dart';
class PaginationWidget extends StatefulWidget {
  const PaginationWidget({super.key});

  @override
  State<PaginationWidget> createState() => _PaginationWidgetState();
}

class _PaginationWidgetState extends State<PaginationWidget> {
  int selectedIndex=1;
  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 40,
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.only(top: 20),
      child: SizedBox(width: 270,
        child: Row(
          children: [
            GestureDetector(
              onTap:(){
                if(selectedIndex==1){

                }else{
                  setState(() {
                    selectedIndex--;
                  });
                }
              },
              child: Container(
                  margin:const  EdgeInsets.symmetric(horizontal: 3),
                  height: 32,
                  width:32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border: Border.all(color: Colors.grey),
                  ),

                  child: const Icon(Icons.arrow_back_ios,size: 15,)

              ),
            ),
            Expanded(
              child: Row(
                children: [
                  for(int i=1;i<6;i++)...[
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedIndex=i;
                        });
                      },
                      child: Container(
                        margin:const  EdgeInsets.symmetric(horizontal: 3),
                        height: 32,
                        width:32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: i==selectedIndex?appColors.blueColor:Colors.transparent,
                          border: Border.all(color: Colors.grey),
                        ),
                        alignment: Alignment.center,
                        child: TextUtil(text: i.toString(),color:i==selectedIndex?appColors.whiteColor:Colors.black,),

                      ),
                    )]
                ],

              ),
            ),
            GestureDetector(
              onTap:(){
                if(selectedIndex==5){

                }else{
                  setState(() {
                    selectedIndex++;
                  });
                }
              },
              child: Container(
                  margin:const  EdgeInsets.symmetric(horizontal: 3),
                  height: 32,
                  width:32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border: Border.all(color: Colors.grey),
                  ),

                  child: const Icon(Icons.arrow_forward_ios,size: 15,)

              ),
            ),
          ],
        ),
      ),
    );
  }
}
