import 'package:flutter/material.dart';


class StoryWidget extends StatelessWidget {
  final String username, url;
  const StoryWidget({Key? key, required this.username, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.pink, width: 3)),
              ),
              //  CircleStory(url: url,)
              Padding(
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
              ),
            ],
          ),
        ),
        Text(
          username,
          style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
        ),
      ],
    );
  }
}