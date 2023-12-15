import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../model/video_model.dart';

class VideoProvider with ChangeNotifier {
  List<VideoModel> videoList = [
    VideoModel(title: 'BROOM BROOM', image: 'assets/img/khajurbhai.jpg')
  ];
  int index = 0;
  VideoPlayerController? videoPlayerController;
  ChewieController? controller;

  void changIndex(int i) {
    index = i;
    notifyListeners();
  }
}
