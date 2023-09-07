import 'package:flutter/material.dart';
import 'package:quiz_app/constants/colors.dart';

class OptionWidget extends StatelessWidget {
  const OptionWidget({
    super.key,
    required this.options,
    required this.colors,
  });
  final String options;
  final Color colors;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: colors,
      child: ListTile(
        title: Text(
          options,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: colors.red != colors.green ? neutralColor : Colors.black),
        ),
      ),
    );
  }
}
