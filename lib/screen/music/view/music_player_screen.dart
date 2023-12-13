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
          title: Text(
            "Mx Player",
            style: TextStyle(fontSize: 25, color: white),
          ),
          centerTitle: true,
          backgroundColor: black,
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "${providerw!.musicList[providerw!.index].image}",
                  height: MediaQuery.sizeOf(context).height * 0.30,
                  width: MediaQuery.sizeOf(context).width * 0.60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "${providerw!.musicList[providerw!.index].title}",
                style: TextStyle(color: white, fontSize: 25),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back,
                      color: white,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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
                      providerw!.isPlay ? Icons.pause : Icons.play_arrow,
                      color: white,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 10),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward,
                      color: white,
                      size: 30,
                    ),
                  ),
                ],
              ),
              PlayerBuilder.currentPosition(
                player: player,
                builder: (context, position) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Slider(
                      min: 0,
                      max: providerr!.totalDuration.inSeconds.toDouble(),
                      value: position.inSeconds.toDouble(),
                      activeColor: green,
                      onChanged: (value) {
                        player.seek(
                          Duration(
                            seconds: value.toInt(),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Text(
                            "$position",
                            style: TextStyle(color: white, fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            "${providerw!.totalDuration}",
                            style: TextStyle(color: white, fontSize: 15),
                          ),
                        ],
                      ),
                    )
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
