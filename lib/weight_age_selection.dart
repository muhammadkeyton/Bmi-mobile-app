
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'constants.dart';
import './reuseable_widgets/custom_button.dart';

class WeightAgeSelection extends StatelessWidget {
  final String selectionType;
  final int selectionValue;
  final String selectionUnit;

  final void Function(int newValue) updateValue;

  

  const WeightAgeSelection({
    super.key,
    required this.selectionType,
    required this.selectionValue,
    required this.selectionUnit,
    required this.updateValue
    
  });

  @override
  Widget build(BuildContext context) {
    // int? newSelectionValue;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(selectionType,
            style: const TextStyle(
              color: kInactiveLabelColor,
            )),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(selectionValue.toString(), style: kNumberStyle),
            Text(selectionUnit,style: const TextStyle(color: kInactiveLabelColor))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomButton(icon:FontAwesomeIcons.minus,callBack:(){
              if(selectionValue > 0){
                updateValue(selectionValue - 1);
              }
              return;
              
            }),
            const SizedBox(width:10),
            CustomButton(icon:FontAwesomeIcons.plus,callBack: (){
               updateValue(selectionValue + 1);
            },)

          ],
        )
      ],
    );
  }
}