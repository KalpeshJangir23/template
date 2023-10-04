import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/screens/Triviascreen.dart';

enum Direction { left, right }

class Card {
  final int index;
  final int zIndex;
  final Direction direction;
  final Color color;

  Card({required this.index, required this.zIndex, required this.direction, required this.color});
}

class Screens extends StatefulWidget {
  const Screens({super.key});

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: TriviaScreen(),
    );
  }
}
