import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:template/bottomNavigation.dart';
import 'package:template/screens/colorsutil.dart';
import 'package:template/screens/userChoice.dart';

class UserSelection extends StatefulWidget {
  const UserSelection({super.key});

  @override
  State<UserSelection> createState() => _UserSelectionState();
}

class _UserSelectionState extends State<UserSelection> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: mainColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "What are you\ninterested in ?",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: textColor),
              ),
              const Text(
                "Follow 2 or more topic. You will get tailored/nideas. You can edit this at any time",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: textColor),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Hobbies: ",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: textColor),
              ),
              const UserChoice(category: 'Hobbies'),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Programming: ",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: textColor),
              ),
              const UserChoice(category: 'Programming'),
              const Text(
                "Graphic Design: ",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: textColor),
              ),
              const UserChoice(category: 'Graphic Design'),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Set the background color of the button
                ),
                onPressed: () {
                  // Add your action here
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNavigationScreen(), // Replace SecondScreen with your destination screen
                    ),
                  );
                },
                child: const Text(
                  "Yes, Let's Go!",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
