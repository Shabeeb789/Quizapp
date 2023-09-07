import 'package:flutter/material.dart';
import 'package:quiz_app/constants/colors.dart';
import 'package:quiz_app/responsive.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget(
      {super.key,
      required this.question,
      required this.index,
      required this.totalquestion});

  final String question;
  final int index;
  final int totalquestion;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        "Question ${index + 1}/$totalquestion : $question",
        style: TextStyle(
            color: neutralColor, fontSize: Responsive.height(24, context)),
      ),
    );
  }
}
