import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/color.dart';
import '../provider/music_provider.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  MusicProvider? providerr;
  MusicProvider? providerw;

  @override
  Widget build(BuildContext context) {
    providerr = context.read<MusicProvider>();
    providerw = context.watch<MusicProvider>();
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
                  Navigator.pushNamed(context, 'musicPlayer');
                },
                child: Container(
                  height: MediaQuery.sizeOf(context).height*0.4,
                  width: MediaQuery.sizeOf(context).width,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('${providerw!.musicList[index].image}'),
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
              initialPage: providerr!.sliderIndex,
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
            itemCount: providerw!.musicList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  onTap: () {
                    providerr!.changIndex(index);
                    Navigator.pushNamed(context, 'musicPlayer');
                  },
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "${providerw!.musicList[index].image}",
                      height: 90,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    "${providerw!.musicList[index].title}",
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
