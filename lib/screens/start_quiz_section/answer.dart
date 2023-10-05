import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 350,
          height: 60,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Color(0xFF4B39EF), // change background color of button
              foregroundColor: Colors.white,
              // change text color of button
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Text(
              answerText,
              style: TextStyle(fontSize: 20),
            ),
            onPressed: selectHandler,
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
