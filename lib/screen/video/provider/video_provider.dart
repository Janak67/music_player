import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../model/video_model.dart';

class VideoProvider with ChangeNotifier {
  List<VideoModel> videoList = [
    VideoModel(
        title: 'Animal',
        image: 'assets/img/arjan-vailly.jpg',
        video: 'assets/video/ANIMAL__ARJAN_VAILLY.mp4'),
    VideoModel(
        title: 'Pathaan',
        image: 'assets/img/pathaan.jpeg',
        video: 'assets/video/Jhoome_Jo_Pathaan.mp4'),
    VideoModel(
        title: 'Tiger 3',
        image: 'assets/img/tiger3.png',
        video: 'assets/video/Leke_Prabhu_Ka_Naam.mp4'),
    VideoModel(
        title: 'Animal',
        image: 'assets/img/animal.png',
        video: 'assets/video/JAMAL_KUDU.mp4'),
  ];
  int index = 0;
  VideoPlayerController? videoPlayerController;
  ChewieController? controller;

  void changIndex(int i) {
    index = i;
    notifyListeners();
  }
}
