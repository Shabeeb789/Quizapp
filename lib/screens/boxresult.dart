import 'package:flutter/material.dart';
import 'package:quiz_app/constants/colors.dart';
import 'package:quiz_app/constants/sizedbox.dart';

class ResultBox extends StatelessWidget {
  const ResultBox(
      {super.key,
      required this.results,
      required this.questionlengths,
      required this.onpressed});
  final int results;
  final int questionlengths;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your Total Score",
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
            SizedBoxsize.sizedboxh20(context),
            CircleAvatar(
              radius: 70.0,
              backgroundColor: results == questionlengths
                  ? correctAnswer
                  : results < questionlengths / 2
                      ? incorrectAnswer
                      : results == questionlengths / 2
                          ? Colors.yellow
                          : Colors.orange,
              child: Text(
                "$results/$questionlengths",
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBoxsize.sizedboxh20(context),
            Text(
              results == questionlengths
                  ? 'you are great'
                  : results < questionlengths / 4
                      ? 'Keep Working On it'
                      : results == questionlengths / 2
                          ? 'Well Done'
                          : results > questionlengths / 3 &&
                                  results < questionlengths / 2
                              ? 'Good Effort'
                              : 'Excellent Job',
            ),
            SizedBoxsize.sizedboxh20(context),
            TextButton(
              onPressed: onpressed,
              child: Text(
                "Start Over",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.teal,
                  letterSpacing: 1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
