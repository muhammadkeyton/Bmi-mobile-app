import 'package:flutter/material.dart';



class GenderSelection extends StatelessWidget {

  final Color? selectedColor;
  final IconData? icon;
  final String gender;

  const GenderSelection({
    super.key,
    required this.selectedColor,
    required this.icon,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        Icon(icon,color:selectedColor,size: 60,),
        const SizedBox(height:15),
        Text(gender,style: TextStyle(color:selectedColor),)
        
        ],
    );
  }
}