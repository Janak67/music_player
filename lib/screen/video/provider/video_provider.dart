import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../model/video_model.dart';

class VideoProvider with ChangeNotifier {
  List<VideoModel> videoList = [
    VideoModel(
        title: 'ICC T20 World_Cup',
        image: 'assets/img/india vs pak.jpg',
        video: 'assets/video/ICC_T20_World_Cup_2022.mp4'),
    VideoModel(
        title: 'Justin Bieber',
        image: 'assets/img/justin_bieber.jpg',
        video: 'assets/video/Justin_Bieber.mp4'),
    VideoModel(
        title: 'Animal',
        image: 'assets/img/arjan-vailly.jpg',
        video: 'assets/video/ANIMAL__ARJAN_VAILLY.mp4'),
    VideoModel(
        title: 'Shakira',
        image: 'assets/img/shakira.jpg',
        video: 'assets/video/Shakira.mp4'),
    VideoModel(
        title: 'Don Omar',
        image: 'assets/img/don_omar.jpg',
        video: 'assets/video/Don_Omar.mp4'),
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
    VideoModel(
        title: 'Hold Me',
        image: 'assets/img/Hold-Me.jpg',
        video: 'assets/video/Hold_Me.mp4'),
  ];
  int index = 0;
  VideoPlayerController? videoPlayerController;
  ChewieController? controller;
  int sliderIndex = 0;

  void changIndex(int i) {
    index = i;
    notifyListeners();
  }

  void changeIndexSlider(int i) {
    sliderIndex = i;
    notifyListeners();
  }
}
