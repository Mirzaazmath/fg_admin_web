import 'package:flutter/material.dart';

import '../../utils/text_utils.dart';
class ComingSoonWidget extends StatelessWidget {
final  String title;
  const ComingSoonWidget({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Container(
          height: 400,
          width: 500,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextUtil( text: title,size: 22,weight: true,),
              const  Icon(Icons.hourglass_top,size: 100,color: Colors.grey,),
              TextUtil( text: 'Coming soon...',size: 20,),
            ],
          ),

        ),
      ),
    );
  }
}
