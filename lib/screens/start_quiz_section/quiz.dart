import 'package:flutter/material.dart';
import 'package:template/screens/start_quiz_section/answer.dart';
import 'package:template/screens/start_quiz_section/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(
          questions[questionIndex]['questionText'].toString(),
        ),
        const SizedBox(
          height: 40,
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text'].toString());
        }).toList()
      ],
    );
  }
}
