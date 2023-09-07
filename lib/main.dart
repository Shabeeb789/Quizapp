import 'package:flutter/material.dart';
import 'package:quiz_app/models/firebase/db_connection.dart';
import 'package:quiz_app/models/models.dart';
import 'package:quiz_app/screens/splashscreen.dart';
import 'package:quiz_app/screens/welcomescreen.dart';

void main() {
  // var db = DbConnect();
  // // db.addQuestions(QuestionModel(id: "1", title: "what is 0+0?", options: {
  // //   "1": false,
  // //   "2": false,
  // //   "3": false,
  // //   "0": true,
  // // }));
  // db.fetchQuestions();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: SplashScreen(),
    );
  }
}
