import 'package:flutter/material.dart';
class TextUtil extends StatelessWidget {
  String text;
  Color? color;
  double? size;
  bool? weight;
  TextUtil({super.key,required this.text,this.size,this.color,this.weight});

  @override
  Widget build(BuildContext context) {
    return  Text(text,

      style: TextStyle(color:color?? Colors.black,fontSize:size?? 18,
          fontWeight:weight==null?FontWeight.w400: FontWeight.bold,fontFamily: "Poppins"
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class DescriptionText extends StatelessWidget {
  String text;
  Color? color;




  DescriptionText({super.key,required this.text,this.color});

  @override
  Widget build(BuildContext context) {
    return  Text(text,

      style:  TextStyle(color:color?? const Color(0xff43474E),fontSize:14,
          fontWeight:FontWeight.w400, fontFamily: "Poppins"
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class TitleText extends StatelessWidget {
  String text;



  TitleText({super.key,required this.text,});

  @override
  Widget build(BuildContext context) {
    return  Text(text,

      style:const TextStyle(color:  Color(0xff1A1C1E),fontSize: 16,
          fontWeight:FontWeight.w500,fontFamily: "Poppins"
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
