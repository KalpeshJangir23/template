import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/screens/colorsutil.dart';
import 'package:template/screens/courseinfopage.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Recommended For You", style: TextStyle(fontSize: 35, color: textColor, decoration: TextDecoration.none)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Pagex())),
                      child: Coursecrd(
                        heading: "Graphics Designer",
                        desc: "Create adaptable websites with CSS media queries.",
                        l: 6,
                        url:
                            "https://img.freepik.com/free-vector/happy-freelancer-with-computer-home-young-man-sitting-armchair-using-laptop-chatting-online-smiling-vector-illustration-distance-work-online-learning-freelance_74855-8401.jpg?w=1380&t=st=1696429504~exp=1696430104~hmac=b0e8c9a0382ae1f877810573acf9a7a9e02f290bc50692cfe7ba66deac00dc9f",
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Coursecrd(
                      heading: "JavaScript",
                      desc: "Master advanced JavaScript concepts for dynamic web apps.",
                      l: 9,
                      url:
                          "https://img.freepik.com/premium-vector/freelancer-with-computer-sitting-using-laptop-distance-work-modern-vector-flat-illustration_720185-22.jpg?w=1060",
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Coursecrd(
                      heading: "Mobile App",
                      desc: "Build cross-platform mobile apps using React Native.",
                      l: 12,
                      url:
                          "https://img.freepik.com/free-vector/group-people-working-together_52683-28615.jpg?w=1380&t=st=1696429572~exp=1696430172~hmac=02a6cfdbf99b5ff247e1a7b5785942b3eec1aa371e0611a783730e774946d506",
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Coursecrd(
                      heading: "Data Science",
                      desc: "Explore AI, data analysis, and predictive modeling.",
                      l: 15,
                      url:
                          "https://img.freepik.com/free-vector/business-people-sharing-ideas_52683-28608.jpg?w=1380&t=st=1696429582~exp=1696430182~hmac=ec167953342e1126b1aba3d8b95f3e5ef5284042a1787992345adb964985f9fd",
                    ),
                  ],
                ),
              ),
              const Text("Popular in DataScience", style: TextStyle(fontSize: 35, color: textColor, decoration: TextDecoration.none)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Coursecrd(
                      heading: "Data Science Basics",
                      desc: "Learn fundamental data science concepts and techniques.",
                      l: 6,
                      url:
                          "https://img.freepik.com/free-vector/business-people-sharing-ideas_52683-28608.jpg?w=1380&t=st=1696429582~exp=1696430182~hmac=ec167953342e1126b1aba3d8b95f3e5ef5284042a1787992345adb964985f9fd",
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Coursecrd(
                      heading: "Machine Learning ",
                      desc: "Discover the principles behind machine learning algorithms.",
                      l: 9,
                      url:
                          "https://img.freepik.com/free-vector/customer-support-flat-illustration_23-2148892786.jpg?w=1380&t=st=1696430768~exp=1696431368~hmac=be1b7a06a853c7dfeae9c77b0ddbf6baeccd1ee42c14441450a8d58d779ded39",
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Coursecrd(
                      heading: "Data Science ",
                      desc: "Apply data science techniques to mobile app development.",
                      l: 12,
                      url:
                          "https://img.freepik.com/free-vector/group-people-working-together_52683-28615.jpg?w=1380&t=st=1696429572~exp=1696430172~hmac=02a6cfdbf99b5ff247e1a7b5785942b3eec1aa371e0611a783730e774946d506",
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Coursecrd(
                      heading: "Advanced AI & ML",
                      desc: "Explore advanced topics in AI and machine learning.",
                      l: 15,
                      url:
                          "https://img.freepik.com/premium-vector/freelancer-with-computer-sitting-using-laptop-distance-work-modern-vector-flat-illustration_720185-22.jpg?w=1060",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Coursecrd extends StatelessWidget {
  final heading;
  final desc;
  final l;
  final url;

  Coursecrd({
    super.key,
    required this.heading,
    required this.desc,
    required this.l,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 220,
        width: 180,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(-10, 10),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              color: Colors.yellow,
              height: 100,
              width: double.maxFinite,
              child: Image.network(
                url,
                scale: 4,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: Text(heading, style: const TextStyle(fontSize: 14, color: Colors.black, decoration: TextDecoration.none)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: Container(
                // color: Colors.greenAccent,
                child: Center(
                    child: Container(
                        width: 150,
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(desc,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                ))))),
                height: 55,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: Container(
                // color: Colors.greenAccent,
                height: 15,
                child: Text("lessons : ${l}", style: const TextStyle(fontSize: 10, color: Colors.black, decoration: TextDecoration.none)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
