import 'package:flutter/material.dart';
import 'package:interview_problem/constants.dart';

class ReusableContainer extends StatelessWidget {
  final String number;
  final String label;
  final Color numberColor;
  final Color labelColor;

  ReusableContainer({
    required this.number,
    required this.label,
    this.numberColor = lightReddish,
    this.labelColor = darkGrey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      decoration: BoxDecoration(
        color: offWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(number, style: heading1(color: numberColor)),
          Text(label, style: smallText(color: labelColor)),
        ],
      ),
    );
  }
}
