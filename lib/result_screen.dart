import 'package:flutter/material.dart';
import 'constants.dart';
import './reuseable_widgets/reuseable_container.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key,required this.bmi,required this.result,required this.interpretation});

  final String bmi;
  final String result;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('BMI CALCULATOR'), centerTitle: true),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(13),
                child: const Text(
                  'Your Result',
                  style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 30,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
            Expanded(
                flex: 4,
                child: ReuseAbleContainer(
                    cardColor: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          result ,
                          style: const TextStyle(
                            color: Color(0xFF088F4D),
                          ),
                        ),

                        const SizedBox(height:30),

                        Text(bmi,style: kNumberStyle,),

                        const SizedBox(height:30),

                        Text(interpretation),
                      ],
                    ))),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  height: 60,
                  color: const Color(0xFFEA1556),
                  child: const Center(
                      child: Text(
                    'RE-CALCULATE YOUR BMI',
                    style: TextStyle(fontSize: 18),
                  ))),
            )
          ],
        ));
  }
}
