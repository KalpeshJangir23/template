import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhase {
    var resultText = 'you did it !';

    if (resultScore >= 31) {
      resultText = 'It seems you have interest in Science';
    } else if (resultScore < 31 && resultScore >= 15) {
      resultText = 'It seems you have interest in Literature';
    } else {
      resultText = 'It seems you have interest in Sociology';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 280),
          child: Text(
            resultPhase,
            style: GoogleFonts.exo(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(onPressed: resetHandler, child: Text('Restart Quiz', style: GoogleFonts.exo(color: Color(0xFFF1EFEF),),),),
      ]),
    );
  }
}