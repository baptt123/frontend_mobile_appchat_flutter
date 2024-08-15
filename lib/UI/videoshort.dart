import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(VideoApp());
}

class VideoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VideoUIShort(),
    );
  }
}

class VideoUIShort extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VideoUIShortState();
}

class VideoUIShortState extends State<VideoUIShort> {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() async {
    videoPlayerController =
        VideoPlayerController.asset('assets/video/video_ngan.mp4');
    await videoPlayerController.initialize();

    setState(() {
      chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        showControls: false,
        looping: true,
      );
    });
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: chewieController!=null?Chewie(controller: chewieController!):Center(
        child: CircularProgressIndicator(),
      ),
    );


  }
}
