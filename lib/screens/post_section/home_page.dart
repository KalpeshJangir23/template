import 'package:flutter/material.dart';
import 'package:template/commutines.dart';
import 'package:template/screens/colorsutil.dart';
import 'package:template/screens/post_section/post_card.dart';
import 'package:template/screens/post_section/story_widget.dart';

class InstaScreen extends StatelessWidget {
  final List _stories = ['story 1', 'story 2', 'story 3', 'story 4', 'story 5'];
  final List _posts = ['post 1', 'post 2', 'post 3', 'post 4', 'post 5'];
  final List _postUrl = [
    'https://images.pexels.com/photos/2899097/pexels-photo-2899097.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://images.pexels.com/photos/2820884/pexels-photo-2820884.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://img.freepik.com/premium-photo/random-best-photo_865967-223915.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZqJRIVnFMkvHIFz2Px6HByJYri6iUGPwDF2U8aHl8BZh31Wk3cUDAe9Yw2XUUEaevsXg&usqp=CAU'
  ];
  final List _userName = ['Layla', 'Reshma', 'Rahul', 'Ajay', 'Soham'];
  InstaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "App Name",
                    style: TextStyle(color: const Color.fromARGB(255, 228, 224, 224), fontSize: 25),
                  ),
                  Expanded(child: Container()),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CommunityScreen(), // Replace SecondScreen with your destination screen
                      ),
                    ),
                    child: Icon(
                      Icons.message,
                      color: const Color.fromARGB(255, 228, 224, 224),
                      size: 25,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
            Container(
              color: Colors.grey.shade700,
              height: 1,
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                  itemCount: _stories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return StoryWidget(
                      username: _stories[index],
                      url: _postUrl[index],
                    );
                  }),
            ),
            Container(
              color: Colors.grey.shade700,
              height: 1,
              width: MediaQuery.of(context).size.width,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _posts.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return PostCart(
                      userName: _userName[index],
                      url: _postUrl[index],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
