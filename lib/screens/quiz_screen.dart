import 'package:flutter/material.dart';
import 'dart:async';

import 'package:template/screens/colorsutil.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  List<Map<String, dynamic>> questions = [
    {
      'question': 'What is the capital of Python?',
      'options': ['Py', 'Pyc', 'Pyth', 'None of the above'],
      'correctAnswerIndex': 1,
    },
    {
      'question': 'Which programming language is known for its high performance and is often used for system-level programming?',
      'options': ['Python', 'Java', 'C', 'Ruby'],
      'correctAnswerIndex': 2,
    },
    {
      'question': 'What does HTML stand for?',
      'options': ['Hypertext Markup Language', 'Hyper Transfer Markup Language', 'High-Level Text Markup Language', 'Home Tool Markup Language'],
      'correctAnswerIndex': 0,
    },
    {
      'question': 'Which of the following is a JavaScript framework for building user interfaces?',
      'options': ['JavaFX', 'React', 'Angular', 'Swift'],
      'correctAnswerIndex': 1,
    },
  ];

  int selectedAnswerIndex = -1;
  int score = 0;
  bool isTimerRunning = false;
  int timerSeconds = 10;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (timerSeconds > 0) {
          timerSeconds--;
        } else {
          timer.cancel();
          isTimerRunning = false;
          if (selectedAnswerIndex == -1) {
            moveToNextQuestion();
          }
        }
      });
    });
    isTimerRunning = true;
  }

  void moveToNextQuestion() {
    setState(() {
      selectedAnswerIndex = -1;
      timerSeconds = 10;
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
        startTimer();
      } else {
        showResult();
      }
    });
  }

  void showResult() {
    int finalScore = score;
    for (int i = 0; i < questions.length; i++) {
      if (questions[i]['correctAnswerIndex'] == selectedAnswerIndex) {
        finalScore += 5;
      }
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Quiz Complete'),
          content: Text('Your Score: $finalScore / ${questions.length * 5}'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                restartQuiz();
              },
              child: Text('Restart Quiz'),
            ),
          ],
        );
      },
    );
  }

  void restartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      selectedAnswerIndex = -1;
      score = 0;
    });
    Navigator.pop(context);
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Widgetbackground,
      appBar: AppBar(
        title: Text('Quiz'),
        backgroundColor: Widgetbackground,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Question ${currentQuestionIndex + 1}:',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              questions[currentQuestionIndex]['question'],
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: textColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(offset: Offset(-10, 10), blurRadius: 10, color: Colors.white.withOpacity(0.5)),
                ],
              ),
              child: Column(
                children: List<Widget>.generate(
                  4,
                  (index) => RadioListTile<int>(
                    title: Text(
                      questions[currentQuestionIndex]['options'][index],
                      style: TextStyle(color: Widgetbackground),
                    ),
                    value: index,
                    activeColor: Colors.white,
                    groupValue: selectedAnswerIndex,
                    onChanged: (int? value) {
                      setState(() {
                        selectedAnswerIndex = value!;
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Time Left: $timerSeconds seconds',
              style: TextStyle(fontSize: 16, color: textColor),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                if (timerSeconds <= 0) {
                  moveToNextQuestion();
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF4B39EF), // Background color (black)
              ),
              child: Text(
                'Next',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
