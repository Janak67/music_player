import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:music_player/screen/video/provider/video_provider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../../utils/color.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  @override
  void initState() {
    super.initState();
    context.read<VideoProvider>().videoPlayerController =
        VideoPlayerController.asset('assets/video/BROOM_BROOM.mp4')
          ..initialize().then((value) {
            setState(() {});
          });
    context.read<VideoProvider>().controller = ChewieController(
        videoPlayerController:
            context.read<VideoProvider>().videoPlayerController!);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) async {
        await context.read<VideoProvider>().controller?.pause();
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: white),
            backgroundColor: black,
          ),
          backgroundColor: black,
          body: Align(
            alignment: AlignmentDirectional.topStart,
            child: SizedBox(
              height: 380,
              width: MediaQuery.sizeOf(context).width,
              child:
                  Chewie(controller: context.read<VideoProvider>().controller!),
            ),
          ),
        ),
      ),
    );
  }
}
