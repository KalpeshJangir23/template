import 'package:flutter/material.dart';
import 'package:template/screens/colorsutil.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.only(bottom: 50, top: 30),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 30, color: textColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
