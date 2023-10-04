import 'package:flutter/material.dart';
import 'package:template/screens/colorsutil.dart';
import 'package:template/screens/coursepage.dart';
import 'package:template/screens/screen3.dart';
import 'package:template/screens/video4.dart';

class Pagex extends StatelessWidget {
  const Pagex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: mainColor,
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Screen3()),
                      ),
                      child: const Icon(
                        Icons.backspace_outlined,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "Graphic Designer",
                      style: TextStyle(
                        fontSize: 15,
                        color: textColor,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: const Video4(),
                  ),
                ),
                const Card1(
                  title: "Animation Fundamentals",
                  content:
                      "Delve deeper into animation to grasp its core concepts. Animation plays a vital role in enhancing user experiences and web interfaces. You'll explore key animation principles and techniques, essential for creating captivating web interactions.",
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Next Video",
                  style: TextStyle(
                    fontSize: 15,
                    color: textColor,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                for (var i = 1; i <= 6; i++) Card2(iii: "I$i"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Card2 extends StatelessWidget {
  final String iii;
  const Card2({
    Key? key,
    required this.iii,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: 80,
        width: 400,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white54, width: 2),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Widgetbackground,
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/gfg.png'),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              "Animation class $iii",
              style: const TextStyle(fontSize: 15, color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}

class Card1 extends StatelessWidget {
  final String title;
  final String content;
  const Card1({
    Key? key,
    required this.content,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      //padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 20, color: textColor),
              ),
              const SizedBox(
                height: 9,
              ),
              Text(
                content,
                style: const TextStyle(fontSize: 13, color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
