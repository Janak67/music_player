import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:music_player/screen/video/provider/video_provider.dart';
import 'package:provider/provider.dart';

import '../../../utils/color.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoProvider? providerr;
  VideoProvider? providerw;

  @override
  Widget build(BuildContext context) {
    providerr = context.read<VideoProvider>();
    providerw = context.watch<VideoProvider>();
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: CarouselSlider.builder(
            itemCount: 5,
            itemBuilder: (context, index, realIndex) {
              return InkWell(
                onTap: () {
                  providerr!.changIndex(index);
                  Navigator.pushNamed(context, 'videoPlayer');
                },
                child: Image.asset(
                  '${providerw!.videoList[index].image}',
                  fit: BoxFit.cover,
                  height: 200,
                  width: 240,
                ),
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              autoPlayInterval: const Duration(seconds: 2),
              onPageChanged: (index, reason) {
                providerr!.changeIndexSlider(index);
              },
              initialPage: providerw!.sliderIndex,
            ),
          ),
        ),
        SizedBox(
          height: 40,
          width: MediaQuery.sizeOf(context).width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => containerTile(index),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: providerw!.videoList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  onTap: () {
                    providerr!.changIndex(index);
                    Navigator.pushNamed(context, 'videoPlayer');
                  },
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "${providerw!.videoList[index].image}",
                      height: 110,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    "${providerw!.videoList[index].title}",
                    style: TextStyle(color: white, fontSize: 18),
                  ),
                  trailing:
                      Icon(Icons.arrow_forward_ios, color: white, size: 18),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Container containerTile(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 7,
      width: 7,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index == providerw!.sliderIndex ? blue : white),
    );
  }
}
