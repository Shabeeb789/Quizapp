import 'dart:core';

class QuestionModel {
  final String id;
  final String title;
  final Map<String, bool> options;

  QuestionModel({required this.id, required this.title, required this.options});
}
