import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.textContainer, required this.imagePath, required this.radius, required this.textContainer2});
  final String imagePath;
  final double radius;
  final String textContainer;
  final String textContainer2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: 300,
        height: 250,
        decoration: const BoxDecoration(
          color: Color(0xff333F4B),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            bottomLeft: Radius.circular(18),
            bottomRight: Radius.circular(18),
            topRight: Radius.circular(18),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(-10, 10),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Container(
              height: radius * 2,
              width: radius * 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radius),
                child: Image.asset(
                  imagePath,
                  width: radius * 2,
                  height: radius * 2,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              textContainer,
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                textContainer2,
                softWrap: true,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
