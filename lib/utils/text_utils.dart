import 'package:flutter/material.dart';
/// This Class is for all Types of text
class TextUtil extends StatelessWidget {
 final  String text;
 final  Color? color;
 final  double? size;
 final  bool? weight;
const   TextUtil({super.key,required this.text,this.size,this.color,this.weight});

  @override
  Widget build(BuildContext context) {
    return  Text(text,

      style: TextStyle(color:color?? Colors.black,fontSize:size?? 18,
          fontWeight:weight==null?FontWeight.w500: FontWeight.w700,fontFamily: "Poppins"
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
/// This class mainly used for row type of text
class DescriptionText extends StatelessWidget {
 final  String text;
  final Color? color;
  const  DescriptionText({super.key,required this.text,this.color});

  @override
  Widget build(BuildContext context) {
    return  Text(text,

      style:  TextStyle(color:color?? const Color(0xff43474E),fontSize:16,
          fontWeight:FontWeight.w500, fontFamily: "Poppins"
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
/// This class is Used for mostly Title in dialogs
class TitleText extends StatelessWidget {
  final String text;
 const TitleText({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return  Text(text,

      style:const  TextStyle(color:   Color(0xff1A1C1E),fontSize: 16,
          fontWeight:FontWeight.w500,fontFamily: "Poppins"
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}


/// This class is used for table heading in every page
class HeadingText extends StatelessWidget {
  final String text;
  const HeadingText({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return  Text(text,

      style:const  TextStyle(color:  Color(0xff1A1C1E),fontSize: 16,
          fontWeight:FontWeight.w700,fontFamily: "Poppins"
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}