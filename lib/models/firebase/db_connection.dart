import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/models/models.dart';

class DbConnect {
  final url = Uri.parse(
      "https://simplequizapp-6442d-default-rtdb.firebaseio.com/questions.json");
  Future<void> addQuestions(QuestionModel question) async {
    http.post(url,
        body: json.encode({
          'title': question.title,
          'options': question.options,
        }));
  }

  Future<List<QuestionModel>> fetchQuestions() async {
    List<QuestionModel> newQuestions = [];
    return http.get(url).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      print(data);
      data.forEach((key, value) {
        var newQuestion = QuestionModel(
          id: key,
          title: value['title'],
          options: Map.castFrom(value['options']),
        );
        newQuestions.add(newQuestion);
      });
      return newQuestions;
    });
  }
}
