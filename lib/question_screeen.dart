import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/data/question_data.dart';
import 'my_button.dart';

// var randomizer = Random();

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentAnswerIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      // currentAnswerIndex = randomizer.nextInt(5) + 1;
      // currentAnswerIndex += 1;
      currentAnswerIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isPotrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final currentQuestion = question[currentAnswerIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: isPotrait ? const EdgeInsets.all(40) : const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQuestion.question,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 30),
            ...currentQuestion.shuffledAnswers

                //... widget added individually
                .map((item) => MyButton(
                    answerText: item,
                    onPressed: () {
                      answerQuestion(item);
                    }))
          ],
        ),
      ),
    );
  }
}
