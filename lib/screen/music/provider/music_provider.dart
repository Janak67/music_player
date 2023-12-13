import 'package:flutter/material.dart';

import '../model/music_model.dart';

class MusicProvider with ChangeNotifier {
  List<MusicModel> musicList = [
    MusicModel(
        image: "assets/img/animal.png",
        music: "assets/music/Jamal Kudu.mp3",
        title: "Animal"),
    MusicModel(
        image: "assets/img/pathaan.jpeg",
        music: "assets/music/Jhoome.mp3",
        title: "Pathaan"),
    MusicModel(
        image: "assets/img/tiger3.png",
        music: "assets/music/Tiger3.mp3",
        title: "Tiger 3"),
  ];

  bool isPlay = false;
  Duration totalDuration = const Duration(seconds: 0);
  int index = 0;

  void changIndex(int i) {
    index = i;
    notifyListeners();
  }

  void changTotalDuration(Duration d1) {
    totalDuration = d1;
    notifyListeners();
  }

  void changeStatus(bool status) {
    isPlay = status;
    notifyListeners();
  }
}
