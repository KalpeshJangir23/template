import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:template/screens/screen1.dart';
import 'package:template/screens/screen3.dart';
import 'package:template/screens/screen4.dart';

import 'screens/screen2.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  var Index = 0;

  final List<Widget> screens = [
    const Screen1(),
    const Screen2(),
    const Screen3(),
    const Screen4(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: Colors.green,
        items: const <Widget>[
          Icon(Icons.home, size: 30),
          Icon(
            Icons.functions_outlined,
            size: 30,
          ),
          Icon(Icons.abc_outlined, size: 30),
          Icon(Icons.ac_unit_rounded, size: 30),
        ],
        onTap: (index) {
          setState(() {
            Index = index;
          });
        },
      ),
      body: screens[Index],
    );
  }
}