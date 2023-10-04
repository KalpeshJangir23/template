import 'package:flutter/material.dart';
import 'package:template/screens/post_section/circle_story.dart';

class PostCart extends StatelessWidget {
  final String userName;
  final String url;
  const PostCart({Key? key, required this.userName, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /////////////////////////////////////////////////////////////////////
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 3),
                  child: SizedBox(
                      height: 55,
                      width: 55,
                      child: CircleStory(
                        url: 'https://images.pexels.com/photos/2899097/pexels-photo-2899097.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                      )),
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  userName,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            )
          ],
        ),
        ///////////////////////////////////////////////////////////////////////////
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Image(
            image: NetworkImage(url),
          ),
        ),
        //////////////////////////////////////////////////////////////////////////
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 2.0),
                    child: Icon(
                      Icons.favorite_outline_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 13.0),
                    child: Icon(
                      Icons.chat_bubble_outline_rounded,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 13.0),
                    child: Icon(
                      Icons.near_me_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  )
                ],
              ),
              Icon(
                Icons.bookmark_border,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 12.0),
          child: Row(
            children: [
              Text(
                '133 likes',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: Text(
                    userName,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                const Text(
                  'hello this is my first post ',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            children: [
              Text(
                'view 54 comments',
                style: TextStyle(color: Colors.grey.shade500),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 5),
          child: Row(
            children: [
              Text(
                '2 days ago',
                style: TextStyle(color: Colors.grey.shade500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
