import 'package:flutter/material.dart';

import 'package:quiz/data/question_data.dart';
import 'package:quiz/question_summary.dart';
import 'package:quiz/styled_text.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.choosenAnswer, required this.onTap});

  final List<String> choosenAnswer;
  final void Function() onTap;

// in flutter Object allows to acess different kinds of value
  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < choosenAnswer.length; i++) {
      // loop body
      summary.add({
        'question_index': i,
        'question': question[i].question,
        'correct_answer': question[i].answer[0],
        'user_answer': choosenAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = question.length;
    final numCorrectQuestion = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length; // where is used to filter list based on orginal list;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          StyledText(
            text:
                'You answered $numCorrectQuestion out of $numTotalQuestions correctly!',
            size: 24,
            color: Colors.deepPurple,
          ),
          const SizedBox(height: 30),
          QuestionSummary(summaryData: summaryData),
          const SizedBox(height: 30),
          TextButton.icon(
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              onPressed: onTap,
              icon: const Icon(
                Icons.refresh,
              ),
              label: const StyledText(text: 'Restart Quiz!', size: 18))
        ]),
      ),
    );
  }
}
