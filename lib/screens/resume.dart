import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:template/screens/colorsutil.dart';
import 'package:template/screens/custom_text_field.dart';

class ResumePage extends StatefulWidget {
  const ResumePage({Key? key}) : super(key: key);

  @override
  _ResumePageState createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  bool isEditing = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController education11th = TextEditingController();
  TextEditingController education12th = TextEditingController();
  TextEditingController professionSummary = TextEditingController();
  TextEditingController education = TextEditingController();
  TextEditingController objective = TextEditingController();
  TextEditingController skills = TextEditingController();

  TextEditingController sportActivity = TextEditingController();
  TextEditingController projects = TextEditingController();
  TextEditingController otherField = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the text fields with default values
    nameController.text = 'John Doe';
    emailController.text = 'john.doe@example.com';
    experienceController.text = '5 years of experience in software development';
    professionSummary.text = 'Dedicated and hardworking, TeamLeader';
    education.text = 'BITS GOA';
    objective.text = 'A highly motivated and hardworking individual looking for a responsible role in a reputable organization.';
    skills.text = 'Microsoft Excel, Problem Solving, Time Management';
    education11th.text = 'High School, XYZ School, 11th Grade';
    education12th.text = 'High School, XYZ School, 12th Grade';
    sportActivity.text = 'Football, Chess';
    projects.text = 'Project A: Description of Project A\nProject B: Description of Project B';
    otherField.text = 'Any other relevant information goes here';
  }

  void toggleEditing() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  void saveChanges() {
    setState(() {
      isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    "Profile Page",
                    style: TextStyle(fontSize: 30, color: textColor),
                  ),
                ),
                CustomTextField(
                  hintText: 'Name',
                  controller: nameController,
                  enabled: isEditing,
                  maxLine: 1,
                  showDiv: true,
                ),
                CustomTextField(
                  hintText: 'Email',
                  controller: emailController,
                  enabled: isEditing,
                  maxLine: 1,
                  showDiv: true,
                ),
                CustomTextField(
                  hintText: 'Professional Summary',
                  controller: professionSummary,
                  enabled: isEditing,
                  maxLine: 1,
                  showDiv: true,
                ),
                CustomTextField(
                  hintText: 'Education',
                  controller: education,
                  enabled: isEditing,
                  maxLine: 1,
                  showDiv: true,
                ),
                CustomTextField(
                  hintText: 'Objective',
                  controller: objective,
                  enabled: isEditing,
                  maxLine: 2,
                  showDiv: true,
                ),
                CustomTextField(
                  hintText: 'Skills',
                  controller: skills,
                  enabled: isEditing,
                  maxLine: 2,
                  showDiv: true,
                ),
                CustomTextField(
                  hintText: 'Experience',
                  controller: experienceController,
                  enabled: isEditing,
                  maxLine: 2,
                  showDiv: true,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: toggleEditing,
                      child: Text(
                        isEditing ? 'Cancel' : 'Edit',
                        style: TextStyle(
                          color: mainColor,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: saveChanges,
                      child: Text(
                        'Save',
                        style: TextStyle(
                          color: mainColor,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: textColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      final pdfPath = await generatePdf();
                      Share.shareFiles([pdfPath], text: 'Share your resume via:');
                    },
                    child: Text(
                      'Generate & Share Resume',
                      style: TextStyle(
                        color: mainColor,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String> generatePdf() async {
    final pdf = pw.Document();

    // Add content to the PDF
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Column(
              children: [
                pw.Text(
                  nameController.text,
                  style: pw.TextStyle(fontSize: 24.0, fontWeight: pw.FontWeight.bold),
                ),
                pw.Text(
                  professionSummary.text,
                  style: pw.TextStyle(fontSize: 18.0),
                ),
                pw.SizedBox(height: 20.0),
                pw.Text('Summary: ${objective.text}'),
                pw.Text('Education: ${education.text}'),
                pw.Text('Skills: ${skills.text}'),
                pw.Text('Experience: ${experienceController.text}'),
                pw.Text('11th Grade: ${education11th.text}'),
                pw.Text('12th Grade: ${education12th.text}'),
                pw.Text('Sport Activity: ${sportActivity.text}'),
                pw.Text('Projects:\n${projects.text}'),
                pw.Text('Other: ${otherField.text}'),
              ],
            ),
          );
        },
      ),
    );

    // Get the document directory
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/resume.pdf';

    // Save the PDF to a file
    final file = File(path);
    await file.writeAsBytes(await pdf.save());

    return path;
  }
}
