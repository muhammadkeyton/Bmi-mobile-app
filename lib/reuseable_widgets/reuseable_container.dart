import 'package:flutter/material.dart';


class ReuseAbleContainer extends StatelessWidget{

  final Color? cardColor;
  final Widget? cardChild;


  const ReuseAbleContainer({super.key,this.cardColor,this.cardChild});


  @override
  Widget build(BuildContext context) {
   return Container(
    margin: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color:cardColor,
    ),
    child:cardChild,
   );
  }
}