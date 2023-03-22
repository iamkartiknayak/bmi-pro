import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import 'reusable_card.dart';
import 'round_icon_button.dart';

class CustomButtonCard extends StatefulWidget {
  final String dataName;
  final int dataType;
  final VoidCallback onIcrement;
  final VoidCallback onDecrement;

  const CustomButtonCard({
    super.key,
    required this.dataName,
    required this.dataType,
    required this.onIcrement,
    required this.onDecrement,
  });

  @override
  State<CustomButtonCard> createState() => _CustomButtonCardState();
}

class _CustomButtonCardState extends State<CustomButtonCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ReusableCard(
        color: kActiveCardColor,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.dataName,
              style: kLabelTextStyle,
            ),
            Text(
              widget.dataType.toString(),
              style: kNumberTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundIconButton(
                  icon: FontAwesomeIcons.minus,
                  onPressed: widget.onDecrement,
                ),
                const SizedBox(
                  width: 15.0,
                ),
                RoundIconButton(
                  icon: FontAwesomeIcons.plus,
                  onPressed: widget.onIcrement,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
