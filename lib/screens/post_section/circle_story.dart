import 'package:flutter/material.dart';

class CircleStory extends StatelessWidget {
  final String url;
  const CircleStory({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(6.0),
      child: ClipOval(
        child: Image(
          height: 68,
          width: 68,
          image: NetworkImage(
            url, 
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}