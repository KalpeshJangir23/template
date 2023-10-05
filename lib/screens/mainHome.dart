import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:template/screens/Breathing.dart';
import 'package:template/screens/colorsutil.dart';
import 'package:template/screens/customContainer.dart';
import 'package:template/screens/quiz_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

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
    void _showAlert(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Elon Musk"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Intro:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Elon Musk is an entrepreneur, engineer, and inventor known for his role in several groundbreaking technology companies. He was born on June 28, 1971, in Pretoria, South Africa. Musk is the CEO of SpaceX, Tesla, Inc., Neuralink, and The Boring Company.",
                ),
                const SizedBox(height: 16),
                const Text(
                  "Upcoming Things:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Elon Musk is known for his ambitious projects, and there are several exciting developments on the horizon. These include SpaceX's plans for Mars colonization, Tesla's advancements in electric vehicles and self-driving technology, and Neuralink's work on brain-computer interfaces.",
                ),
                const SizedBox(height: 16),
                InkWell(
                  child: const Text(
                    "Learn more about Elon Musk",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () {
                    // You can add functionality to open a URL about Elon Musk here.
                    // For simplicity, this example doesn't implement URL navigation.
                  },
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    final Uri _url = Uri.parse('https://flutter.dev');

    void _show(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Flutter"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Intro:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Flutter is an open-source UI software development toolkit created by Google. It is used to build natively compiled applications for mobile, web, and desktop from a single codebase. Flutter was first released in May 2017 and has gained popularity for its fast development, expressive UI, and vibrant community.",
                ),
                const SizedBox(height: 16),
                const Text(
                  "Key Features:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "1. Fast development with hot reload.\n"
                  "2. Expressive and flexible UI components.\n"
                  "3. Single codebase for multiple platforms.\n"
                  "4. Access to native features and APIs.\n"
                  "5. A rich ecosystem of packages and plugins.",
                ),
                const SizedBox(height: 16),
                InkWell(
                  child: const Text(
                    "Learn more about Flutter",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () {
                    //_launchUrl();  // Call the _launchUrl function when tapped
                  },
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    // Function to launch a URL
    Future<void> _launchUrl() async {
      if (await canLaunch(_url.toString())) {
        await launch(_url.toString());
      } else {
        throw 'Could not launch $_url';
      }
    }

    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xff2D363F),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Hi Rahul",
                    style: GoogleFonts.exo(color: textColor, fontSize: 20),
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
              const Text(
                "For You",
                style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "Recommended based on your Intreset & activity",
                style: GoogleFonts.exo(fontSize: 14, color: Colors.white),
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
                            GestureDetector(
                              onTap: () => _showAlert(context),
                              child: const CustomContainer(
                                imagePath: "assets/elonMusk.png",
                                radius: 50,
                                textContainer: "Elon Musk",
                                textContainer2: "Not everyone needs to be a programmer, but everyone can benefit from learning to code",
                              ),
                            ),
                            GestureDetector(
                              onTap: () => _show(context),
                              child: const CustomContainer(
                                imagePath: "assets/flutter.png",
                                radius: 50,
                                textContainer: "Flutter Dev",
                                textContainer2: "Make some incredible applications via Flutter",
                              ),
                            ),
                            const CustomContainer(
                              imagePath: "assets/ai2.png",
                              radius: 50,
                              textContainer: "Artificial Intelligence",
                              textContainer2:
                                  "Empowering Tomorrow with AI: Innovation, Intelligence, and Impact for a Brighter and Smarter Future Together.",
                            ),
                            const CustomContainer(
                              imagePath: "assets/jwst.png",
                              radius: 50,
                              textContainer: "JWST",
                              textContainer2:
                                  "Unveiling the Universe's Secrets with Precision, Persistence, and Perseverance, Beyond the Stars We Know",
                            ),
                            const CustomContainer(
                              imagePath: "assets/psy.png",
                              radius: 50,
                              textContainer: "Psychology",
                              textContainer2: "Exploring the Depths of Human Psyche, Transforming the Way We Live and Understand",
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
                      style: GoogleFonts.exo(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 31),
                    ),
                    const Text(
                      "Topic",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: hobbies.map((hobby) => hobbyContainer(hobby)).toList(),
                    ),
                    const SizedBox(height: 20),
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
                          GestureDetector(
                            onDoubleTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Scaffold(body: Breathing())));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: LottieBuilder.network(
                                "https://assets6.lottiefiles.com/private_files/lf30_i2pyppik.json",
                                height: 90,
                                width: 120,
                              ),
                            ),
                          ),
                          Text(
                            "Complete Your\nMedation ",
                            softWrap: true,
                            style: GoogleFonts.exo(color: textColor, fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white54, width: 2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "Are you ready to take your career in Flutter?",
                              style: TextStyle(fontSize: 20, color: textColor),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white, // Set the background color of the button
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => QuizScreen()));
                              },
                              child: const Text(
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
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          color: const Color(0xff333F4B), borderRadius: BorderRadius.circular(12), boxShadow: const [BoxShadow(blurRadius: 1, color: Colors.white)]),
      child: Text(
        hobby,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
