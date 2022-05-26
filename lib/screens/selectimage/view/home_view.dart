import 'package:flutter/material.dart';
import 'package:paymentcard/core/extensions/size_extension.dart';


class SelectImage extends StatelessWidget {
  const SelectImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.h,
        width: context.h,
        child: Column(
          children: [
            Expanded(child: Container(color: Colors.red,),),
            Expanded(child: Container(color: Colors.amber,),),
          ],
        ),
        
      ),
    );
    
  }
}