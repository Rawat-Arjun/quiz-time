import 'package:flutter/material.dart';
import 'package:quiz_time/data/questions.dart';
import 'package:quiz_time/widgets/question_summary.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    super.key,
    required this.chosenAnswer,
  });

  final List<String> chosenAnswer;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
                'You answered X out of ${questions.length} questions correctly !'),
            QuestionSummary(summaryData: getSummaryData()),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Restart Quiz !'),
            ),
          ],
        ),
      ),
    );
  }
}
