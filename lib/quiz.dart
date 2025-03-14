import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';

class quiz extends StatefulWidget {
  const quiz({super.key});

  @override
  State<quiz> createState() {
    return _QuizState(); // calling function
  }
}

class _QuizState extends State<quiz> {
  List<String> selectedAnswer = [];
  var activeScreen =
      'start-screen'; // 'start-screen' is just the label or name of the fisrt question screen , we can use integer also if we want

  void switchScreen() {
    // this will be used to navigate to the different screen
    setState(() {
      activeScreen = 'results-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        // to trigger build method
        activeScreen = 'start-screen';
      });
    }
  }

  @override
  Widget build(context) {
    // this variable will only availaible in this build method ..
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultsScreen(chosenAnswers: selectedAnswer);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget, // value used , if condition is not true
        ),
      ),
    );
  }
}
