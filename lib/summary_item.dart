import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/styled_text.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({
    super.key,
    required this.itemData,
  });
  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final bool isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: isCorrectAnswer
                    ? const Color.fromARGB(255, 63, 148, 67)
                    : Colors.red[400],
                borderRadius: BorderRadius.circular(30)),
            child: Center(
              child: StyledText(
                  text: ((itemData['question_index'] as int) + 1).toString(),
                  size: 16,
                  color: Colors.black),
            )),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['question'] as String,
                style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 5),
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: 'User answer: ',
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: itemData['user_answer'] as String,
                  style: GoogleFonts.lato(
                    color: isCorrectAnswer
                        ? const Color.fromARGB(255, 63, 148, 67)
                        : Colors.red[400],
                    fontWeight: FontWeight.bold,
                  ),
                )
              ])),
              const SizedBox(height: 5),
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: 'Correct answer: ',
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                    text: itemData['correct_answer'] as String,
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent[400]))
              ])),
            ],
          ),
        )
      ],
    );
  }
}
