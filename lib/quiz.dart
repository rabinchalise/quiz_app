import 'package:flutter/material.dart';
import 'package:quiz/data/question_data.dart';
import 'package:quiz/question_screeen.dart';
import 'package:quiz/result_screen.dart';
import 'package:quiz/welcome_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start_screen';
  List<String> selectedAnswer = [];

/*
 1st approach to change screen
--- we cannot pass value at initilazing so we make initState ---
  // Widget activeScreen;
  // @override
  // void initState() {
  //   activeScreen = WelcomeScreen(startQuiz: changeScreen);
  //   super.initState();
  // } */

  void changeScreen() {
    setState(() {
      activeScreen = 'question_screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == question.length) {
      setState(() {
        activeScreen = 'result_screen';
      });
    }
  }

  void restartScreen() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'question_screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = WelcomeScreen(startQuiz: changeScreen);

    if (activeScreen == 'question_screen') {
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'result_screen') {
      screenWidget =
          ResultScreen(choosenAnswer: selectedAnswer, onTap: restartScreen);
    }

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.deepPurple.shade300,
        Colors.deepPurple.shade100
      ])),

      // second apporach to change screen
      //child: activeScreen == 'start_screen' // teranry apporach
      //     ? WelcomeScreen(startQuiz: changeScreen)
      //     : const QuestionScreen(),
      child: screenWidget,
    ));
  }
}
