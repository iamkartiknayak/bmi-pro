import 'package:flutter/material.dart';

import '../constants.dart';
import 'reusable_card.dart';

class CustomSliderCard extends StatefulWidget {
  final int height;
  final void Function(double) onValueChanged;

  const CustomSliderCard({
    super.key,
    required this.height,
    required this.onValueChanged,
  });

  @override
  State<CustomSliderCard> createState() => _CustomSliderCardState();
}

class _CustomSliderCardState extends State<CustomSliderCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ReusableCard(
        color: kActiveCardColor,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'HEIGHT',
              style: kLabelTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  widget.height.toString(),
                  style: kNumberTextStyle,
                ),
                const Text(
                  'cm',
                  style: kLabelTextStyle,
                ),
              ],
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.white,
                inactiveTrackColor: const Color(0xff8d8e98),
                thumbColor: const Color(0xffeb1555),
                overlayShape:
                    const RoundSliderOverlayShape(overlayRadius: 30.0),
                overlayColor: const Color(0x15eb1555),
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 15.0,
                ),
              ),
              child: Slider(
                value: widget.height.toDouble(),
                min: 120.0,
                max: 220.0,
                onChanged: widget.onValueChanged,
              ),
            )
          ],
        ),
      ),
    );
  }
}
