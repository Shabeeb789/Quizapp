import 'package:flutter/material.dart';
import 'package:quiz_app/constants/colors.dart';
import 'package:quiz_app/extensions/extension.dart';
import 'package:quiz_app/quiz/quiz.dart';
import 'package:quiz_app/responsive.dart';
import 'package:quiz_app/screens/homescreen.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "lib/assets/images/welcomescreen.jpg",
            fit: BoxFit.cover,
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: Responsive.height(100, context),
                ),
                const Text(
                  "Let's Play Quiz",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const Text(
                  "Enter your information below",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
                SizedBox(
                  height: Responsive.height(100, context),
                ),
                TextField(
                  controller: nameController,
                  style: TextStyle(
                      color: neutralColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    fillColor: Colors.grey,
                    filled: true,
                    hintText: "Enter your Name",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: Responsive.height(20, context),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: backgroundColors,
                    fixedSize: Size(MediaQuery.of(context).size.width, 40),
                  ),
                  onPressed: () {
                    if (nameController.text == "") {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Enter Your Name")));
                    } else {
                      context.goto(HomeSCreen(
                        name: nameController.text,
                      ));
                    }
                  },
                  child: const Text("let's start quiz"),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
