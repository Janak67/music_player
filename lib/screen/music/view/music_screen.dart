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
    return ListView.builder(
      itemCount: providerw!.musicList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            onTap: () {
              providerr!.changIndex(index);
              Navigator.pushNamed(context, 'music');
            },
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "${providerw!.musicList[index].image}",
                height: 80,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              "${providerw!.musicList[index].title}",
              style: TextStyle(color: white, fontSize: 20),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: white,
            ),
          ),
        );
      },
    );
  }
}
