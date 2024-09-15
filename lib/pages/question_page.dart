import 'package:flutter/material.dart';
import 'package:quiz_time/constants/colors.dart';
import 'package:quiz_time/data/questions.dart';
import 'package:quiz_time/widgets/answer_button.dart';
import 'package:quiz_time/widgets/question_text.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({
    super.key,
    required this.onSelectAnswer,
  });
  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            QuestionText(text: currentQuestion.text),
            const SizedBox(height: 20),
            ...currentQuestion.getShuffledAnswers().map(
              (item) {
                return AnswerButton(
                  text: item,
                  onPressed: () => answerQuestion(item),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
