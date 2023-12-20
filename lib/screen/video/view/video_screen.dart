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
            itemCount: 4,
            itemBuilder: (context, index, realIndex) {
              return InkWell(
                  onTap: () {
                    providerr!.changIndex(index);
                    Navigator.pushNamed(context, 'music');
                  },
                  child: Image.asset('${providerw!.videoList[index].image}'));
            },
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              autoPlayInterval: const Duration(seconds: 2),
              onPageChanged: (index, reason) {
                providerr!.changeIndexSlider(index);
              },
              initialPage: providerr!.sliderIndex,
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              4,
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
                    Navigator.pushNamed(context, 'video');
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
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: white,
                  ),
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
      height: 8,
      width: 8,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index == providerw!.sliderIndex ? blue : white),
    );
  }
}
