import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/screens/Triviascreen.dart';
import 'package:template/screens/colorsutil.dart';
import 'package:template/screens/coursepage.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: mainColor,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 2,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white54, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "TODO",
                          style: TextStyle(fontSize: 20, color: textColor),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white, // Set the background color of the button
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ScreenUtilInit(child: TriviaScreen())),
                            );
                          },
                          child: Text(
                            "Yes, Let's Go!",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const CoursePage(),
              ],
            ),
          )),
    );
  }
}
