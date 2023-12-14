import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController? videoPlayerController;
  ChewieController? controller;

  @override
  void initState() {
    super.initState();
    videoPlayerController =
        VideoPlayerController.asset('assets/video/BROOM_BROOM.mp4')
          ..initialize().then((value) {
            setState(() {});
          });
    controller =
        ChewieController(videoPlayerController: videoPlayerController!);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: SizedBox(
        height: 380,
        width: MediaQuery.sizeOf(context).width,
        child: Chewie(controller: controller!),
      ),
    );
  }
}
