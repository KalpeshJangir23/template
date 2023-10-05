import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:template/bottomNavigation.dart';
import 'package:template/screens/colorsutil.dart';
import 'package:template/screens/start_quiz_section/quiz.dart';
import 'package:template/screens/start_quiz_section/result.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _questions = const [
    {
      'questionText': 'What is your favorite subject among these?',
      'answers': [
        {'text': 'Mathematics', 'score': 15},
        {'text': 'Science', 'score': 10},
        {'text': 'Social Studies', 'score': 5},
        {'text': 'English', 'score': 1}
      ],
    },
    {
      'questionText': 'What kind of activities do you enjoy the most?',
      'answers': [
        {'text': 'Solving complex problems', 'score': 10},
        {'text': 'Conducting experiments', 'score': 5},
        {'text': 'Researching history and culture', 'score': 1},
        {'text': 'Reading literature', 'score': 15}
      ],
    },
    {
      'questionText': 'What are your career interests?',
      'answers': [
        {'text': 'Engineering or Technology', 'score': 5},
        {'text': 'Medicine or Biology', 'score': 15},
        {'text': 'History or Sociology', 'score': 10},
        {'text': 'Arts or Literature', 'score': 10}
      ],
    },
    {
      'questionText': 'Which extracurricular activity do you prefer?',
      'answers': [
        {'text': 'Math or Science clubs', 'score': 1},
        {'text': 'Science exhibitions', 'score': 1},
        {'text': 'Debates or Model UN', 'score': 15},
        {'text': 'Creative writing or drama club', 'score': 5}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;

    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("We have more question !");
    } else {
      print("No more options..");
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Widgetbackground),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Quiz App'),
        //   backgroundColor: Colors.amber,
        // ),
        body: _questionIndex < _questions.length
            ? Quiz(answerQuestion: _answerQuestion, questionIndex: _questionIndex, questions: _questions)
            : Center(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(244, 42),
                        backgroundColor: textColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                        )),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const BottomNavigationScreen();
                      }));
                    },
                    child: Text(
                      "Get started",
                      style: GoogleFonts.georama(
                        color: Widgetbackground,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
