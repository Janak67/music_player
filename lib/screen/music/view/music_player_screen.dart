import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/color.dart';
import '../provider/music_provider.dart';

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({Key? key}) : super(key: key);

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  AssetsAudioPlayer player = AssetsAudioPlayer();

  MusicProvider? providerr;
  MusicProvider? providerw;

  @override
  void initState() {
    super.initState();
    player.open(
        Audio(
            "${context.read<MusicProvider>().musicList[context.read<MusicProvider>().index].music}"),
        autoStart: false,
        showNotification: true);

    player.current.listen((event) {
      Duration d1 = event!.audio.duration;
      context.read<MusicProvider>().changTotalDuration(d1);
    });
  }

  @override
  Widget build(BuildContext context) {
    providerr = context.read<MusicProvider>();
    providerw = context.watch<MusicProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: white),
          title: Text(
            "Mx Player",
            style: TextStyle(fontSize: 25, color: white),
          ),
          centerTitle: true,
          backgroundColor: black,
          actions: [
            Icon(Icons.share_outlined, color: white),
          ],
        ),
        backgroundColor: black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  '${providerw!.musicList[providerw!.index].image}',
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  width: MediaQuery.sizeOf(context).width * 0.6,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '${providerw!.musicList[providerw!.index].title}',
                style: TextStyle(
                  color: white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Tanishk Bagchi, Vishal Dadlani",
                style: TextStyle(fontSize: 12, color: white),
              ),
              PlayerBuilder.currentPosition(
                player: player,
                builder: (context, position) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Slider(
                      activeColor: white,
                      inactiveColor: Colors.grey.shade900 ,
                      value: position.inSeconds.toDouble(),
                      onChanged: (value) {
                        player.seek(
                          Duration(seconds: value.toInt()),
                        );
                      },
                      min: 0,
                      max: providerr!.totalDuration.inSeconds.toDouble(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Text(
                            '$position',
                            style: TextStyle(color: white, fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            '${providerw!.totalDuration}',
                            style: TextStyle(color: white, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.shuffle, color: white),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.skip_previous,
                            size: 40,
                            color: white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (providerr!.isPlay == false) {
                              player.play();
                              providerr!.changeStatus(true);
                            } else {
                              player.pause();
                              providerr!.changeStatus(false);
                            }
                          },
                          icon: Icon(
                            providerw!.isPlay
                                ? Icons.pause_circle
                                : Icons.play_circle,
                            size: 60,
                            color: white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.skip_next,
                            color: white,
                            size: 40,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.repeat,
                            color: white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
