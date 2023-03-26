import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './reuseable_widgets/reuseable_container.dart';
import 'gender_selection.dart';
import 'weight_age_selection.dart';

import 'constants.dart';
import 'bmi_brain.dart';

import 'result_screen.dart';

enum GenderTypes { male, female }

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  GenderTypes? selectedGender;
  int height = 155;
  int weight = 50;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar:
              AppBar(title: const Text('BMI CALCULATOR'), centerTitle: true),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGender = GenderTypes.male;
                          });
                        },
                        child: ReuseAbleContainer(
                          cardColor: kInactiveCardColor,
                          cardChild: GenderSelection(
                              selectedColor: selectedGender == GenderTypes.male
                                  ? kActiveLabelColor
                                  : kInactiveLabelColor,
                              icon: FontAwesomeIcons.mars,
                              gender: 'MALE'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGender = GenderTypes.female;
                          });
                        },
                        child: ReuseAbleContainer(
                            cardColor: kInactiveCardColor,
                            cardChild: GenderSelection(
                                selectedColor:
                                    selectedGender == GenderTypes.female
                                        ? kActiveLabelColor
                                        : kInactiveLabelColor,
                                icon: FontAwesomeIcons.venus,
                                gender: 'FEMALE')),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ReuseAbleContainer(
                  cardColor: kInactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('HEIGHT',
                          style: TextStyle(color: kInactiveLabelColor)),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(height.toString(), style: kNumberStyle),
                          const Text('cm',
                              style: TextStyle(color: kInactiveLabelColor))
                        ],
                      ),
                      const SizedBox(height: 10),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: const Color(0xFFFFFFFF),
                          inactiveTrackColor: const Color(0xFF888995),
                          overlayColor:
                              const Color(0xFFEA1556).withOpacity(0.12),
                          thumbColor: const Color(0xFFEA1556),
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 15.0),
                          trackHeight: 0.8,
                        ),
                        child: Slider(
                          min: 120.0,
                          max: 300,
                          value: height.toDouble(),
                          onChanged: (newValue) {
                            setState(() {
                              height = newValue.toInt();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReuseAbleContainer(
                        cardColor: kInactiveCardColor,
                        cardChild: WeightAgeSelection(
                            selectionType: 'WEIGHT',
                            selectionValue: weight,
                            selectionUnit: 'kg',
                            updateValue: (newValue) {
                              setState(() {
                                weight = newValue;
                              });
                            }),
                      ),
                    ),
                    Expanded(
                      child: ReuseAbleContainer(
                        cardColor: kInactiveCardColor,
                        cardChild: WeightAgeSelection(
                          selectionType: 'AGE',
                          selectionValue: age,
                          selectionUnit: 'yrs',
                          updateValue: (newValue) {
                            setState(() {
                              age = newValue;
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {

                  Bmi bmi = Bmi(height: height, weight: weight);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultScreen(bmi: bmi.calculateBmi(), result: bmi.getResult(), interpretation: bmi.getInterpretation())),
                  );
                },
                child: Container(
                    height: 60,
                    color: const Color(0xFFEA1556),
                    child: const Center(
                        child: Text(
                      'CALCULATE YOUR BMI',
                      style: TextStyle(fontSize: 18),
                    ))),
              )
            ],
          )),
    );
  }
}
