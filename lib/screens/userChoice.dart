import 'package:flutter/material.dart';
import 'package:template/screens/colorsutil.dart';

class UserChoice extends StatefulWidget {
  final String category;

  const UserChoice({super.key, required this.category});

  @override
  State<UserChoice> createState() => _UserChoiceState();
}

class _UserChoiceState extends State<UserChoice> {
  late List<bool> selectedItems;
  List<String> hobbies = [];
  List<String> programmingHobbies = [];
  List<String> graphicDesignHobbies = [];

  @override
  void initState() {
    super.initState();

    hobbies = [
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

    programmingHobbies = [
      "Reading programming books",
      "Coding challenges",
      "Open source contribution",
      "Building web applications",
      "Game development",
      "Machine learning",
      "Data analysis",
      "Ethical hacking",
      "Mobile app development",
      "Blockchain development",
      "Embedded systems programming",
      "Artificial intelligence",
      "Robotics programming",
      "Internet of Things (IoT) projects",
      "Developing chatbots",
      "Web scraping",
      "Virtual reality (VR) development",
      "Augmented reality (AR) development",
      "Firmware programming",
      // Add more programming-related hobbies as needed
    ];

    graphicDesignHobbies = [
      "Adobe Photoshop",
      "Illustrator",
      "Logo Design",
      "Typography",
      "UI/UX Design",
      "Digital Illustration",
      "Print Design",
      "Brand Identity",
      "Motion Graphics",
      // Add more graphic design-related hobbies
    ];

    selectedItems = List.filled(
        widget.category == 'Hobbies'
            ? hobbies.length
            : widget.category == 'Programming'
                ? programmingHobbies.length
                : graphicDesignHobbies.length,
        false);
  }

  void toggleContainer(int index) {
    setState(() {
      selectedItems[index] = !selectedItems[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> currentCategory = widget.category == 'Hobbies'
        ? hobbies
        : widget.category == 'Programming'
            ? programmingHobbies
            : graphicDesignHobbies;

    return Wrap(
      spacing: 50.0,
      children: List.generate(currentCategory.length, (index) {
        return GestureDetector(
          onTap: () {
            toggleContainer(index); // Toggle color on tap
          },
          child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white54, width: 2),
              borderRadius: BorderRadius.circular(12),

              color: selectedItems[index]
                  ? Colors.amber // Selected color
                  : Colors.transparent, // Default color
            ),
            child: Text(
              currentCategory[index],
              style: TextStyle(color: textColor),
            ),
          ),
        );
      }),
    );
  }
}
