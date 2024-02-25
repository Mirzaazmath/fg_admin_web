import 'package:flutter/material.dart';

import '../../utils/color_utils.dart';
import '../../utils/text_utils.dart';
class ChipFilterBtnWithSearch extends StatefulWidget {
  final String selectedFilter;
  final String constantValue;
  final List<String>filterList;
  final Function(dynamic) onChange;
  const ChipFilterBtnWithSearch({super.key,required this.selectedFilter,required this.filterList,required this.onChange,required this.constantValue});

  @override
  State<ChipFilterBtnWithSearch> createState() => _ChipFilterBtnWithSearchState();
}

class _ChipFilterBtnWithSearchState extends State<ChipFilterBtnWithSearch> {
  final TextEditingController _searchController =TextEditingController();
  List<String>searchList=[];
  List<String> itemList=[];

   searchFunction(String val){
    setState(() {
      searchList = widget.filterList.where((item) =>item.toLowerCase().contains(val.toLowerCase())).toList();
    });

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    itemList= searchList.isEmpty?widget.filterList:searchList;


    return  PopupMenuButton(
      offset: const Offset(10,40),
      icon: Container(
        height: 32,
        padding: const EdgeInsets.symmetric(horizontal: 20,),
        decoration: BoxDecoration(
            color:widget.selectedFilter==widget.constantValue? Colors.white:AppColors().secondaryColor,
            border: Border.all(color: widget.selectedFilter==widget.constantValue? Colors.black:AppColors().secondaryColor,width: 0.4),
            borderRadius: BorderRadius.circular(10)
        ),
        alignment: Alignment.center,
        child: Row(
          children: [
            widget.selectedFilter==widget.constantValue?const   SizedBox(): const  Row(
              children: [
                Icon(Icons.check,size: 18,),
                SizedBox(width: 8,),
              ],
            ),
            TextUtil(text: widget.selectedFilter,size: 14,),
            const  SizedBox(width: 8,),
            widget.selectedFilter==widget.constantValue?   const Icon(Icons.expand_more_sharp,size: 18,): const Icon(Icons.close,size: 18,)
          ],
        ),
      ),
      //  initialValue: selectedFilter,
      onSelected:widget.onChange,
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        PopupMenuItem(
            child: Container(
              margin:const  EdgeInsets.only(bottom: 10),
              width: 360,
              child: TextFormField(
                onChanged:  searchFunction,
                controller: _searchController,
                decoration:const  InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            )),
        for(int i=0;i<itemList.length;i++)...[
          PopupMenuItem(
            value:itemList[i],
            child: ListTile(
             leading: CircleAvatar(child: Text(itemList[i].substring(0,1)),),
              title: Text(itemList[i],)
            ),
          ),
        ]
      ],
    );
  }
}
