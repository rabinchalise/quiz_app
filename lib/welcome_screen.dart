import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'styled_text.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key, required this.startQuiz});
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Lottie.asset(
          'assets/images/Animation - 1711117626552.json',
          width: mediaQuery.orientation == Orientation.portrait ? 300 : 200,
        ),
        const SizedBox(height: 80),
        const StyledText(text: 'Learn Flutter the fun way!', size: 24),
        const SizedBox(height: 30),
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: startQuiz,
          label: const StyledText(
            text: 'Start Quiz',
            size: 16,
          ),
          icon: const Icon(Icons.arrow_forward),
        ),
      ]),
    );
  }
}
