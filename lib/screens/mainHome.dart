import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:template/screens/colorsutil.dart';
import 'package:template/screens/customContainer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> hobbies = [
    "Reading",
    "Painting",
    "Cooking",
    "Hiking",
    "Gaming",
    "Traveling",
    "Photography",
    "Cycling",
    "Fishing",
    "Dancing",
    "Swimming",
    // Add more hobbies as needed
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xff2D363F),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "User Name",
                    style: TextStyle(color: textColor, fontSize: 20),
                  ),
                  Expanded(child: Container()),
                  Image.asset(
                    "assets/flame.png",
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.notifications,
                    color: textColor,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "For You",
                style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "Recommended based on your Intreset & activity",
                style: TextStyle(color: textColor, fontSize: 13, fontWeight: FontWeight.bold),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18),
                          bottomLeft: Radius.circular(18),
                          bottomRight: Radius.circular(18),
                          topRight: Radius.circular(18),
                        ),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            const CustomContainer(
                              imagePath: "assets/elonMusk.png",
                              radius: 50,
                              textContainer: "Elon Musk",
                              textContainer2: "Not everyone needs to be a programmer, but everyone can benefit from learning to code",
                            ),
                            const CustomContainer(
                              imagePath: "assets/elonMusk.png",
                              radius: 50,
                              textContainer: "Elon Musk",
                              textContainer2: "Not everyone needs to be a programmer, but everyone can benefit from learning to code",
                            ),
                            const CustomContainer(
                              imagePath: "assets/elonMusk.png",
                              radius: 50,
                              textContainer: "Elon Musk",
                              textContainer2: "Not everyone needs to be a programmer, but everyone can benefit from learning to code",
                            ),
                            const CustomContainer(
                              imagePath: "assets/elonMusk.png",
                              radius: 50,
                              textContainer: "Elon Musk",
                              textContainer2: "Not everyone needs to be a programmer, but everyone can benefit from learning to code",
                            ),
                            const CustomContainer(
                              imagePath: "assets/elonMusk.png",
                              radius: 50,
                              textContainer: "Elon Musk",
                              textContainer2: "Not everyone needs to be a programmer, but everyone can benefit from learning to code",
                            ),
                            Container(
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.navigate_next_sharp,
                                    color: textColor,
                                  ),
                                  Text(
                                    "View all",
                                    style: TextStyle(color: textColor),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Explore",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    Text(
                      "Topic",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: hobbies.map((hobby) => hobbyContainer(hobby)).toList(),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 370,
                      height: 100,
                      decoration: BoxDecoration(color: Widgetbackground, borderRadius: BorderRadius.circular(10), boxShadow: const [
                        BoxShadow(
                          color: Colors.transparent,
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        )
                      ]),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: LottieBuilder.network(
                              "https://assets6.lottiefiles.com/private_files/lf30_i2pyppik.json",
                              height: 90,
                              width: 120,
                            ),
                          ),
                          const Text(
                            "Complete Your\nMedation ",
                            softWrap: true,
                            style: TextStyle(color: textColor, fontSize: 33, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white54, width: 2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Are you ready to take your career in Flutter?",
                              style: TextStyle(fontSize: 20, color: textColor),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white, // Set the background color of the button
                              ),
                              onPressed: () {
                                // Add your action here
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
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Widget hobbyContainer(String hobby) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      margin: EdgeInsets.all(1),
      decoration: BoxDecoration(color: Color(0xff333F4B), borderRadius: BorderRadius.circular(12), boxShadow: const [
        BoxShadow(
          blurRadius: 1,
        )
      ]),
      child: Text(
        hobby,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
