import 'package:flutter/material.dart';
import 'package:quiz_app/constants/colors.dart';
import 'package:quiz_app/constants/sizedbox.dart';
import 'package:quiz_app/models/firebase/db_connection.dart';
import 'package:quiz_app/models/models.dart';
import 'package:quiz_app/responsive.dart';
// import 'package:quiz_app/responsive.dart';
import 'package:quiz_app/screens/boxresult.dart';
import 'package:quiz_app/widgets/nextquestions.dart';
import 'package:quiz_app/widgets/optionswidget.dart';
import 'package:quiz_app/widgets/question_widget.dart';

class HomeSCreen extends StatefulWidget {
  const HomeSCreen({super.key, required this.name});
  final String name;

  @override
  State<HomeSCreen> createState() => _HomeSCreenState();
}

class _HomeSCreenState extends State<HomeSCreen> {
  var db = DbConnect();
  late Future _questions;
  // final List<QuestionModel> _questions = [
  //   QuestionModel(
  //       id: "1",
  //       title:
  //           "Which player scored the fastest hat-trick in the Premier League?",
  //       options: {
  //         "Ronaldo": false,
  //         "Owen": false,
  //         "Aguero": false,
  //         "Mane": true
  //       }),
  //   QuestionModel(
  //       id: "2",
  //       title:
  //           "Which Portuguese team did Ronaldo play for before signing for Manchester United?",
  //       options: {
  //         "FC PORTO": false,
  //         "SPORTING BRAGA": false,
  //         "SPORTING LISBON": true,
  //         "BENFICA": false
  //       }),
  //   QuestionModel(
  //       id: "3",
  //       title: "In which year was the first European Championship held?",
  //       options: {"1960": true, "1961": false, "1970": false, "1971": false}),
  //   QuestionModel(
  //       id: "4",
  //       title:
  //           "Jurgen Klopp has managed two clubs in Germany, Borussia Dortmund and - can you name the other?",
  //       options: {
  //         "Bayern Munich": false,
  //         "Rb Leipzig": false,
  //         "Werder": false,
  //         "Mainz": true
  //       }),
  //   QuestionModel(
  //       id: "5",
  //       title:
  //           "I was the first Liverpool player to win the Ballon d'Or. I scored 40 goals for my country and have played in England and Spain.",
  //       options: {
  //         "Torres": false,
  //         "Gerrard": false,
  //         "Owen": true,
  //         "Salah": false
  //       }),
  //   QuestionModel(
  //       id: "6",
  //       title:
  //           "In what league is the concept of a 'Designated Player' a feature?",
  //       options: {"EPL": false, "SPL": false, "ISL": false, "MLS": true}),
  //   QuestionModel(
  //       id: "7",
  //       title: "When was the inaugural Premier League season?",
  //       options: {
  //         "1960-1961": false,
  //         "1961-1962": false,
  //         "1962-1963": true,
  //         "1963-1964": false
  //       }),
  //   QuestionModel(
  //       id: "8",
  //       title:
  //           "The 2026 World Cup will be hosted across three different countries. Can you name them?",
  //       options: {
  //         "United States, Canada and Mexico": true,
  //         "Argentina, France and Uruguay": false,
  //         "India, Srilanka and Bangladesh": false,
  //         "Belgium, Germany and Spain": false
  //       }),
  //   QuestionModel(
  //       id: "9",
  //       title:
  //           "Messi wore the No.30 at the start of his Barca career and is then No.10. What other number has he worn for the club?",
  //       options: {"9": false, "19": true, "29": false, "39": false}),
  //   QuestionModel(
  //       id: "10",
  //       title: "How many times India qualified for Asia Cup?",
  //       options: {"5": true, "10": false, "15": false, "20": false}),
  // ];

  Future<List<QuestionModel>> getData() async {
    return db.fetchQuestions();
  }

  @override
  void initState() {
    _questions = getData();

    // TODO: implement initState
    super.initState();
  }

  void startover() {
    setState(() {
      index = 0;
      ispressed = false;
      score = 0;
      isalreadyselected = false;
    });
    Navigator.pop(context);
  }

  void nextQuestion(int questionLength) {
    if (index == questionLength - 1) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => ResultBox(
          onpressed: startover,
          questionlengths: questionLength,
          results: score,
        ),
      );
      return;
    } else {
      if (ispressed) {
        setState(() {
          index++;
          ispressed = false;
          isalreadyselected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.black,
            behavior: SnackBarBehavior.floating,
            content: Center(child: Text("select your answer"))));
      }
    }
  }

  void checkAnswerAndUpdate(bool value) {
    if (isalreadyselected) {
      return;
    } else {
      if (value == true) {
        score++;
      } else {
        score--;
      }
      setState(() {
        ispressed = true;
        isalreadyselected = true;
      });
    }
  }

// create an index to loop through _questions!
  int index = 0;
  bool ispressed = false;
  int score = 0;
  bool isalreadyselected = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _questions as Future<List<QuestionModel>>,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            var extractedData = snapshot.data as List<QuestionModel>;
            return Scaffold(
              backgroundColor: backgroundColors,
              appBar: AppBar(
                title: const Text(
                  "Quiz App",
                ),
                backgroundColor: backgroundColors,
                shadowColor: Colors.transparent,
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "${widget.name} score is:$score",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      QuestionWidget(
                          question: extractedData[index].title,
                          index: index,
                          totalquestion: extractedData.length),
                      const Divider(
                        color: neutralColor,
                      ),
                      SizedBoxsize.sizedboxh20(context),
                      for (int i = 0;
                          i < extractedData[index].options.length;
                          i++)
                        GestureDetector(
                          onTap: () => checkAnswerAndUpdate(
                              extractedData[index].options.values.toList()[i]),
                          child: OptionWidget(
                              colors: ispressed
                                  ? extractedData[index]
                                              .options
                                              .values
                                              .toList()[i] ==
                                          true
                                      ? correctAnswer
                                      : neutralColor
                                  : neutralColor,
                              options: extractedData[index]
                                  .options
                                  .keys
                                  .toList()[i]),
                        ),
                    ],
                  ),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: GestureDetector(
                onTap: () => nextQuestion(extractedData.length),
                child: const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: NextQuestion(),
                ),
              ),
            );
          }
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: CircularProgressIndicator(),
              ),
              SizedBox(
                height: Responsive.height(20, context),
              ),
              const Text(
                "please wait while questions are loading..",
                style: TextStyle(
                    color: neutralColor,
                    decoration: TextDecoration.none,
                    fontSize: 14),
              ),
            ],
          );
        }
        return const Center(
          child: Text("NO DATA FOUND"),
        );
      },
    );
  }
}
