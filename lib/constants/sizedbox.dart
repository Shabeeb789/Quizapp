import 'package:flutter/material.dart';
import 'package:quiz_app/responsive.dart';

class SizedBoxsize {
  static SizedBox sizedboxh20(BuildContext context) {
    return SizedBox(
      height: Responsive.height(20, context),
    );
  }

  static SizedBox sizedboxh40(BuildContext context) {
    return SizedBox(
      height: Responsive.height(40, context),
    );
  }

  static SizedBox sizedboxh60(BuildContext context) {
    return SizedBox(
      height: Responsive.height(60, context),
    );
  }

  static SizedBox sizedboxw20(BuildContext context) {
    return SizedBox(
      height: Responsive.width(20, context),
    );
  }

  static SizedBox sizedboxw40(BuildContext context) {
    return SizedBox(
      height: Responsive.width(40, context),
    );
  }

  static SizedBox sizedboxw60(BuildContext context) {
    return SizedBox(
      height: Responsive.width(60, context),
    );
  }
}
