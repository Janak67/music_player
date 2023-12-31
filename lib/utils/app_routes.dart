import 'package:flutter/material.dart';
import 'package:music_player/screen/music/view/music_player_screen.dart';
import 'package:music_player/screen/splash/view/splash_screen.dart';
import 'package:music_player/screen/video/view/video_player_screen.dart';

import '../screen/home/view/home_screen.dart';

Map<String, WidgetBuilder> screen_Routes = {
  '/': (context) => const SplashScreen(),
  'home': (context) => const HomeScreen(),
  'musicPlayer': (context) =>  const MusicPlayerScreen(),
  'videoPlayer': (context) =>  const VideoPlayerScreen(),
};
