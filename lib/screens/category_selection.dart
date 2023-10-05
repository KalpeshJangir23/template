import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:template/screens/colorsutil.dart';
import 'package:template/screens/start_quiz_section/main_screen.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    String? selectedCategory;
    return SafeArea(
      child: Scaffold(
          backgroundColor: mainColor,
          body: Column(
            children: [
              Text(
                'Where do you stand on the education ladder?',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: textColor),
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                'assets/ai.png',
                width: 250,
                height: 250,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Select your category:',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 16),
                    ListTile(
                      title: Text('10th Passout', style: TextStyle(color: textColor)),
                      leading: Radio(
                        activeColor: textColor,
                        value: '10th Passout',
                        groupValue: selectedCategory,
                        onChanged: (value) {
                          setState(() {
                            selectedCategory = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('12th/College Student', style: TextStyle(color: textColor)),
                      leading: Radio(
                        activeColor: textColor,
                        value: '12th/College Student',
                        groupValue: selectedCategory,
                        onChanged: (value) {
                          setState(() {
                            selectedCategory = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Working Professional',
                        style: TextStyle(color: textColor),
                      ),
                      leading: Radio(
                        activeColor: textColor,
                        value: 'Working Professional',
                        groupValue: selectedCategory,
                        onChanged: (value) {
                          setState(() {
                            selectedCategory = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        if (selectedCategory != null && selectedCategory!.isNotEmpty) {
                          // Perform an action based on the selected category
                          print('Selected Category: $selectedCategory');
                        } else {
                          // Show an error or prompt to select a category
                          print('Please select a category');
                        }
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const MainScreen();
                        }));
                      },
                      child: Text('Continue'),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
