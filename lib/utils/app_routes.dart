import 'package:flutter/material.dart';
import 'package:music_player/screen/music/view/music_player_screen.dart';
import 'package:music_player/screen/video/view/video_player_screen.dart';

import '../screen/home/view/home_screen.dart';

Map<String, WidgetBuilder> screen_Routes = {
  '/': (context) => const HomeScreen(),
  'music': (context) =>  const MusicPlayerScreen(),
  'video': (context) =>  const VideoPlayerScreen(),
};
