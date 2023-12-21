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
  VideoProvider? providerr;
  VideoProvider? providerw;

  @override
  void initState() {
    super.initState();
    context.read<VideoProvider>().videoPlayerController =
        VideoPlayerController.asset(
            '${context.read<VideoProvider>().videoList[context.read<VideoProvider>().index].video}')
          ..initialize().then((value) {
            setState(() {});
          });
    context.read<VideoProvider>().controller = ChewieController(
        videoPlayerController:
            context.read<VideoProvider>().videoPlayerController!);
  }

  @override
  Widget build(BuildContext context) {
    providerr = context.read<VideoProvider>();
    providerw = context.watch<VideoProvider>();
    return PopScope(
      onPopInvoked: (didPop) async {
        await context.read<VideoProvider>().controller?.pause();
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              '${providerw!.videoList[providerw!.index].title}',
              style: TextStyle(color: white),
            ),
            iconTheme: IconThemeData(color: white),
            backgroundColor: black,
          ),
          backgroundColor: black,
          body: Center(
            child: SizedBox(
              height: 240,
              width: double.infinity,
              child:
                  Chewie(controller: context.read<VideoProvider>().controller!),
            ),
          ),
        ),
      ),
    );
  }
}
