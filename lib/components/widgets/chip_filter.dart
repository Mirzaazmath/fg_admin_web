import 'package:flutter/material.dart';

import '../../utils/color_utils.dart';
import '../../utils/text_utils.dart';
class ChipFilterBtn extends StatelessWidget {
  final String selectedFilter;

  final String constantValue;
  final List<String>filterList;
  final Function(dynamic) onChange;
  const ChipFilterBtn({super.key,required this.selectedFilter,required this.filterList,required this.onChange,required this.constantValue});

  @override
  Widget build(BuildContext context) {
    return  PopupMenuButton(
     offset: const Offset(10,40),
      icon: Row(
        children: [
          Container(
            height: 32,
            padding: const EdgeInsets.symmetric(horizontal: 20,),
            decoration: BoxDecoration(
                color:selectedFilter==constantValue? Colors.white:AppColors().secondaryColor,
                border: Border.all(color: selectedFilter==constantValue? Colors.black:AppColors().secondaryColor,width: 0.4),
                borderRadius: BorderRadius.circular(10)
            ),
            alignment: Alignment.center,
            child: Row(
              children: [
                selectedFilter==constantValue?const   SizedBox(): const  Row(
                  children: [
                    Icon(Icons.check,size: 18,),
                    SizedBox(width: 8,),
                  ],
                ),
                TextUtil(text: selectedFilter,size: 14,),
                const  SizedBox(width: 8,),
                selectedFilter==constantValue?   const Icon(Icons.expand_more_sharp,size: 18,): const SizedBox()
              ],
            ),

          ),
          // selectedFilter==constantValue?const  SizedBox(): InkWell(
          //   child: Container(
          //     height: 32,
          //     width: 32,
          //     color:AppColors().secondaryColor,
          //     child:const  Icon(Icons.close),
          //
          //   ),
         // )
        ],
      ),
      //  initialValue: selectedFilter,
      onSelected:onChange,
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        for(int i=0;i<filterList.length;i++)...[
          PopupMenuItem(
            value: filterList[i],
            child: Text(filterList[i]),
          ),
        ]
      ],
    );
  }
}
