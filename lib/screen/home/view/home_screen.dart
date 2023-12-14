import 'package:flutter/material.dart';
import 'package:music_player/screen/music/view/music_screen.dart';
import 'package:music_player/screen/video/view/video_player_screen.dart';
import 'package:music_player/utils/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: black,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: black,
            title: Text(
              'Music Player',
              style: TextStyle(color: white),
            ),
            bottom: TabBar(
              indicatorColor: white,
              labelColor: white,
              tabs: const [
                Tab(icon: Icon(Icons.music_note), text: 'Music'),
                Tab(icon: Icon(Icons.video_collection), text: 'Video'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              MusicScreen(),
              VideoPlayerScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
