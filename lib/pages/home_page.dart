import 'package:flutter/material.dart';
import 'package:quiz_time/constants/colors.dart';
import 'package:quiz_time/data/questions.dart';
import 'package:quiz_time/pages/result_page.dart';
import 'question_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> selectedAnswers = [];

    void chooseAnswer(String answer) {
      selectedAnswers.add(answer);
      if (selectedAnswers.length == questions.length) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ResultPage(
              chosenAnswer: selectedAnswers,
            ),
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Q U I Z',
              style: TextStyle(
                fontSize: 80,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'T I M E',
              style: TextStyle(
                fontSize: 80,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => QuestionPage(
                      onSelectAnswer: chooseAnswer,
                    ),
                  ),
                );
              },
              label: Text(
                'Let\'s Started',
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                ),
              ),
              icon: const Icon(
                Icons.arrow_forward,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
