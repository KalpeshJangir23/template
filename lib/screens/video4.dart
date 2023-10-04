import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Video4 extends StatefulWidget {
  const Video4({super.key});

  @override
  State<Video4> createState() => _Video4State();
}

var httpsUri = Uri(scheme: 'https', host: 'commondatastorage.googleapis.com', path: '/gtv-videos-bucket/sample/BigBuckBunny.mp4');

// http://techslides.com/demos/sample-videos/small.mp4
// https://gemootest.s3.us-east-2.amazonaws.com/s/res/514885813225336832/a7cfdf395521124d14f2b210b49b4fc8.mp4?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIARLZICB6QQHKRCV7K%2F20231004%2Fus-east-2%2Fs3%2Faws4_request&X-Amz-Date=20231004T120911Z&X-Amz-SignedHeaders=host&X-Amz-Expires=7200&X-Amz-Signature=552b44fc28f976584de060019dc08125cb4932ce1e27149a53ef12f91fa90dd1
// https://gemoo.com/tools/upload-video/share/568161567466340352?codeId=M03EbLX9EZGRX&card=568161562789687296&origin=videolinkgenerator
// https://dart.dev/guides/libraries/library-tour#numbers

String mango = "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";

// https://www.youtube.com/embed/3gKvYR0P2F0
class _Video4State extends State<Video4> {
  final FlickManager flickManager = FlickManager(videoPlayerController: VideoPlayerController.networkUrl(httpsUri));

  @override
  Widget build(BuildContext context) {
    return (Container(
      child: AspectRatio(
        child: FlickVideoPlayer(
          flickManager: flickManager,
        ),
        aspectRatio: 16 / 9,
      ),
    ));
  }
}
