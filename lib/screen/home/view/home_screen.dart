import 'package:flutter/material.dart';
import 'package:music_player/screen/home/view/music_screen.dart';
import 'package:music_player/screen/music/view/music_player_screen.dart';

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
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Music Player'),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.music_note), text: 'Music'),
                Tab(icon: Icon(Icons.video_collection), text: 'Video'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              MusicScreen(),
              MusicPlayerScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
