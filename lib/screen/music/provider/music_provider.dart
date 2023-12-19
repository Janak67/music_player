import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import '../model/music_model.dart';

class MusicProvider with ChangeNotifier {
  List<MusicModel> musicList = [
    MusicModel(
        image: 'assets/img/animal.png',
        music: 'assets/music/Jamal Kudu.mp3',
        title: 'Animal',
        subTitle: 'Harshavardhan Rameshwar'),
    MusicModel(
        image: 'assets/img/pathaan.jpeg',
        music: 'assets/music/Jhoome.mp3',
        title: 'Pathaan',
        subTitle: 'Vishal-Shekhar.Sanchit Balhara.Ankit Balhara'),
    MusicModel(
        image: 'assets/img/tiger3.png',
        music: 'assets/music/Tiger3.mp3',
        title: 'Tiger 3',
        subTitle: 'Pritam.Arijit Singh.Nikhita Gandhi'),
  ];

  bool isPlay = false;
  Duration totalDuration = const Duration(seconds: 0);
  int index = 0;
  AssetsAudioPlayer player = AssetsAudioPlayer();
  int sliderIndex = 0;

  void changeIndexSlider(int i) {
    sliderIndex = i;
    notifyListeners();
  }

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
