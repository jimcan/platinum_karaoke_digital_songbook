import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'models/song_model.dart';
import 'pages/home.dart';
import 'common/theme.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => SongModel(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Theme.of(context).brightness == Brightness.dark
            ? Brightness.dark
            : Brightness.light,
      ),
    );

    return MaterialApp(
      title: 'Platinum Karaoke Digital Songbook',
      color: Colors.deepPurple,
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
