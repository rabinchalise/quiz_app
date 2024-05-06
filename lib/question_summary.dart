import 'package:flutter/material.dart';

import 'package:quiz/summary_item.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    final isPotrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return SizedBox(
      height: isPotrait ? 400 : 200,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData
              .map((data) => Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: SummaryItem(
                      itemData: data,
                    ),
                  ))
              .toList(), // coverting iterable  to list of widgets
        ),
      ),
    );
  }
}
