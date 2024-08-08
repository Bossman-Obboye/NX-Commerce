import 'package:flutter/material.dart';
import 'package:nx_commerce/utils/constants/image_strings.dart';


class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(child:  Scaffold(
       body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Image.asset(NxImages.loader, width: double.infinity, fit: BoxFit.cover, color: Colors.black,),
         ],
       )
    ));
  }
}