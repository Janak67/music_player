import 'package:flutter/material.dart';
import 'package:music_player/screen/music/provider/music_provider.dart';
import 'package:music_player/screen/music/view/music_screen.dart';
import 'package:music_player/screen/video/view/video_screen.dart';
import 'package:music_player/utils/color.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MusicProvider? providerr;
  MusicProvider? providerw;
  List<Widget> screen = [
    const MusicScreen(),
    const VideoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    providerr = context.read<MusicProvider>();
    providerw = context.watch<MusicProvider>();
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: black,
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: BottomNavigationBar(
                backgroundColor: teal,
                currentIndex: providerw!.index,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.music_note, size: 30, color: black),
                      label: 'Music'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.video_collection, size: 30, color: black),
                      label: 'Video'),
                ],
                unselectedLabelStyle: TextStyle(
                    color: black, fontWeight: FontWeight.bold, fontSize: 16),
                selectedLabelStyle: TextStyle(
                    color: black, fontWeight: FontWeight.bold, fontSize: 16),
                onTap: (value) {
                  int i = value;
                  providerr!.changIndex(i);
                },
              ),
            ),
          ),
          body: screen[providerw!.index],
        ),
      ),
    );
  }
}
