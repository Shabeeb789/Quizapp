import 'package:flutter/material.dart';
import 'package:quiz_app/constants/colors.dart';
import 'package:quiz_app/responsive.dart';

class NextQuestion extends StatelessWidget {
  const NextQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Responsive.height(40, context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: neutralColor),
      child: Center(
        child: const Text(
          "NEXT QUESTION",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
