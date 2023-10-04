import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:template/screens/SelectionPageUser.dart';
import 'package:template/states.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerLazySingleton(() => States());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: UserSelection(),
    );
  }
}

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Resume'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/aa.png'),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'John Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('Web Developer'),
            SizedBox(height: 16),
            Text(
              'Summary:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Experienced web developer with a passion for creating interactive and user-friendly websites. Proficient in HTML, CSS, JavaScript, and Flutter. Strong problem-solving skills and a knack for learning new technologies.',
            ),
            // Add more sections of your resume here
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          sharePdf(context);
        },
        child: const Icon(Icons.share),
      ),
    );
  }
}

class PdfContent extends pw.StatelessWidget {
  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: <pw.Widget>[
        pw.Center(
          child: pw.Image(pw.MemoryImage(
            File('assets/aa.png').readAsBytesSync(),
          )),
        ),
        pw.SizedBox(height: 16),
        pw.Text(
          'John Doe',
          style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
        ),
        pw.Text('Web Developer'),
        pw.SizedBox(height: 16),
        pw.Text(
          'Summary:',
          style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
        ),
        pw.Text(
          'Experienced web developer with a passion for creating interactive and user-friendly websites. Proficient in HTML, CSS, JavaScript, and Flutter. Strong problem-solving skills and a knack for learning new technologies.',
        ),
        // Add more sections of your resume here
      ],
    );
  }
}

Future<void> generateResumePdf() async {
  final pdf = pw.Document();

  pdf.addPage(pw.Page(
    build: (context) => PdfContent(),
  ));

  final output = await getTemporaryDirectory();
  final file = File('${output.path}/resume.pdf');
  await file.writeAsBytes(await pdf.save());
}

void sharePdf(BuildContext context) async {
  await generateResumePdf();
  final pdfPath = (await getTemporaryDirectory()).path + '/resume.pdf';
  Share.shareFiles([pdfPath], text: 'My Resume PDF');
}
