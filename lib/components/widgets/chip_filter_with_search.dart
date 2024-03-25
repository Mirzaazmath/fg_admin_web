import 'package:flutter/material.dart';

import '../../utils/color_utils.dart';
import '../../utils/text_utils.dart';
class ChipFilterBtnWithSearch extends StatefulWidget {
  final String selectedFilter;
  final String constantValue;
  final List<String>filterList;
  final String hintText;
  final Function(dynamic) onChange;
  const ChipFilterBtnWithSearch({super.key,required this.selectedFilter,required this.filterList,required this.onChange,required this.constantValue,required this.hintText});

  @override
  State<ChipFilterBtnWithSearch> createState() => _ChipFilterBtnWithSearchState();
}

class _ChipFilterBtnWithSearchState extends State<ChipFilterBtnWithSearch> {
  TextEditingController searchController =TextEditingController();
  List<String>searchList=[];
  List<String> itemList=[];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itemList.addAll(widget.filterList);
  }
  @override
  Widget build(BuildContext context) {
    return  PopupMenuButton(
      tooltip: "Search",
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
      onSelected:widget.onChange,
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        PopupMenuItem(
          enabled: false,
            child: StatefulBuilder(
              builder: (context,setStates) {
                return SizedBox(
                  height: 300,
                  child: Column(
                    children: [
                      Container(
                        margin:const  EdgeInsets.only(bottom: 10),
                        width: 360,
                        child: TextFormField(
                          controller: searchController,
                          onChanged:  (val){
                            setStates(() {
                              searchList = widget.filterList.where((item) =>item.toLowerCase().contains(val.toLowerCase())).toList();
                              itemList=searchList;
                            });
                            },
                          decoration:  InputDecoration(
                            hintText: widget.hintText,
                            prefixIcon:const  Icon(Icons.search),
                          ),
                        ),
                      ),

                      itemList.isEmpty?const  Center(child: TextUtil(text: "No Match Found",),): Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                           for(int i=0;i<itemList.length;i++)...[
                             ListTile(
                                 onTap: (){
                                   searchController.text=itemList[i];
                                 },
                                 leading: CircleAvatar(child: Text(itemList[i].substring(0,1)),),
                                 title: TextUtil( text:itemList[i],size: 16,)
                             ),
                           ]
                                               ],
                                             ),
                        ),
                      )
                    ],
                  ),
                );
              }
            )),

      ],
    );
  }
}
