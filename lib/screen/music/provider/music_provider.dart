import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import '../model/music_model.dart';

class MusicProvider with ChangeNotifier {
  List<MusicModel> musicList = [
    MusicModel(
        image: 'assets/img/fighter.jpg',
        music: 'assets/music/Sher Khul Gaye.mp3',
        title: 'Fighter',
        subTitle: 'Vishal-Sheykhar, Benny Dayal, Shilpa Rao'),
    MusicModel(
        image: 'assets/img/animal.png',
        music: 'assets/music/Jamal Kudu.mp3',
        title: 'Animal',
        subTitle: 'Harshavardhan Rameshwar'),
    MusicModel(
        image: 'assets/img/kalaastar.jpg',
        music: 'assets/music/Kalaastar.mp3',
        title: 'Kalaastar',
        subTitle: 'Gill Machhrai, Rony Ajnali, Yo Yo Honey Singh'),
    MusicModel(
        image: 'assets/img/what-jhumka.png',
        music: 'assets/music/What Jhumka.mp3',
        title: 'What Jhumka ?',
        subTitle:
            'Arijit Singh, Jonita Gandhi, Ranveer Singh, Madan Mohan, Pritam'),
    MusicModel(
        image: 'assets/img/tiger3.png',
        music: 'assets/music/Tiger3.mp3',
        title: 'Leke Prabhu ka Naam',
        subTitle: 'Pritam.Arijit Singh.Nikhita Gandhi'),
    MusicModel(
        image: 'assets/img/pathaan.jpeg',
        music: 'assets/music/Jhoome.mp3',
        title: 'Jhoome Jo Pathaan',
        subTitle: 'Vishal-Shekhar.Sanchit Balhara.Ankit Balhara'),
    MusicModel(
        image: 'assets/img/high-heels.jpg',
        music: 'assets/music/High Heels.mp3',
        title: 'High Heels - Ki and Ka',
        subTitle: 'Yo Yo Honey Singh'),
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
