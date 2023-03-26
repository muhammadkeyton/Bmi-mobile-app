import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {

  final IconData? icon;
  final void Function()? callBack;

  const CustomButton({
    super.key,
    required this.icon,
    this.callBack
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed:callBack,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: const Color(0xFF1C2033),
      elevation: 10,
     
      shape:const CircleBorder(),
      child: Icon(icon,size:25,color:const Color(0xFFB9BBC8) ,),
    );
  }
}
