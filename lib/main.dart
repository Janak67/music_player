import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_player/screen/home/provider/home_provider.dart';
import 'package:music_player/screen/music/provider/music_provider.dart';
import 'package:music_player/screen/video/provider/video_provider.dart';
import 'package:music_player/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ],
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MusicProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => VideoProvider(),
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
