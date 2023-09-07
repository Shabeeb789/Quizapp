import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  dynamic goto(Widget widget) {
    Navigator.push(
        this,
        MaterialPageRoute(
          builder: (context) => widget,
        ));
  }
}
