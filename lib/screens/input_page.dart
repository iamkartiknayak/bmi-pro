import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/reusable_card.dart';
import '../components/gender_info_card.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import '../components/custom_button_card.dart';
import '../components/custom_slider_card.dart';
import '../bmi_brain.dart';

enum Gender {
  male,
  female,
  none,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.none;
  int height = 180;
  int weight = 60;
  int age = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0a0e21),
      appBar: AppBar(
        backgroundColor: const Color(0xff0a0e21),
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onTap: () => setState(() {
                      selectedGender = selectedGender == Gender.male
                          ? Gender.none
                          : Gender.male;
                    }),
                    color: (selectedGender == Gender.none ||
                            selectedGender == Gender.female)
                        ? kInactiveCardColor
                        : kActiveCardColor,
                    cardChild: const GenderInfoCard(
                      label: 'MALE',
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onTap: () => setState(() {
                      selectedGender = selectedGender == Gender.female
                          ? Gender.none
                          : Gender.female;
                    }),
                    color: (selectedGender == Gender.none ||
                            selectedGender == Gender.male)
                        ? kInactiveCardColor
                        : kActiveCardColor,
                    cardChild: const GenderInfoCard(
                      label: 'FEMALE',
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                )
              ],
            ),
          ),
          CustomSliderCard(
              height: height,
              onValueChanged: (double newHeight) {
                setState(() {
                  height = newHeight.round();
                });
              }),
          Expanded(
            child: Row(
              children: [
                CustomButtonCard(
                  dataName: 'WEIGHT',
                  dataType: weight,
                  onIcrement: () => setState(() {
                    weight += 1;
                  }),
                  onDecrement: () => setState(() {
                    weight -= 1;
                  }),
                ),
                CustomButtonCard(
                  dataName: 'AGE',
                  dataType: age,
                  onIcrement: () => setState(() {
                    age += 1;
                  }),
                  onDecrement: () => setState(() {
                    age -= 1;
                  }),
                )
              ],
            ),
          ),
          BottomButton(
            text: 'CALCULATE',
            onPressed: () {
              BMIBrain bmiBrain = BMIBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) {
                    return ResultsPage(
                      bmi: bmiBrain.calculateBMI(),
                      result: bmiBrain.getResult(),
                      resultDisplayColor: bmiBrain.getResultDisplayColor(),
                      interpretation: bmiBrain.getInterpretation(),
                    );
                  }),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
