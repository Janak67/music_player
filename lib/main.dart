import 'package:flutter/material.dart';
import 'package:music_player/screen/music/provider/music_provider.dart';
import 'package:music_player/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MusicProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        routes: screen_Routes,
      ),
    ),
  );
}
