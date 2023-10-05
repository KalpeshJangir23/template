import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:template/screens/colorsutil.dart';
import 'package:template/screens/mainHome.dart';
import 'package:template/screens/post_section/home_page.dart';
import 'package:template/screens/resume.dart';

import 'package:template/screens/screen3.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  var Index = 0;

  final List<Widget> screens = [const HomeScreen(), InstaScreen(), const Screen3(), const ResumePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: mainColor, // Background color when an item is selected
        color: textColor, // Background color when an item is selected
        buttonBackgroundColor: textColor,
        items: const <Widget>[
          Icon(
            Icons.home,
            size: 30,
          ),
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
