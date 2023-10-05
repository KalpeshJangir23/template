import 'dart:math';

import 'package:flutter/material.dart';
// import 'pages/heatmap_calendar_example.dart';
// import 'pages/heatmap_example.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class GithubGraph extends StatefulWidget {
  const GithubGraph({super.key});

  @override
  State<GithubGraph> createState() => _GithubGraphState();
}

class _GithubGraphState extends State<GithubGraph> {
  @override
  Widget build(BuildContext context) {
    return HeatMap(
      datasets: {
        DateTime(2023, 8, 6): 3,
        DateTime(2023, 8, 7): 7,
        DateTime(2023, 8, 8): 10,
        DateTime(2023, 8, 9): 13,
        DateTime(2023, 8, 15): 13,
        DateTime(2023, 8, 20): 13,
        DateTime(2023, 9, 13): 6,
        DateTime(2023, 9, 14): 15,
        DateTime(2023, 9, 23): 13,
        DateTime(2023, 9, 27): 5,
        DateTime(2023, 10, 1): 11,
        DateTime(2023, 10, 2): 10,
        DateTime(2023, 10, 4): 8,
        DateTime(2023, 10, 5): 16,
        DateTime(2023, 10, 6): 15,
        DateTime(2023, 10, 8): 4,
        DateTime(2023, 10, 10): 2,
        DateTime(2023, 10, 11): 1,
        DateTime(2023, 10, 12): 11,
        DateTime(2023, 10, 13): 10,
        DateTime(2023, 10, 14): 9,
        DateTime(2023, 10, 16): 7,
        DateTime(2023, 10, 18): 5,
        DateTime(2023, 10, 19): 4,
        DateTime(2023, 10, 21): 12,
        DateTime(2023, 10, 22): 13,
        DateTime(2023, 10, 23): 14,
        DateTime(2023, 10, 25): 16,
        DateTime(2023, 10, 27): 18,
        DateTime(2023, 10, 28): 19,
        DateTime(2023, 10, 29): 20,
        DateTime(2023, 10, 30): 30,
      },
      colorMode: ColorMode.opacity,
      startDate: DateTime(DateTime.now().year, 8, 1),
      endDate: DateTime.now(),
      showText: false,
      textColor: Colors.white,
      scrollable: true,
      colorsets: {
        1: Colors.green,
        3: Colors.orange,
        5: Colors.yellow,
        7: Colors.green,
        9: Colors.blue,
        11: Colors.indigo,
        13: Colors.purple,
      },
    );
  }
}
