import 'package:flutter/material.dart';
import 'package:quiz_time/constants/colors.dart';

class QuestionText extends StatelessWidget {
  const QuestionText({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 40,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
          color: questionColor,
        ),
      ),
    );
  }
}
